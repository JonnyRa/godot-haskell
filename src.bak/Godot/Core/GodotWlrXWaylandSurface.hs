module Godot.Core.GodotWlrXWaylandSurface where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

destroy :: Signal GodotWlrXWaylandSurface
destroy = Signal "destroy"

map :: Signal GodotWlrXWaylandSurface
map = Signal "map"

map_child :: Signal GodotWlrXWaylandSurface
map_child = Signal "map_child"

map_free_child :: Signal GodotWlrXWaylandSurface
map_free_child = Signal "map_free_child"

request_fullscreen :: Signal GodotWlrXWaylandSurface
request_fullscreen = Signal "request_fullscreen"

request_maximize :: Signal GodotWlrXWaylandSurface
request_maximize = Signal "request_maximize"

request_move :: Signal GodotWlrXWaylandSurface
request_move = Signal "request_move"

request_resize :: Signal GodotWlrXWaylandSurface
request_resize = Signal "request_resize"

set_parent :: Signal GodotWlrXWaylandSurface
set_parent = Signal "set_parent"

set_title :: Signal GodotWlrXWaylandSurface
set_title = Signal "set_title"

surface_commit :: Signal GodotWlrXWaylandSurface
surface_commit = Signal "surface_commit"

unmap :: Signal GodotWlrXWaylandSurface
unmap = Signal "unmap"

unmap_child :: Signal GodotWlrXWaylandSurface
unmap_child = Signal "unmap_child"

unmap_free_child :: Signal GodotWlrXWaylandSurface
unmap_free_child = Signal "unmap_free_child"