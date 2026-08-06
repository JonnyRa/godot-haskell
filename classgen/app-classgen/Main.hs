import Classgen.Module
import Classgen.Spec
import Control.Lens
import Control.Monad.State
import Data.Maybe (mapMaybe)
import Data.Aeson
import qualified Data.ByteString.Lazy as BL
import qualified Data.HashMap.Strict as HM
import Language.Haskell.Exts
import Language.Haskell.Exts.SimpleComments
import System.Directory
import System.Environment
import System.Exit
import System.FilePath
import Control.Applicative
import qualified Classgen.Docs as D
import qualified Data.HashMap.Strict as H
import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.HashSet (HashSet)
import qualified Data.HashSet as HashSet
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map
import Control.Arrow

main :: IO ()
main = do
  args <- getArgs
  when (length args /= 3) $ do
    putStrLn "See the godot-haskell README.md for instructions"
    putStrLn "godot-haskell-classgen <api.json> <godot_doc_classes.json> <godot-haskell-root>"
    exitFailure
  api <- BL.readFile (args !! 0)
  let decodeErr x = either error id (eitherDecode x)
  let (Just classes) = decodeErr api :: Maybe GodotClasses
  doc <- BL.readFile (args !! 1)
  let (Just docs) = decodeErr doc :: Maybe D.GodotDocs
  let godotHaskellRootDir = args !! 2
  let docTable = D.toTable docs
  let state = execState (mapM_ (\cls -> addClass cls (H.lookup (_gcName cls) docTable
                                                     <|> (T.stripPrefix "Godot_" (_gcName cls)
                                                          >>= \r -> H.lookup r docTable)
                                                     <|> (T.stripPrefix "Godot" (_gcName cls)
                                                          >>= \r -> H.lookup r docTable)
                                                     <|> (T.stripPrefix "_"  (_gcName cls)
                                                          >>= \r -> H.lookup r docTable)
                                                     <|> (H.lookup  ("_" <> (_gcName cls)) docTable)
                                                    ) classes) classes)
                        (ClassgenState mempty mempty mempty)
  writeModule godotHaskellRootDir $ godotApiTypes (state ^. tyDecls) classes
  mapM_ (writeModule godotHaskellRootDir) (HM.elems (state ^. modules))
  where
  --this is the Godot/Api/Types.hs generator.  The file name comes from the module name
  godotApiTypes :: [Decl (Maybe CodeComment)] -> GodotClasses -> Module (Maybe CodeComment)
  godotApiTypes decls classes = Module Nothing (Just
                                          $ ModuleHead Nothing (ModuleName Nothing "Godot.Api.Types") Nothing
                                          $ Just (classExports decls))
                          [LanguagePragma Nothing [Ident Nothing "DerivingStrategies"
                                                  ,Ident Nothing "GeneralizedNewtypeDeriving"
                                                  ,Ident Nothing "TypeFamilies"
                                                  ,Ident Nothing "TemplateHaskell"]]
                          classImports
                          (decls ++ snd derivingCalls)
    where
    classExports decls   = ExportSpecList Nothing $ tcHasBaseClass : mapMaybe fromNewtypeOnly decls
      where
      tcHasBaseClass       = fmap (\_ -> Nothing) $ EThingWith () (EWildcard () 0) (UnQual () (Ident () "HasBaseClass")) []
      fromNewtypeOnly decl = case decl of
        DataDecl _ (NewType _) _ (DHead _ (Ident Nothing ntName)) _ _ ->
          Just $ EThingWith Nothing (EWildcard Nothing 0) (UnQual Nothing (Ident Nothing ntName)) []
        _ ->
          Nothing
    derivingCalls :: (HashSet Text, [Decl (Maybe CodeComment)])
    derivingCalls = foldr fromNewtypeDerivingBase (HashSet.empty, []) classList
      where
      namedClasses :: Map Text GodotClass
      namedClasses = Map.fromList $ map (\aClass -> (_gcName aClass, aClass)) classList
      classList :: [GodotClass]
      classList = toList classes

      fromNewtypeDerivingBase :: GodotClass -> (HashSet Text, [Decl (Maybe CodeComment)]) -> (HashSet Text, [Decl (Maybe CodeComment)])
      fromNewtypeDerivingBase godotClass currentState@(classesAlreadyOutput, _output) =
        if baseClassName == "" || HashSet.member baseClassName classesAlreadyOutput
        then outputCurrent currentState
        else 
          case Map.lookup baseClassName namedClasses of
            Nothing -> error $ "couldn't find class " <> T.unpack baseClassName
            Just baseClass -> outputCurrent $ fromNewtypeDerivingBase baseClass currentState
        where
        baseClassName :: Text
        baseClassName = _gcBaseClass godotClass
        className :: Text
        className = _gcName godotClass
        outputCurrent :: (HashSet Text, [Decl (Maybe CodeComment)]) -> (HashSet Text, [Decl (Maybe CodeComment)])
        outputCurrent = HashSet.insert className *** (deriveBaseCall:)
        deriveBaseCall :: Decl (Maybe CodeComment)
        deriveBaseCall = 
          SpliceDecl Nothing (App Nothing (Var Nothing (UnQual Nothing (Ident Nothing "deriveBase")))
                                  (TypQuote Nothing (UnQual Nothing (Ident Nothing $ T.unpack $ className))))

    classImports = map (\n -> ImportDecl Nothing (ModuleName Nothing n) False False False Nothing Nothing Nothing)
      [ "Data.Coerce", "Foreign.C", "Godot.Internal.Dispatch", "Godot.Gdnative.Internal"]

writeModule :: FilePath -> Module (Maybe CodeComment) -> IO ()
writeModule godotHaskellRootDir mdl@(Module _ (Just (ModuleHead _ (ModuleName Nothing name) _ _)) _ _ _) = do
  let filepath = godotHaskellRootDir </> "src/" ++ map replaceDot name ++ ".hs"
  -- let out = prettyPrint mdl
  let out = uncurry exactPrint (ppWithComments mdl)
  createDirectoryIfMissing True (takeDirectory filepath)
  writeFile filepath out
  where
    replaceDot '.' = '/'
    replaceDot c = c
