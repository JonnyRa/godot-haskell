{-# LANGUAGE GADTs #-}
{-# LANGUAGE AllowAmbiguousTypes #-}

module Godot.Nativescript.Types 
where

import Foreign.StablePtr
import Control.Concurrent.MVar
import Godot.Gdnative
import Godot.Internal.Dispatch
import Data.Text (Text)
import qualified Data.Text as T
import Data.Typeable
import Data.Vector (Vector)
import           Foreign                           hiding (void,new)
import           Control.Exception

type GdnativeHandle = Ptr ()

data GodotError = GFailed -- ^ Generic error.
                | GUnavailable -- ^ Unavailable error.
                | GUnconfigured -- ^ Unconfigured error.
                | GUnauthorized -- ^ Unauthorized error.
                | GParameterRangeError -- ^ Parameter range error.
                | GOutOfMemory -- ^ Out of memory (OOM) error.
                | GFileNotFound -- ^ File: Not found error.
                | GFileBadDrive -- ^ File: Bad drive error.
                | GFileBadPath -- ^ File: Bad path error.
                | GFileNoPermission -- ^ File: No permission error.
                | GFileAlreadyInUse -- ^ File: Already in use error.
                | GFileCantOpen -- ^ File: Can't open error.
                | GFileCantWrite -- ^ File: Can't write error.
                | GFileCantRead -- ^ File: Can't read error.
                | GFileUnrecognized -- ^ File: Unrecognized error.
                | GFileCorrupt -- ^ File: Corrupt error.
                | GFileMissingDependencies -- ^ File: Missing dependencies error.
                | GFileEof -- ^ File: End of file (EOF) error.
                | GCantOpen -- ^ Can't open error.
                | GCantCreate -- ^ Can't create error.
                | GQueryFailed -- ^ Query failed error.
                | GAlreadyInUse -- ^ Already in use error.
                | GLocked -- ^ Locked error.
                | GTimeout -- ^ Timeout error.
                | GCantConnect -- ^ Can't connect error.
                | GCantResolve -- ^ Can't resolve error.
                | GConnectionError -- ^ Connection error.
                | GCantAcquireResource -- ^ Can't acquire resource error.
                | GCantFork -- ^ Can't fork process error.
                | GInvalidData -- ^ Invalid data error.
                | GInvalidParameter -- ^ Invalid parameter error.
                | GAlreadyExists -- ^ Already exists error.
                | GDoesNotExist -- ^ Does not exist error.
                | GDatabaseCantRead -- ^ Database: Read error.
                | GDatabaseCantWrite -- ^ Database: Write error.
                | GCompilationFailed -- ^ Compilation failed error.
                | GMethodNotFound -- ^ Method not found error.
                | GLinkFailed -- ^ Linking failed error.
                | GScriptFailed -- ^ Script failed error.
                | GCyclicLink -- ^ Cycling link (import cycle) error.
                | GInvalidDeclaration -- ^ Invalid declaration error.
                | GDuplicateSymbol -- ^ Duplicate symbol error.
                | GParseError -- ^ Parse error.
                | GBusy -- ^ Busy error.
                | GSkip -- ^ Skip error.
                | GHelp -- ^ Help error.
                | GBug -- ^ Bug error.
                | GPrinterOnFire -- ^ Printer on fire error. (This is an easter egg, no engine methods return this error code.)
                deriving (Show, Eq, Typeable)

instance Exception GodotError

data SignalArgument = SignalArgument
  { signalArgumentName :: !Text
  , signalArgumentType :: !VariantType
  , signalArgumentHint :: !PropertyHint
  , signalArgumentHintString :: !Text
  , signalArgumentUsage :: !PropertyUsageFlags
  , signalArgumentDefaultValue :: !(Variant 'GodotTy)
  }

type GFunc cls = cls -> Vector GodotVariant -> IO GodotVariant

data ClassMethod cls where
  ClassMethod
    :: { methodRPCMode :: RPC
       , methodName :: Text
       , methodFunc :: GFunc cls
       }
    -> ClassMethod cls


data RPC
  = NoRPC
  | Remote
  | Sync
  | Master
  | Slave


data RegTy
  = GClass
  | GMethod
  | GSignal
  | GProperty

data family Registerer (x :: RegTy) cls

type ClassSignal = (Text, [SignalArgument])

type ClassName a = Text

class (HasBaseClass cls, Typeable cls, Typeable (BaseClass cls), Object :< cls)
  => NativeScript cls where
  classInit :: BaseClass cls -> IO cls
  className :: ClassName cls
  className = nameOf @cls
  classMethods :: [ClassMethod cls]
  classSignals :: [ClassSignal]
  classSignals = []
  classProperties :: [ClassProperty cls]
  classProperties = []
  asObj :: cls -> Object
  asObj = upcast

nameOf :: forall a . Typeable a => ClassName a
nameOf = T.pack
    $ convertClassName
    $ show
    $ typeRep
    $ Proxy @a

convertClassName :: String -> String
convertClassName name =
  case name of
    -- TODO Derive these automatically. Don't think we store if a
    -- class is a singleton anywhere.
    "ClassDB" -> "_ClassDB"
    "Marshalls" -> "_Marshalls"
    "VisualScriptEditor" -> "_VisualScriptEditor"
    "OS" -> "_OS"
    "Engine" -> "_Engine"
    "Geometry" -> "_Geometry"
    "JSON" -> "_JSON"
    "ResourceLoader" -> "_ResourceLoader"
    "ResourceSaver" -> "_ResourceSaver"
    x -> x

unConvertClassName :: Text -> Text
unConvertClassName name =
  case name of
    -- TODO Derive these automatically. Don't think we store if a
    -- class is a singleton anywhere.
    "_ClassDB" -> "ClassDB"
    "_Marshalls" -> "Marshalls"
    "_VisualScriptEditor" -> "VisualScriptEditor"
    "_OS" -> "OS"
    "_Engine" -> "Engine"
    "_Geometry" -> "Geometry"
    "_JSON" -> "JSON"
    "_ResourceLoader" -> "ResourceLoader"
    "_ResourceSaver" -> "ResourceSaver"
    x -> x

data instance Registerer 'GClass cls = NativeScript cls =>
  RegClass
    GdnativeHandle
    (BaseClass cls -> IO cls)

data instance Registerer 'GMethod cls = NativeScript cls =>
  RegMethod
    GdnativeHandle
    (ClassMethod cls)

data instance Registerer 'GSignal cls = NativeScript cls =>
  RegSignal
    GdnativeHandle
    (Text, [SignalArgument])

data instance Registerer 'GProperty cls = NativeScript cls =>
  RegProperty
    GdnativeHandle
    (ClassProperty cls)

-- | Sometimes we really have to pass in a Haskell pointer to Godot,
-- particularly for callbacks.
data WrapperStablePtr = WrapperStablePtr 
  { _wrapperStablePtrBase :: Object
  , _wrapperStablePtr :: MVar (StablePtr ()) 
  }

instance HasBaseClass WrapperStablePtr where
  type BaseClass WrapperStablePtr = Object
  super = _wrapperStablePtrBase

deriveBase ''WrapperStablePtr

instance NativeScript WrapperStablePtr where
  classInit base = WrapperStablePtr base <$> newEmptyMVar
  classMethods = []
