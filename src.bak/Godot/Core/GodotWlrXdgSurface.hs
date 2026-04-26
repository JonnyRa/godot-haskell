module Godot.Core.GodotWlrXdgSurface where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern XDG_SURFACE_ROLE_POPUP :: Int

pattern XDG_SURFACE_ROLE_POPUP = 2

pattern XDG_SURFACE_ROLE_TOPLEVEL :: Int

pattern XDG_SURFACE_ROLE_TOPLEVEL = 1

pattern XDG_SURFACE_ROLE_NONE :: Int

pattern XDG_SURFACE_ROLE_NONE = 0

ack_configure :: Signal GodotWlrXdgSurface
ack_configure = Signal "ack_configure"

configure :: Signal GodotWlrXdgSurface
configure = Signal "configure"

destroy :: Signal GodotWlrXdgSurface
destroy = Signal "destroy"

map :: Signal GodotWlrXdgSurface
map = Signal "map"

new_popup :: Signal GodotWlrXdgSurface
new_popup = Signal "new_popup"

ping_timeout :: Signal GodotWlrXdgSurface
ping_timeout = Signal "ping_timeout"

unmap :: Signal GodotWlrXdgSurface
unmap = Signal "unmap"