module Godot.Core.GodotAnimatedTexture where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern MAX_FRAMES :: Int

pattern MAX_FRAMES = 256