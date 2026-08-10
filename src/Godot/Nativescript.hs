{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TupleSections #-}
module Godot.Nativescript
  ( ClassName
  , GFunc
  , GdnativeHandle
  , NativeScript(..)
  , ClassMethod(..)
  , ClassProperty(..)
  , ClassSignal
  , RPC(..)
  , Registerer(..)
  , PropertyAttributes(..)
  , SignalArgument(..)
  , deriveBase
  , func
  , method
  , method0
  , method1
  , method2
  , method3
  , method4
  , method5
  , nameOf
  , registerClass
  , registerProperty
  , registerSignal
  , registerMethod
  , signal
  , tryCast
  , tryCast'
  , tryObjectCast
  , asNativeScript
  , convertClassName
  , unConvertClassName
  , getNode
  , getNodeNativeScript
  , new
  , newNativeScript
  , getSingleton
  , getEngine
  , copyVariant
  , scriptDesc
  , defaultExports
  , await
  , WrapperStablePtr(..)
  , createMVarProperty
  , guardError
  , getError
  , GodotError(..)
  , SceneConnection
  , SceneNode(..)
  , SceneRoot(..)
  , SceneResourcePath(..)
  , derivePrerequisites
  , NodeInit(..)
  , setupNode
  , getNode'
  , createMVarProperty'
  , emit_signal'
  , PackedScene' (..)
  , await'
  , getNodeNativeScript'
  , OneResourceNode
  , registerAll'

  )
where

import           Control.Monad

import           Data.Typeable
import           Data.Text                                ( Text )
import qualified Data.Text                     as T
import qualified Data.Vector                   as Vec
import qualified Data.Vector                   as V

import           Control.Concurrent.MVar

import           Foreign                           hiding (void,new)
import           Foreign.C

import           System.Environment
import           System.IO.Unsafe

import qualified Godot.Gdnative.Internal as GNI
import           Godot.Gdnative
import           Godot.Internal.Dispatch
import qualified Foreign.Marshal as F
import qualified Foreign.C                     as Foreign

import Godot.Api hiding (NativeScript)
import qualified Godot.Api                     as Api
import qualified Data.Map.Strict as M
import           Data.Coerce
import qualified Godot.Core.NativeScript as NativeScript
import           Godot.Core.GlobalConstants
import           Godot.Core.Engine
import           Godot.Core.Node
import           Godot.Core.Object as Object
import           Godot.Core.Reference
import           Data.IORef
import           Control.Monad.Extra
import           Control.Exception
import           Data.Maybe
import Godot.Nativescript.Types

import           Control.Lens hiding (to, from)

import           Data.List

import           GHC.TypeLits

import           Godot.Core.PackedScene
import           Godot.Core.ResourceLoader

import           Language.Haskell.TH
import           Language.Haskell.TH.Datatype
import qualified Data.Kind as Kind

-- * Helper to keep Haskell types in sync with the Godot project.
newtype PackedScene' (scene :: Symbol) = PackedScene' PackedScene
  deriving newtype AsVariant

instance HasBaseClass (PackedScene' scene) where
  type BaseClass (PackedScene' scene) = Api.PackedScene

  super = coerce

deriveBase ''PackedScene'

-- | Use this to register all of your classes, it makes sure that you don't
-- forget a class that Godot needs.
--
-- exports :: GdnativeHandle -> IO ()
-- exports desc = registerAll' @Nodes @'[HUD, Main, Mob, Player] desc
registerAll'
  :: forall (res :: [Kind.Type]) (ns :: [Kind.Type]). ImplementedInHaskell res ns => GdnativeHandle -> IO ()
registerAll' = fill @res @ns

-- | A safe version of getNode; gives you back the Godot object
-- getNode' @"MobPath/MobSpawnLocation" self
getNode' :: forall label b cls scene name.
         ( Object :< cls
         , Node :< cls
         , Node :< b
         , NodeInScene scene name cls
         , SceneNode scene label
         , SceneNodeType scene label ~ b
         , KnownSymbol label)
         => cls
         -> IO b
getNode' o = getNode @(SceneNodeType scene label) o (T.pack $ symbolVal (Proxy @label))

-- | A safe version of getNodeNativeScript; gives you back the Haskell object
-- getNodeNativeScript' @"HUD" self
getNodeNativeScript'
  :: forall label b cls scene name scene' label'.
  ( NativeScript b
  , Node :< cls
  , Object :< cls
  , NodeInScene scene name cls
  , SceneNodeIsHaskell scene label ~ 'Just '(scene', label')
  , NodeInScene scene' label' b
  , KnownSymbol label)
  => cls
  -> IO b
getNodeNativeScript' cls = getNodeNativeScript @b cls (T.pack $ symbolVal (Proxy @label))

-- | A safe version of emit_signal; will error at compile time if the signal doesn't exist
-- emit_signal' @"hit" self []
-- TODO We don't check arguments yet!
emit_signal' :: forall label args cls.
             (Object :< cls, Object :< cls, NodeSignal cls label args, KnownSymbol label)
             => cls
             -> [Variant 'GodotTy]
             -> IO ()
emit_signal' cls args = do
  name <- toLowLevel (T.pack $ symbolVal (Proxy @label))
  emit_signal cls name args

-- | A safe version of await; will error at compile time if the signal and nodes don't exist
-- await' @"MessageTimer" @"timeout" self $ \self' -> pure ()
await' :: forall (label :: Symbol) (signal :: Symbol) a b cls scene name.
       ( NodeInScene scene name cls
       , KnownSymbol label
       , KnownSymbol signal
       , SceneNode scene label
       , Typeable cls
       , Object :< cls
       , Node :< cls
       , AsVariant a
       , Node :< SceneNodeType scene label
       , NodeSignal b signal '[]
       , SceneNodeType scene label ~ b)
       => cls
       -> (cls -> IO a)
       -> IO ()
await' o f = do
  n <- getNode' @label o
  await o n (T.pack $ symbolVal (Proxy @signal)) f

-- | Preload a scene so you can instantiate it later.
-- Use this when the scene is known ahead of time. Store scenes in as @PackedScene' "SceneName"@
preloadScene
  :: forall scene. (KnownSymbol scene, SceneResourcePath scene) => IO (PackedScene' scene)
preloadScene = do
  Just r <- getSingleton @ResourceLoader
  path <- toLowLevel $ sceneResourcePath @scene
  PackedScene' <$> (tryCast' =<< load r path Nothing Nothing)

-- | Create an instance of a scene from a @PackedScene' "SceneName"@
-- Makes sure that you are getting the type of the scene root.
sceneInstance :: forall scene o.
              (Node :< o, Typeable o, AsVariant o, SceneNodeType scene (SceneRootNode scene) ~ o)
              => PackedScene' scene
              -> IO o
sceneInstance e = tryCast' =<< instance' e Nothing

-- | Combines nodeMethod with getNode' to call functions in a type-safe way
-- Provides no additional safety compared to using the two separately, but does clean up code a bit.
-- For example: callMethod @"MyNode" @"hide" self
callMethod :: forall (node :: Symbol) (func :: Symbol) scene name cls args ret b.
   ( Object :< cls
   , Node :< cls
   , Node :< SceneNodeType scene node
   , NodeInScene scene name cls
   , SceneNode scene node
   , NodeMethodSuper (SceneNodeType scene node) func args ret
   , ListToFun args ret ~ IO b
   , KnownSymbol node)
   => cls
   -> IO b
callMethod self = nodeMethod' @_ @func =<< getNode' @node self

-- | Get the file path to the scene
class SceneResourcePath (scene :: Symbol) where
  sceneResourcePath :: forall scene. T.Text

-- * Internal helpers: You won't use these
-- | The root node of a scene
class SceneRoot (scene :: Symbol) where
  type SceneRootNode scene :: Symbol

-- | A node in the scene, we know its type and its name, @s@ is the path relate
-- to the scene
class ( Typeable (SceneNodeType scene s)
      , AsVariant (SceneNodeType scene s)
      , Object :< SceneNodeType scene s) => SceneNode (scene :: Symbol) (s :: Symbol) where
  type SceneNodeType scene s :: Kind.Type

  type SceneNodeName scene s :: Symbol

  type SceneNodeIsHaskell scene s :: Maybe (Symbol, Symbol)

-- | You declare this for your types. You offer up a haskell type, @n@, for the
-- node. This class verifies that your base class is correct.
class (HasBaseClass n, BaseClass n ~ SceneNodeType scene s)
  => NodeInScene (scene :: Symbol) (s :: Symbol) n | scene s -> n, n -> scene s

-- | A connection between nodes in a scene. @from@ and @to@ are paths.
-- It connects @signal@ in @from@ to @method@ in @to@.
class SceneConnection (scene
                       :: Symbol) (from
                                   :: Symbol) (signal :: Symbol) (to :: Symbol) (method :: Symbol)

-- | Internal, just for convenience
data OneResourceNode (resource :: Symbol) (name :: Symbol)

-- | Internal. Don't touch this and don't make instances of it. It's the
-- workhorse for making sure that you are implementing all of the classes that
-- Godot needs, nothing more and nothing less.
class ImplementedInHaskell (a :: [Kind.Type]) (b :: [Kind.Type]) where
  fill :: GdnativeHandle -> IO ()

instance ImplementedInHaskell '[] '[] where
  fill _ = pure ()

registerOne :: forall ty. (NativeScript ty, AsVariant (BaseClass ty)) => GdnativeHandle -> IO ()
registerOne desc = registerClass $ RegClass desc $ classInit @ty

instance ( NodeInScene scene name n
         , NativeScript n
         , AsVariant (BaseClass n)
         , ImplementedInHaskell t t'
         , SceneNodeIsHaskell scene name ~ 'Just '(resource, name))
  => ImplementedInHaskell (OneResourceNode resource name ': t) (n ': t') where
  fill handle = do
    registerOne @n handle
    fill @t @t' handle

-- | Create a signal
-- TODO args ~ '[] is temproary, we need signeltons to reflect this into a runtime value
signal' :: forall cls label args.
        (NodeSignal cls label args, KnownSymbol label, args ~ '[])
        => (Text, [SignalArgument])
signal' = signal (T.pack $ symbolVal (Proxy @label)) []

createMVarProperty'
  :: (Typeable ty, AsVariant ty)
  => Text
  -> (node -> MVar ty)
  -- ^ We typically can't do IO (for initialisation) when calling this, in
  -- which case we need to annotate the type without providing a value.
  -> Either VariantType ty
  -> ( node
       -> IO ty
     , node
       -> ty
       -> IO ()
     , Maybe ( Object
               -> node
               -> IO GodotVariant
             , Object
               -> node
               -> GodotVariant
               -> IO ()
             , PropertyAttributes))
createMVarProperty' name fieldName tyOrVal = (readMVar . fieldName, \c t -> propertySetter p
  undefined c
  =<< toGodotVariant t, Just (propertyGetter p, propertySetter p, propertyAttrs p))
  where
    p = createMVarProperty name fieldName tyOrVal

-- | Verify that the signal connects to an endpoint that exists and has the right type.
witnessConnection
  :: forall (scene
             :: Symbol) (from
                         :: Symbol) (signal
                                     :: Symbol) (to :: Symbol) (method :: Symbol) parent sigTy hTy.
  ( SceneNode scene to
  , NodeSignal parent signal sigTy
    -- TODO This the check unsound, but SceneNodeType isn't right for this constraint. What is?
    -- The warning produced because 'from' is not used is a reminder of this issue.
    -- parent :< SceneNodeType scene from,
  , NodeMethod hTy method sigTy (IO ())
  , NodeInScene scene to hTy)
  => ()
witnessConnection = ()

-- | Sets up a class
class NodeInit n where
  init :: BaseClass n -> IO n

-- | You never implement this. It's a helper so that we can have a more
-- polymorphic call to nodeMethod which will work when the method is implemneted
-- for any parent of the current node.
class NodeMethodSuper node (name :: Symbol) (args :: [Kind.Type]) (ret :: Kind.Type)
  | node name -> args, node name -> ret where
  nodeMethod' :: node -> ListToFun args ret

-- | An instance that supports calling nodeMethod' on your parents This can lead
-- to infinite loops in the type checker on error, so we isolate it in
-- NodeMethodSuper instead of NodeMethod.
instance {-# OVERLAPPABLE #-}(NodeMethod (BaseClass node) name arg ret, HasBaseClass node)
  => NodeMethodSuper node name arg ret where
  nodeMethod' = nodeMethod' @node @name @arg @ret

mkProperty' :: forall node (name :: Symbol) ty.
            (NodeProperty node name ty 'False, KnownSymbol name)
            => ClassProperty node
mkProperty' = ClassProperty (T.pack $ symbolVal (Proxy @name)) a s g
  where (_,_,Just (g,s,a)) = nodeProperty @node @name @ty @'False

derivePrerequisites :: Name -> String -> String -> Q [Dec]
derivePrerequisites typ scene sceneNode = do
  hasBaseClass <- deriveHasBase typ
  classRelations <- deriveBase typ

  nis <- [d|instance NodeInScene $(pure $ LitT $ StrTyLit scene) $(pure $ LitT $ StrTyLit sceneNode) $(pure $ PromotedT typ)|]
  --note classRelations doesn't work as expected here because hasBaseClass must not exist yet
  return (hasBaseClass <> classRelations <> nis)

deriveHasBase :: Name -> Q [Dec]
deriveHasBase ty = do
  rdt <- reifyDatatype ty
  let base = case datatypeCons rdt of
        (c:_) -> case (constructorFields c, constructorVariant c) of
          (ConT baseTy:_, RecordConstructor (baseFn:_)) -> Just (baseTy, baseFn)
          _ -> Nothing
        _     -> Nothing
  case base of
    Just (baseTy, baseFn) ->
      [d|instance HasBaseClass $(pure $ PromotedT ty) where
          type BaseClass $(pure $ PromotedT ty) = $(pure $ PromotedT baseTy)
          super = $(pure $ VarE baseFn)|]
    _ -> error "setupNode can only handle records whose first field is the Godot base class. You can still interface with Godot, but you will need to set things up manually."

-- | You should use this as:
--  derivePrerequisites ''Ty "sceneName" "nodePath"
--  deriveBase ''Ty
--  your nativescript instances and the rest of the file
--  then at the end:
--  setupNode ''Ty "sceneName" "nodePath"
--  This will instantiate everything that your Object needs
--  with the instances required for making NativeScript at the start
--  and then generating the right code to export them after they have all been declared
setupNode :: Name -> String -> String -> Q [Dec]
setupNode ty scene sceneNode = do
  -- Collect information about all scenes
  tree <- map unTree . classInstances <$> reify ''(:<)
  sceneRoots <- M.fromList . map unSceneRootNode . familyInstances <$> reify ''SceneRootNode
  sceneNodes <- map unSceneNodeType . familyInstances <$> reify ''SceneNodeType
  haskellNodes <- map unNodeInScene . classInstances <$> reify ''NodeInScene
  allSignals <- map unNodeSignal . classInstances <$> reify ''NodeSignal
  -- Collect information about our node
  rdt <- reifyDatatype ty
  --
  methods <- filter (\i -> i ^. _1 == ty) . mapMaybe unNodeMethod . classInstances
    <$> reify ''NodeMethod
  properties <- filter (\i -> i ^. _1 == ty) . mapMaybe unNodeProperty . classInstances
    <$> reify ''NodeProperty
  let signals = filter (\i -> i ^. _1 == ty) allSignals
  connections
    <- filter (\i -> i ^. _1 == scene && i ^. _4 == sceneNode) . map unConnect . classInstances
    <$> reify ''SceneConnection
  -- Helpers
  let parentsOf cls = map snd $ filter (\(c, _) -> cls == c) tree
  let nodeToType :: String -> String -> Name
      nodeToType sceneName node = case (hty, typ ^. _4) of
        (Just t, _)      -> t
        (_, Nothing)     -> typ ^. _3
        (_, Just scene') -> case M.lookup scene' sceneRoots of
          Nothing    -> error
            $ "Looking up the root of a scene that is lacking one. This is a bug. "
            ++ show (scene', sceneName, node)
          Just node' -> nodeToType scene' node'
        where
          typ  = fromJust $ find (\n -> n ^. _1 == sceneName && n ^. _2 == node) sceneNodes

          hty = (^. _3) <$> find (\n -> n ^. _1 == sceneName && n ^. _2 == node) haskellNodes
  let resolveSignalActualClass sceneName from signalName =
        case mapMaybe (\p -> (p, ) <$> find (\s -> s ^. _2 == signalName && s ^. _1 == p) allSignals)
        $ parentsOf (nodeToType sceneName from) of
          -- The root issue is that the signal might not yet exist.
          -- If witnessConnection was not unsound, this would not be needed as the error would happen later.
          []    -> error
            $ "Class "
            ++ show from
            ++ " used in scene "
            ++ show sceneName
            ++ " is lacking a signal named "
            ++ show signalName
            ++ "\n"
            ++ show (nodeToType sceneName from)
            ++ "\n"
            ++ show (parentsOf (nodeToType sceneName from))
          (h:_) -> h ^. _1

  -- Debug
  when False $ runIO $ do
    putStrLn "Regenerating .."
    print rdt
    putStrLn "\nScene roots:"
    print sceneRoots
    putStrLn "\nScene nodes types:"
    mapM_ print sceneNodes
    putStrLn "\nMethods:"
    mapM_ print methods
    putStrLn "\nProperties:"
    mapM_ print properties
    putStrLn "\nSignals:"
    mapM_ print allSignals
    mapM_ print signals
    putStrLn "\nConnections:"
    mapM_ print connections
    putStrLn "\nHaskell nodes:"
    mapM_ print haskellNodes

  -- Generate code
  ns <- [d|instance NativeScript $(pure $ PromotedT ty) where
             classInit       = Godot.Nativescript.init 

             classMethods    =
               $(ListE
               <$> mapM
               (\(t, n, argTy, _)
                -> let m = case nrArguments argTy of
                         0 -> [e|method0|]
                         1 -> [e|method1|]
                         2 -> [e|method2|]
                         3 -> [e|method3|]
                         4 -> [e|method4|]
                         5 -> [e|method5|]
                         moreThan5 -> error
                           $ "More arguments than we currently impelement, look for 'method5' for more info "
                           ++ show moreThan5
                   in [e|$m $(pure $ LitE $ StringL n)
                      (nodeMethod @($(pure $ PromotedT t)) @($(pure $ LitT $ StrTyLit n)))|])
               methods)

             classProperties =
               $(ListE
               <$> mapM (\(name, prop, _, _) -> [e|mkProperty' @($(pure $ PromotedT name))
                                                @($(pure $ LitT $ StrTyLit prop))|]) properties)

             classSignals    =
               $(ListE <$> mapM (\(typ, name, _) -> [e|signal' @($(pure $ PromotedT typ))
                                                   @($(pure $ LitT $ StrTyLit name))|]) signals)|]
  let cn = mkName $ "witness_connections_" ++ nameBase ty
  ws <- (:) <$> (cn `sigD` [t| [()] |]) <*>
       [d|$(varP cn) =
             $(ListE <$> mapM (\(sceneName,from,signalName,to,methodName) ->
                    [e|witnessConnection
                        @($(pure $ LitT $ StrTyLit sceneName))  @($(pure $ LitT $ StrTyLit from))
                        @($(pure $ LitT $ StrTyLit signalName)) @($(pure $ LitT $ StrTyLit to))
                        @($(pure $ LitT $ StrTyLit methodName))
                        @($(pure $ PromotedT $ resolveSignalActualClass sceneName from signalName))
                    |]) connections)|]
  pure $ ns <> ws
  where
    unTree (InstanceD Nothing [] (AppT (AppT _ parent) child) []) = (unName child, unName parent)
    unTree p = error $ "I don't understand this parent " ++ show p

    unName (ConT x) = x
    unName (AppT (ConT x) _) = x
    unName x = error $ "I don't know how to extract the name of this type: " ++ show x

    unSceneRootNode (TySynInstD (TySynEqn Nothing (AppT _ (LitT (StrTyLit sceneName)))
                                 (LitT (StrTyLit node)))) = (sceneName, node)
    unSceneRootNode x = error $ "Don't know how unpack this SceneRootNode: " ++ show x

    unSceneNodeType (TySynInstD (TySynEqn Nothing (AppT (AppT _ (LitT (StrTyLit sceneName)))
                                                   (LitT (StrTyLit node))) typ)) =
      (sceneName, node, unName typ, unpackScene typ)
    unSceneNodeType x = error $ "Don't know how unpack this SceneNodeType: " ++ show x

    unpackScene (ConT _) = Nothing
    unpackScene (AppT (ConT _) (LitT (StrTyLit sceneName))) = Just sceneName
    unpackScene x = error $ "Don't know how unpack this Scene: " ++ show x

    unNodeMethod (InstanceD Nothing []
                  (AppT (AppT (AppT (AppT (ConT _) (ConT cls)) (LitT (StrTyLit name))) arg) ret) []) =
      Just (cls, name, arg, ret)
    unNodeMethod _ = Nothing

    unNodeProperty (InstanceD Nothing []
                    (AppT (AppT (AppT (AppT (ConT _) (ConT cls)) (LitT (StrTyLit name))) arg) ret)
                    []) = Just (cls, name, arg, ret)
    unNodeProperty x = error $ show x

    unNodeInScene (InstanceD Nothing [] (AppT (AppT (AppT (ConT _) (LitT (StrTyLit sceneName)))
                                               (LitT (StrTyLit node))) (ConT hty)) []) =
      (sceneName, node, hty)
    unNodeInScene x = error $ show x

    unNodeSignal
      (InstanceD Nothing [] (AppT (AppT (AppT (ConT _) (ConT cls)) (LitT (StrTyLit name))) arg) []) =
      (cls, name, arg)
    unNodeSignal _ = error "Bad signal"

    unConnect
      (InstanceD Nothing []
       (AppT (AppT (AppT (AppT (AppT _ (LitT (StrTyLit sceneName))) (LitT (StrTyLit from)))
                    (LitT (StrTyLit signalName))) (LitT (StrTyLit to))) (LitT (StrTyLit methodName))) []) =
      (sceneName, from, signalName, to, methodName)
    unConnect x = error $ "Bad signal" ++ show x

    nrArguments :: Type -> Int
    nrArguments (AppT _ r) = 1 + nrArguments r
    nrArguments (SigT PromotedNilT (AppT ListT StarT)) = 0
    nrArguments _ = error "Can't compute # of arguments"

    classInstances :: Info -> [InstanceDec]
    classInstances (ClassI _ is) = is
    classInstances _ = error "Bad class"

    familyInstances :: Info -> [InstanceDec]
    familyInstances (FamilyI _ is) = is
    familyInstances _ = error "Bad class"


getError :: Int -> Maybe GodotError
getError e | e == _OK                             = Nothing
           | e == _FAILED                         = Just GFailed                   
           | e == _ERR_UNAVAILABLE                = Just GUnavailable              
           | e == _ERR_UNCONFIGURED               = Just GUnconfigured             
           | e == _ERR_UNAUTHORIZED               = Just GUnauthorized             
           | e == _ERR_PARAMETER_RANGE_ERROR      = Just GParameterRangeError      
           | e == _ERR_OUT_OF_MEMORY              = Just GOutOfMemory              
           | e == _ERR_FILE_NOT_FOUND             = Just GFileNotFound             
           | e == _ERR_FILE_BAD_DRIVE             = Just GFileBadDrive             
           | e == _ERR_FILE_BAD_PATH              = Just GFileBadPath              
           | e == _ERR_FILE_NO_PERMISSION         = Just GFileNoPermission         
           | e == _ERR_FILE_ALREADY_IN_USE        = Just GFileAlreadyInUse         
           | e == _ERR_FILE_CANT_OPEN             = Just GFileCantOpen             
           | e == _ERR_FILE_CANT_WRITE            = Just GFileCantWrite            
           | e == _ERR_FILE_CANT_READ             = Just GFileCantRead             
           | e == _ERR_FILE_UNRECOGNIZED          = Just GFileUnrecognized         
           | e == _ERR_FILE_CORRUPT               = Just GFileCorrupt              
           | e == _ERR_FILE_MISSING_DEPENDENCIES  = Just GFileMissingDependencies  
           | e == _ERR_FILE_EOF                   = Just GFileEof                  
           | e == _ERR_CANT_OPEN                  = Just GCantOpen                 
           | e == _ERR_CANT_CREATE                = Just GCantCreate               
           | e == _ERR_QUERY_FAILED               = Just GQueryFailed              
           | e == _ERR_ALREADY_IN_USE             = Just GAlreadyInUse             
           | e == _ERR_LOCKED                     = Just GLocked                   
           | e == _ERR_TIMEOUT                    = Just GTimeout                  
           | e == _ERR_CANT_CONNECT               = Just GCantConnect              
           | e == _ERR_CANT_RESOLVE               = Just GCantResolve              
           | e == _ERR_CONNECTION_ERROR           = Just GConnectionError          
           | e == _ERR_CANT_ACQUIRE_RESOURCE      = Just GCantAcquireResource      
           | e == _ERR_CANT_FORK                  = Just GCantFork                 
           | e == _ERR_INVALID_DATA               = Just GInvalidData              
           | e == _ERR_INVALID_PARAMETER          = Just GInvalidParameter         
           | e == _ERR_ALREADY_EXISTS             = Just GAlreadyExists            
           | e == _ERR_DOES_NOT_EXIST             = Just GDoesNotExist             
           | e == _ERR_DATABASE_CANT_READ         = Just GDatabaseCantRead         
           | e == _ERR_DATABASE_CANT_WRITE        = Just GDatabaseCantWrite        
           | e == _ERR_COMPILATION_FAILED         = Just GCompilationFailed        
           | e == _ERR_METHOD_NOT_FOUND           = Just GMethodNotFound           
           | e == _ERR_LINK_FAILED                = Just GLinkFailed               
           | e == _ERR_SCRIPT_FAILED              = Just GScriptFailed             
           | e == _ERR_CYCLIC_LINK                = Just GCyclicLink               
           | e == _ERR_INVALID_DECLARATION        = Just GInvalidDeclaration       
           | e == _ERR_DUPLICATE_SYMBOL           = Just GDuplicateSymbol          
           | e == _ERR_PARSE_ERROR                = Just GParseError               
           | e == _ERR_BUSY                       = Just GBusy                     
           | e == _ERR_SKIP                       = Just GSkip                     
           | e == _ERR_HELP                       = Just GHelp                     
           | e == _ERR_BUG                        = Just GBug                      
           | e == _ERR_PRINTER_ON_FIRE            = Just GPrinterOnFire            
           | otherwise                            = error $ "Unknown Godot error; this is a bug in the Haskell bindings: " ++ show e

guardError :: Int -> ()
guardError = maybe () throw . getError

{-| 'NativeScript' defines a new Godot class.
First you must create an instance of 'HasBaseClass' for inheritance and
upcasting to parent class. Then you'll need an instance of 'NativeScript'.
Finally, the splice 'deriveBase' handles creating all the parent-child
relationships. To actually use your class, you'll need to register it with
'registerClass'.

TODO Check that this example still works

Example usage:

@
data MyClass1 = MyClass1
  { _mc1Obj :: Node
  , _mc1Time :: MVar Float
  }

instance HasBaseClass MyClass1 where
  type BaseClass MyClass1 = Node
  super (MyClass1 p _) = p
instance NativeScript MyClass1 where
  classInit p = MyClass1 p <$> newMVar 0
  classMethods =
    [ func NoRPC "_ready" $ \self [] -> do
        sigName <- toLowLevel "on_MyClass1_ready" :: IO GodotString
        msg     <- toLowLevel ("MyClass1 is ready" :: Text) :: IO GodotString
        let msgVt = toVariant msg
        G.emit_signal (upcast self :: Object) sigName [msgVt]
    , func NoRPC "_process" $ \self [deltaVt] -> do
        delta <- fromVariant deltaVt
        atomically $ modifyMVar' (_mc1Time self) $ \t -> t + delta
    ]
  classSignals =
    [ signal "on_MyClass1_ready" [("msg", VariantTypeString)]
    ]
deriveBase ''Myclass1
@
-}

-- | Convenient way of registering a class with all its methods.
-- Used like: @registerClass $ RegClass desc $ classInit \\@MyClass@
registerClass
  :: forall a
   . (NativeScript a, AsVariant (BaseClass a))
  => Registerer 'GClass a
  -> IO ()
registerClass (RegClass desc constr) = do
  regClass desc (nameOf @(BaseClass a)) clsInit $ \_ _ -> return ()
  forM_ (classMethods @a) regMtd
  forM_ (classSignals @a) regSignal
  forM_ (classProperties @a) regProperty
 where
  clsInit :: Object -> IO a
  clsInit obj = tryObjectCast obj >>= 
    \case 
      (Just a) -> constr (a :: BaseClass a)
      _ -> error "can't call init couldn't cast"
  clsName = className @a

  regMtd mtd@ClassMethod {..} = do
    registerMethod (RegMethod desc mtd :: Registerer 'GMethod a)
    d <- isJust <$> lookupEnv "HS_GODOT_DEBUG"
    when d $ putStrLn $ T.unpack $ T.unwords
      ["Registering method", methodName, "to class", clsName]

  regSignal sgn@(signalName, _) = do
    registerSignal (RegSignal desc sgn :: Registerer 'GSignal a)
    d <- isJust <$> lookupEnv "HS_GODOT_DEBUG"
    when d $ putStrLn $ T.unpack $ T.unwords
      ["Registering signal", signalName, "to class", clsName]

  regProperty prp = do
    registerProperty (RegProperty desc prp :: Registerer 'GProperty a)
    d <- isJust <$> lookupEnv "HS_GODOT_DEBUG"
    when d $ putStrLn $ T.unpack $ T.unwords
      ["Registering property", propertyName prp, "to class", clsName]

  regClass pHandle base create destroy = do
    createFun <- mkInstanceCreateFunPtr
      $ \ins _ -> create ins >>= newStablePtr >>= (return . castStablePtrToPtr)
    destroyFun <- mkInstanceDestroyFunPtr $ \ins _ objPtr -> do
      let stPtr = castPtrToStablePtr objPtr
      obj <- deRefStablePtr stPtr
      freeStablePtr stPtr
      destroy ins obj
    rec createFreeFun <- mkInstanceFreeFunPtr $ \_ ->
          freeHaskellFunPtr createFun >> freeHaskellFunPtr createFreeFun
        destroyFreeFun <- mkInstanceFreeFunPtr $ \_ ->
          freeHaskellFunPtr destroyFun >> freeHaskellFunPtr destroyFreeFun

    let createFunObj = InstanceCreateFunc createFun nullPtr createFreeFun
    let destroyFunObj =
          InstanceDestroyFunc destroyFun nullPtr destroyFreeFun

    let tyFingerprint = typeRepFingerprint $ typeRep (Proxy @a)
    tyPtr <- F.new tyFingerprint

    d <- isJust <$> lookupEnv "HS_GODOT_DEBUG"
    when d $ putStrLn $ T.unpack $ T.unwords ["Registering class", clsName, "with base", base]
    withCString (T.unpack clsName)
      $ \namePtr -> withCString (T.unpack base) $ \basePtr -> do
          godot_nativescript_register_class pHandle
                                            namePtr
                                            basePtr
                                            createFunObj
                                            destroyFunObj
          godot_nativescript_set_type_tag pHandle
                                          namePtr
                                          (castPtr tyPtr)

tryCast
  :: forall b a. (Object :< a, Typeable b, AsVariant b) => a -> IO (Maybe b)
tryCast = tryObjectCast . upcast

tryCast' :: forall out x. (Typeable out, AsVariant out, Object :< x) => x -> IO out
tryCast' o = fromJust <$> tryCast o
singletonTable :: MVar (M.Map Text Object)
singletonTable = unsafePerformIO $ newMVar M.empty

-- | Godot exposes some functionality through singletons. You'll often need to
-- talk to the GodotInput singeton for example. Use this as 'getSingleton @GodotInput'.
getSingleton
  :: forall a . (Typeable a, AsVariant a) => IO (Maybe a)
getSingleton = do
  let name = unConvertClassName $ nameOf @a
  table <- readMVar singletonTable
  case M.lookup name table of
    Just o -> tryCast o
    Nothing -> do
      ge <- getEngine
      -- FIXME ANDREI I don't understand what convertClassName is doing here? It seems wrong.
      -- o <- get_singleton ge =<< toLowLevel (convertClassName name)
      o <- get_singleton ge =<< toLowLevel name
      modifyMVar_ singletonTable (\m -> pure (M.insert name o m))
      tryCast o

getEngine :: IO Api.Engine
getEngine =
  GNI.godot_global_get_singleton
    &   Foreign.withCString "Engine"
    >>= \o -> tryCast o >>= \case
          Just ge -> return ge
          Nothing ->
            (get_class o :: IO GodotString)
              >>= fromLowLevel
              >>= error
              .   ("Couldn't get Engine singleton :( got: " ++)
              .   T.unpack
  
tryObjectCast :: forall a . (Typeable a, AsVariant a) => Object -> IO (Maybe a)
tryObjectCast obj = do
  isCls <- Object.is_class obj =<< toLowLevel (nameOf @a)
  if isCls
    then do
      asGVt <- toLowLevel $ toVariant obj :: IO GodotVariant
      Just <$> fromGodotVariant asGVt
    else return Nothing


asNativeScript :: forall a . NativeScript a => Object -> IO (Maybe a)
asNativeScript obj = do
  tyPtr <- godot_nativescript_get_type_tag obj
  tyFingerprint <- peek (castPtr tyPtr)
  if tyFingerprint == typeRepFingerprint (typeRep (Proxy @a)) then
    Just <$> (godot_nativescript_get_userdata obj
               >>= (deRefStablePtr . castPtrToStablePtr))
    else
    pure Nothing

copyVariant
  :: Ptr GodotVariant -- ^ destination
  -> Ptr GodotVariant -- ^ source
  -> IO ()
copyVariant dest src = copyBytes dest src (opaqueSizeOf @GodotVariant)


{-| This makes defining class member methods much easier and similar to GDScript.
Without dependent types we can't enforce that the right number of arguments are
passed. The pattern-match below is non-total for syntactic simplicity.

Example usage:
@
func NoRPC "_unhandled_input" $ \self [evObj] ->
  (fromVariant evObj :: IO Object)
    >>= asClass InputEventKey "InputEventKey"
    >>= flip whenJust (handleInputKey self)
@
-}
func
  :: AsVariant a
  => RPC
  -> Text
  -> (cls -> [GodotVariant] -> IO a)
  -> ClassMethod cls
func rpcOption mthdName fn = ClassMethod rpcOption mthdName
  $ \self args -> toLowLevel . toVariant =<< fn self (Vec.toList args)

-- | Quick shortcut to make a new local method with arguments passed as
-- 'Variant's in a list.
method :: (AsVariant a)
       => Text -> (cls -> [GodotVariant] -> IO a) -> ClassMethod cls
method = func NoRPC

-- | Quick shortcut to make a new local method with no argumnets.
method0 :: (AsVariant a)
       => Text -> (cls -> IO a) -> ClassMethod cls
method0 name fn = func NoRPC name (\s args ->
                                    case args of 
                                      [] -> fn s
                                      _ -> error "wrong number of arguments"
                                  )

-- | Quick shortcut to make a new local method that takes 1 argument, 'Variant's
-- are unwrapped into their types before being passed in.
method1 :: (AsVariant a, AsVariant o1, Typeable o1)
        => Text -> (cls -> o1 -> IO a) -> ClassMethod cls
method1 name fn = func NoRPC name (\s args -> 
                                    case args of 
                                      [o1] -> do
                                        a1 <- fromGodotVariant o1
                                        fn s a1
                                      _ -> error "wrong number of arguments"
                                  )

-- | Quick shortcut to make a new local method that takes 2 arguments, 'Variant's
-- are unwrapped into their types before being passed in.
method2 :: (AsVariant a, AsVariant o1, Typeable o1, AsVariant o2, Typeable o2)
        => Text -> (cls -> o1 -> o2 -> IO a) -> ClassMethod cls
method2 name fn = func NoRPC name (\s args ->
                                    case args of 
                                      [o1, o2] -> do
                                        a1 <- fromGodotVariant o1
                                        a2 <- fromGodotVariant o2
                                        fn s a1 a2
                                      _ -> error "wrong number of arguments"
                                  )

-- | Quick shortcut to make a new local method that takes 3 arguments, 'Variant's
-- are unwrapped into their types before being passed in.
method3 :: (AsVariant a, AsVariant o1, Typeable o1, AsVariant o2, Typeable o2, AsVariant o3, Typeable o3)
        => Text -> (cls -> o1 -> o2 -> o3 -> IO a) -> ClassMethod cls
method3 name fn = func NoRPC name (\s args ->
                                    case args of 
                                      [o1, o2, o3] -> do
                                        a1 <- fromGodotVariant o1
                                        a2 <- fromGodotVariant o2
                                        a3 <- fromGodotVariant o3
                                        fn s a1 a2 a3
                                      _ -> error "wrong number of arguments"
                                  )

-- | Quick shortcut to make a new local method that takes 4 arguments, 'Variant's
-- are unwrapped into their types before being passed in.
method4 :: (AsVariant a, AsVariant o1, Typeable o1, AsVariant o2, Typeable o2
          , AsVariant o3, Typeable o3, AsVariant o4, Typeable o4)
        => Text -> (cls -> o1 -> o2 -> o3 -> o4 -> IO a) -> ClassMethod cls
method4 name fn = func NoRPC name (\s args ->
                                    case args of 
                                      [o1, o2, o3, o4] -> do
                                        a1 <- fromGodotVariant o1
                                        a2 <- fromGodotVariant o2
                                        a3 <- fromGodotVariant o3
                                        a4 <- fromGodotVariant o4
                                        fn s a1 a2 a3 a4
                                      _ -> error "wrong number of arguments"
                                  )

-- | Quick shortcut to make a new local method that takes 5 arguments, 'Variant's
-- are unwrapped into their types before being passed in.
method5 :: (AsVariant a, AsVariant o1, Typeable o1, AsVariant o2, Typeable o2
          , AsVariant o3, Typeable o3, AsVariant o4, Typeable o4, AsVariant o5, Typeable o5)
        => Text -> (cls -> o1 -> o2 -> o3 -> o4 -> o5 -> IO a) -> ClassMethod cls
method5 name fn = func NoRPC name (\s args ->
                                      case args of 
                                        [o1,o2,o3,o4,o5] -> do
                                          a1 <- fromGodotVariant o1
                                          a2 <- fromGodotVariant o2
                                          a3 <- fromGodotVariant o3
                                          a4 <- fromGodotVariant o4
                                          a5 <- fromGodotVariant o5
                                          fn s a1 a2 a3 a4 a5
                                        _ -> error "wrong number of arguments"
                                  )

registerMethod :: forall a . Typeable a => Registerer 'GMethod a -> IO ()
registerMethod (RegMethod desc ClassMethod {..}) = do
  methodFun <-
    mkInstanceMethodFunPtr $ \outPtr _ins _ objPtr numArgs argsPtr -> do
      obj  <- deRefStablePtr $ castPtrToStablePtr objPtr
      ptrs <- V.fromList <$> peekArray (fromIntegral numArgs) argsPtr
      args <- V.forM ptrs $ \ptr -> do
        oldVar <- GodotVariant <$> newForeignPtr_ ptr
        godot_variant_new_copy oldVar
      res <- methodFunc obj args
      withGodotVariant res $ copyVariant outPtr
      return outPtr

  rec methodFreeFun <- mkInstanceFreeFunPtr
        $ \_ -> freeHaskellFunPtr methodFun >> freeHaskellFunPtr methodFreeFun

  let methodObj = InstanceMethod methodFun nullPtr methodFreeFun
  withCString (T.unpack $ nameOf @a) $ \clsNamePtr ->
    withCString (T.unpack methodName)
      $ \mtdNamePtr -> godot_nativescript_register_method
          desc
          clsNamePtr
          mtdNamePtr
          (MethodAttributes rpcMode)
          methodObj
 where
  rpcMode = case methodRPCMode of
    NoRPC  -> MethodRpcModeDisabled
    Remote -> MethodRpcModeRemote
    Sync   -> MethodRpcModeSync
    Master -> MethodRpcModeMaster
    Slave  -> MethodRpcModeSlave

asPropertyAttributes :: PropertyAttributes -> IO GNI.PropertyAttributes
asPropertyAttributes PropertyAttributes {..} = do
  hintStr <- toLowLevel propertyHintString
  def     <- toLowLevel propertyDefaultValue
  return $ GNI.PropertyAttributes
    { godotPropertyAttributesRsetType     = propertySetType
    , godotPropertyAttributesType         = fromIntegral $ fromEnum propertyType
    , godotPropertyAttributesHint         = propertyHint
    , godotPropertyAttributesHintString   = hintStr
    , godotPropertyAttributesUsage        = propertyUsage
    , godotPropertyAttributesDefaultValue = def
    }

registerProperty :: forall a . NativeScript a => Registerer 'GProperty a -> IO ()
registerProperty (RegProperty desc (ClassProperty path attr setter getter)) = do
  setFun <- mkPropertySetFunPtr $ \ins _ objPtr valPtr -> do
    obj <- deRefStablePtr $ castPtrToStablePtr objPtr
    val <- newForeignPtr_ valPtr
    setter ins obj (GodotVariant val)
  getFun <- mkPropertyGetFunPtr $ \outPtr ins _ objPtr -> do
    obj <- deRefStablePtr $ castPtrToStablePtr objPtr
    res <- getter ins obj
    withGodotVariant res $ copyVariant outPtr
    return outPtr
  rec setFreeFun <- mkInstanceFreeFunPtr
        $ \_ -> freeHaskellFunPtr setFun >> freeHaskellFunPtr setFreeFun
      getFreeFun <- mkInstanceFreeFunPtr
        $ \_ -> freeHaskellFunPtr getFun >> freeHaskellFunPtr getFreeFun
  godotAttr <- asPropertyAttributes attr
  withCString (T.unpack $ nameOf @a) $ \clsNamePtr ->
    withCString (T.unpack path) $ \pathPtr -> godot_nativescript_register_property
      desc
      clsNamePtr
      pathPtr
      godotAttr
      (PropertySetFunc setFun nullPtr setFreeFun)
      (PropertyGetFunc getFun nullPtr getFreeFun)

createMVarProperty :: (Typeable v, AsVariant v) =>
     Text
     -> (t -> MVar v)
     -- ^ We typically can't do IO (for initialisation) when calling this, in
     -- which case we need to annotate the type without providing a value.
     -> Either VariantType v
     -> ClassProperty t
createMVarProperty name fieldName tyOrVal = ClassProperty
  { propertyName = name
  , propertyAttrs = PropertyAttributes
      MethodRpcModeDisabled
      (fst vTyVt)
      PropertyHintNone
      ""
      godotPropertyUsageDefault
      (snd vTyVt)
  , propertySetter = \_ c (var :: GodotVariant) -> do
        variant <- fromLowLevel var
        -- TODO This is required to avoid memory corruption. Haskell cannot hold
        -- pointers to Godot objects unless the runtime already has a live
        -- reference to that object. It will otherwise be freed at some point!
        --
        -- This solution works, but only for most Godot Objects. We could add
        -- more cases here, but a much better way would be to implement a Ref
        -- type to hold such objects. Coming soon to stores near you.
        _ <- case variant of
          VariantObject o -> onRefObj reference o
          _ -> pure False
        obj <- fromGodotVariant var
        let mvar = fieldName c
        isEmpty <- isEmptyMVar mvar
        if isEmpty
          then putMVar mvar obj
          else toVariant <$> swapMVar mvar obj >>= \case
            VariantObject oldObj@(Object ptr) -> do
              unreffed <- onRefObj unreference oldObj -- lazy evaluation ftw
              when (nullPtr /= ptr && unreffed) $
                Object.free oldObj
            _ -> pure ()
  , propertyGetter = \_ c -> toLowLevel . toVariant =<< readMVar (fieldName c)
  }
 where
   onRefObj :: (Api.Reference -> IO a) -> Object -> IO a
   onRefObj f o = tryObjectCast @Api.Reference o >>= \case
      Just ref -> f ref
      Nothing -> error "Variant object not a reference"
   vTyVt :: (VariantType, Variant 'GodotTy)
   vTyVt = case tyOrVal of
     Left VariantTypeObject -> (VariantTypeObject, VariantObject (Object nullPtr))
     Left vTy -> (vTy, VariantNil)
     Right val -> (variantType val, toVariant val)

asSignalArgument :: SignalArgument -> IO GNI.SignalArgument
asSignalArgument SignalArgument {..} = do
  name <- toLowLevel signalArgumentName
  let ty = fromIntegral $ fromEnum signalArgumentType
  hintStr <- toLowLevel signalArgumentHintString
  def     <- toLowLevel signalArgumentDefaultValue
  return $ GNI.SignalArgument name
                               ty
                               signalArgumentHint
                               hintStr
                               signalArgumentUsage
                               def


-- | Example usage:
-- @
-- signal "on_pulse" [("source", VariantTypeVector3), ("affected", VariantTypeObject)]
-- @
signal :: Text -> [(Text, VariantType)] -> (Text, [SignalArgument])
signal sigName sigArgs = (sigName, uncurry toSigArg <$> sigArgs)
 where
  toSigArg :: Text -> VariantType -> SignalArgument
  toSigArg argName ty = do
    SignalArgument
      { signalArgumentName         = argName
      , signalArgumentType         = ty
      , signalArgumentHint         = PropertyHintNone
      , signalArgumentHintString   = T.pack ""
      , signalArgumentUsage        = godotPropertyUsageDefault
      , signalArgumentDefaultValue = VariantNil
      }

-- TODO: Also allow hints and default args?
registerSignal :: forall a . NativeScript a => Registerer 'GSignal a -> IO ()
registerSignal (RegSignal desc (signalName, signalArgs)) = do
  gdArgs <- mapM asSignalArgument signalArgs
  let defaultArgs = []
  withArrayLen gdArgs $ \gdArgsLen gdArgsPtr ->
    withVariantArray' defaultArgs $ \(defArgsPtr, defArgsLen) ->
      withCString (T.unpack $ nameOf @a) $ \clsNamePtr -> do
        gdSigName <- toLowLevel signalName
        godot_nativescript_register_signal desc clsNamePtr $ GNI.Signal
          gdSigName
          (fromIntegral gdArgsLen)
          gdArgsPtr
          defArgsLen
          defArgsPtr
 where
  withVariantArray'
    :: [Variant 'GodotTy] -> ((Ptr GodotVariant, CInt) -> IO b) -> IO b
  withVariantArray' vars mtd =
    allocaBytes (opaqueSizeOf @GodotVariant * length vars)
      $ \arrPtr -> withVars vars 0 arrPtr mtd

  withVars (x : xs) n arrPtr mtd = do
    vt <- toLowLevel x
    withGodotVariant vt $ \vtPtr -> do
      copyVariant (arrPtr `plusPtr` (n * opaqueSizeOf @GodotVariant)) vtPtr
      withVars xs (n + 1) arrPtr mtd
  withVars [] n arrPtr mtd = mtd (arrPtr, fromIntegral n)

foreign import ccall "dynamic"
  call_godot_class_constructor_ :: FunPtr (IO (Object)) -> IO (Object)

-- | Instantiate an object
new :: forall o. (Typeable o, AsVariant o) => IO (Maybe o)
new = do
  con <- Foreign.withCString (T.unpack $ nameOf @o) godot_get_class_constructor
  if con == nullFunPtr then
    pure Nothing else
    tryCast =<< call_godot_class_constructor_ con

newNativeScript :: forall a. NativeScript a => IO (Maybe a)
newNativeScript = do
  let name = nameOf @a
  Just nativescript <- new @Api.NativeScript
  Just gdnlib <- tryCast @Api.GDNativeLibrary =<< readIORef gdnativeLibraryRef
  NativeScript.set_library nativescript gdnlib
  NativeScript.set_class_name nativescript =<< toLowLevel name
  no <- fromGodotVariant =<< NativeScript.new nativescript []
  asNativeScript no

getNode :: forall b cls. (Object :< cls, Api.Node :< cls,
                    Typeable b, AsVariant b)
        => cls -> Text -> IO b
getNode self name = do
  n :: Api.Node <- get_node_or_null self =<< toLowLevel name
  x <- tryCast n
  case x of
    Just r -> pure r
    _ -> error "Error, getNode failed"

getNodeNativeScript :: forall b child. (NativeScript b, Api.Node :< child, Object :< child)
         => child -> Text -> IO b
getNodeNativeScript self name = do
  n <- get_node self =<< toLowLevel name
  x <- asNativeScript $ upcast @Object n
  case x of
    Just r -> pure r
    _ -> error "Error, getNode' failed"

-- | The descriptor, Godot file resource path, of the current script. Some
-- GNative API functions need access to this.
scriptDesc :: MVar GodotString
{-# NOINLINE scriptDesc #-}
scriptDesc = unsafePerformIO newEmptyMVar

-- | Called for you in the setup code.
defaultExports :: GdnativeHandle -> IO ()
defaultExports desc = do
  desc' <- newForeignPtr_ desc
  cpy <- godot_string_new_copy (coerce desc' :: GodotString)
  putMVar scriptDesc cpy
  registerClass $ RegClass desc $ classInit @WrapperStablePtr
  pure ()

-- | Ask an object to wait for a signal on a target. When the signal is trigged call the given function
-- For example, to get a callback when a timer fires you could do something like
-- @ await self timer "timeout" (\self -> print "Timer fired!") @
await :: forall cls target a. (Object :< target) => Typeable cls => (Object :< cls)
      => cls -> target -> Text -> (cls -> IO a) -> IO ()
await self target aSignal fn = do
  desc <- readMVar scriptDesc
  (Just w) <- newNativeScript @WrapperStablePtr
  unlessM (has_method self =<< toLowLevel "__script_callback") $ do
    withForeignPtr (coerce desc)
      (\rawDesc ->
       registerMethod
        (RegMethod (coerce rawDesc)
         (method1 "__script_callback"
          (\this o -> do
              (Just wrapper) <- asNativeScript @WrapperStablePtr o
              sptr <- takeMVar $ _wrapperStablePtr wrapper
              anotherFunc :: (cls -> IO a) <- deRefStablePtr (castPtrToStablePtr (castStablePtrToPtr sptr))
              _ <- anotherFunc this
              freeStablePtr sptr))))
  fnptr <- newStablePtr fn
  putMVar (_wrapperStablePtr w) (castPtrToStablePtr (castStablePtrToPtr fnptr))
  fnBind <- toGodotVariant (upcast @Object w)
  guardError <$> (join $ connect target
    <$> toLowLevel aSignal
    <*> pure (upcast self)
    <*> toLowLevel "__script_callback"
    <*> (Just <$> toLowLevel (V.singleton fnBind))
    <*> pure (Just _CONNECT_ONESHOT))

