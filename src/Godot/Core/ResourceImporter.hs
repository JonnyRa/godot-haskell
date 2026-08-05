{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ResourceImporter
       (Godot.Core.ResourceImporter._IMPORT_ORDER_SCENE,
        Godot.Core.ResourceImporter._IMPORT_ORDER_DEFAULT)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Reference()

_IMPORT_ORDER_SCENE :: Int
_IMPORT_ORDER_SCENE = 100

_IMPORT_ORDER_DEFAULT :: Int
_IMPORT_ORDER_DEFAULT = 0