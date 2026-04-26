module Godot.Core.GodotGDLMSensor where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

about_to_remove_hand :: Signal GodotGDLMSensor
about_to_remove_hand = Signal "about_to_remove_hand"

new_hand :: Signal GodotGDLMSensor
new_hand = Signal "new_hand"