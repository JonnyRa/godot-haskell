module Godot.Core.GodotWlrSurface where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

commit :: Signal GodotWlrSurface
commit = Signal "commit"

destroy :: Signal GodotWlrSurface
destroy = Signal "destroy"

new_subsurface :: Signal GodotWlrSurface
new_subsurface = Signal "new_subsurface"