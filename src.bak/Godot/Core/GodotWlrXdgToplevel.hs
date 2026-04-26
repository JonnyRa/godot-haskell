module Godot.Core.GodotWlrXdgToplevel where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

request_fullscreen :: Signal GodotWlrXdgToplevel
request_fullscreen = Signal "request_fullscreen"

request_maximize :: Signal GodotWlrXdgToplevel
request_maximize = Signal "request_maximize"

request_minimize :: Signal GodotWlrXdgToplevel
request_minimize = Signal "request_minimize"

request_move :: Signal GodotWlrXdgToplevel
request_move = Signal "request_move"

request_resize :: Signal GodotWlrXdgToplevel
request_resize = Signal "request_resize"

request_show_window_menu :: Signal GodotWlrXdgToplevel
request_show_window_menu = Signal "request_show_window_menu"

set_app_id :: Signal GodotWlrXdgToplevel
set_app_id = Signal "set_app_id"

set_parent :: Signal GodotWlrXdgToplevel
set_parent = Signal "set_parent"

set_title :: Signal GodotWlrXdgToplevel
set_title = Signal "set_title"