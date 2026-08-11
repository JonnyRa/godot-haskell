{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Input
       (Godot.Core.Input._CURSOR_MOVE, Godot.Core.Input._CURSOR_ARROW,
        Godot.Core.Input._CURSOR_IBEAM, Godot.Core.Input._CURSOR_HSPLIT,
        Godot.Core.Input._CURSOR_DRAG,
        Godot.Core.Input._MOUSE_MODE_CONFINED_HIDDEN,
        Godot.Core.Input._CURSOR_BUSY,
        Godot.Core.Input._MOUSE_MODE_CONFINED,
        Godot.Core.Input._CURSOR_CROSS, Godot.Core.Input._CURSOR_WAIT,
        Godot.Core.Input._CURSOR_BDIAGSIZE, Godot.Core.Input._CURSOR_HELP,
        Godot.Core.Input._MOUSE_MODE_VISIBLE,
        Godot.Core.Input._CURSOR_CAN_DROP,
        Godot.Core.Input._MOUSE_MODE_CAPTURED,
        Godot.Core.Input._CURSOR_POINTING_HAND,
        Godot.Core.Input._CURSOR_FDIAGSIZE, Godot.Core.Input._CURSOR_HSIZE,
        Godot.Core.Input._MOUSE_MODE_HIDDEN,
        Godot.Core.Input._CURSOR_FORBIDDEN, Godot.Core.Input._CURSOR_VSIZE,
        Godot.Core.Input._CURSOR_VSPLIT,
        Godot.Core.Input.sig_joy_connection_changed,
        Godot.Core.Input.action_press, Godot.Core.Input.action_release,
        Godot.Core.Input.add_joy_mapping,
        Godot.Core.Input.flush_buffered_events,
        Godot.Core.Input.get_accelerometer,
        Godot.Core.Input.get_action_raw_strength,
        Godot.Core.Input.get_action_strength, Godot.Core.Input.get_axis,
        Godot.Core.Input.get_connected_joypads,
        Godot.Core.Input.get_current_cursor_shape,
        Godot.Core.Input.get_gravity, Godot.Core.Input.get_gyroscope,
        Godot.Core.Input.get_joy_axis,
        Godot.Core.Input.get_joy_axis_index_from_string,
        Godot.Core.Input.get_joy_axis_string,
        Godot.Core.Input.get_joy_button_index_from_string,
        Godot.Core.Input.get_joy_button_string,
        Godot.Core.Input.get_joy_guid, Godot.Core.Input.get_joy_name,
        Godot.Core.Input.get_joy_vibration_duration,
        Godot.Core.Input.get_joy_vibration_strength,
        Godot.Core.Input.get_last_mouse_speed,
        Godot.Core.Input.get_magnetometer,
        Godot.Core.Input.get_mouse_button_mask,
        Godot.Core.Input.get_mouse_mode, Godot.Core.Input.get_vector,
        Godot.Core.Input.is_action_just_pressed,
        Godot.Core.Input.is_action_just_released,
        Godot.Core.Input.is_action_pressed,
        Godot.Core.Input.is_joy_button_pressed,
        Godot.Core.Input.is_joy_known, Godot.Core.Input.is_key_pressed,
        Godot.Core.Input.is_mouse_button_pressed,
        Godot.Core.Input.is_physical_key_pressed,
        Godot.Core.Input.is_using_accumulated_input,
        Godot.Core.Input.joy_connection_changed,
        Godot.Core.Input.parse_input_event,
        Godot.Core.Input.remove_joy_mapping,
        Godot.Core.Input.set_accelerometer,
        Godot.Core.Input.set_custom_mouse_cursor,
        Godot.Core.Input.set_default_cursor_shape,
        Godot.Core.Input.set_gravity, Godot.Core.Input.set_gyroscope,
        Godot.Core.Input.set_magnetometer, Godot.Core.Input.set_mouse_mode,
        Godot.Core.Input.set_use_accumulated_input,
        Godot.Core.Input.should_ignore_device,
        Godot.Core.Input.start_joy_vibration,
        Godot.Core.Input.stop_joy_vibration,
        Godot.Core.Input.vibrate_handheld,
        Godot.Core.Input.warp_mouse_position)
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
import Godot.Core.Object()

_CURSOR_MOVE :: Int
_CURSOR_MOVE = 13

_CURSOR_ARROW :: Int
_CURSOR_ARROW = 0

_CURSOR_IBEAM :: Int
_CURSOR_IBEAM = 1

_CURSOR_HSPLIT :: Int
_CURSOR_HSPLIT = 15

_CURSOR_DRAG :: Int
_CURSOR_DRAG = 6

_MOUSE_MODE_CONFINED_HIDDEN :: Int
_MOUSE_MODE_CONFINED_HIDDEN = 4

_CURSOR_BUSY :: Int
_CURSOR_BUSY = 5

_MOUSE_MODE_CONFINED :: Int
_MOUSE_MODE_CONFINED = 3

_CURSOR_CROSS :: Int
_CURSOR_CROSS = 3

_CURSOR_WAIT :: Int
_CURSOR_WAIT = 4

_CURSOR_BDIAGSIZE :: Int
_CURSOR_BDIAGSIZE = 11

_CURSOR_HELP :: Int
_CURSOR_HELP = 16

_MOUSE_MODE_VISIBLE :: Int
_MOUSE_MODE_VISIBLE = 0

_CURSOR_CAN_DROP :: Int
_CURSOR_CAN_DROP = 7

_MOUSE_MODE_CAPTURED :: Int
_MOUSE_MODE_CAPTURED = 2

_CURSOR_POINTING_HAND :: Int
_CURSOR_POINTING_HAND = 2

_CURSOR_FDIAGSIZE :: Int
_CURSOR_FDIAGSIZE = 12

_CURSOR_HSIZE :: Int
_CURSOR_HSIZE = 10

_MOUSE_MODE_HIDDEN :: Int
_MOUSE_MODE_HIDDEN = 1

_CURSOR_FORBIDDEN :: Int
_CURSOR_FORBIDDEN = 8

_CURSOR_VSIZE :: Int
_CURSOR_VSIZE = 9

_CURSOR_VSPLIT :: Int
_CURSOR_VSPLIT = 14

-- | Emitted when a joypad device has been connected or disconnected.
sig_joy_connection_changed :: Godot.Internal.Dispatch.Signal Input
sig_joy_connection_changed
  = Godot.Internal.Dispatch.Signal "joy_connection_changed"

instance NodeSignal Input "joy_connection_changed" '[Int, Bool]

instance NodeProperty Input "mouse_mode" Int 'False where
        nodeProperty
          = (get_mouse_mode, wrapDroppingSetter set_mouse_mode, Nothing)

instance NodeProperty Input "use_accumulated_input" Bool 'False
         where
        nodeProperty
          = (is_using_accumulated_input,
             wrapDroppingSetter set_use_accumulated_input, Nothing)

{-# NOINLINE bindInput_action_press #-}

-- | This will simulate pressing the specified action.
--   				The strength can be used for non-boolean actions, it's ranged between 0 and 1 representing the intensity of the given action.
--   				__Note:__ This method will not cause any @method Node._input@ calls. It is intended to be used with @method is_action_pressed@ and @method is_action_just_pressed@. If you want to simulate @_input@, use @method parse_input_event@ instead.
bindInput_action_press :: MethodBind
bindInput_action_press
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "action_press" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This will simulate pressing the specified action.
--   				The strength can be used for non-boolean actions, it's ranged between 0 and 1 representing the intensity of the given action.
--   				__Note:__ This method will not cause any @method Node._input@ calls. It is intended to be used with @method is_action_pressed@ and @method is_action_just_pressed@. If you want to simulate @_input@, use @method parse_input_event@ instead.
action_press ::
               (Input :< cls, Object :< cls) =>
               cls -> GodotString -> Maybe Float -> IO ()
action_press cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantReal (1)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_action_press (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "action_press"
           '[GodotString, Maybe Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Input.action_press

{-# NOINLINE bindInput_action_release #-}

-- | If the specified action is already pressed, this will release it.
bindInput_action_release :: MethodBind
bindInput_action_release
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "action_release" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If the specified action is already pressed, this will release it.
action_release ::
                 (Input :< cls, Object :< cls) => cls -> GodotString -> IO ()
action_release cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_action_release (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "action_release" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.Input.action_release

{-# NOINLINE bindInput_add_joy_mapping #-}

-- | Adds a new mapping entry (in SDL2 format) to the mapping database. Optionally update already connected devices.
bindInput_add_joy_mapping :: MethodBind
bindInput_add_joy_mapping
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "add_joy_mapping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new mapping entry (in SDL2 format) to the mapping database. Optionally update already connected devices.
add_joy_mapping ::
                  (Input :< cls, Object :< cls) =>
                  cls -> GodotString -> Maybe Bool -> IO ()
add_joy_mapping cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_add_joy_mapping (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "add_joy_mapping"
           '[GodotString, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Input.add_joy_mapping

{-# NOINLINE bindInput_flush_buffered_events #-}

-- | Sends all input events which are in the current buffer to the game loop. These events may have been buffered as a result of accumulated input (@use_accumulated_input@) or agile input flushing (@ProjectSettings.input_devices/buffering/agile_event_flushing@).
--   				The engine will already do this itself at key execution points (at least once per frame). However, this can be useful in advanced cases where you want precise control over the timing of event handling.
bindInput_flush_buffered_events :: MethodBind
bindInput_flush_buffered_events
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "flush_buffered_events" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends all input events which are in the current buffer to the game loop. These events may have been buffered as a result of accumulated input (@use_accumulated_input@) or agile input flushing (@ProjectSettings.input_devices/buffering/agile_event_flushing@).
--   				The engine will already do this itself at key execution points (at least once per frame). However, this can be useful in advanced cases where you want precise control over the timing of event handling.
flush_buffered_events ::
                        (Input :< cls, Object :< cls) => cls -> IO ()
flush_buffered_events cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_flush_buffered_events (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "flush_buffered_events" '[] (IO ()) where
        nodeMethod = Godot.Core.Input.flush_buffered_events

{-# NOINLINE bindInput_get_accelerometer #-}

-- | Returns the acceleration of the device's accelerometer sensor, if the device has one. Otherwise, the method returns @Vector3.ZERO@.
--   				Note this method returns an empty @Vector3@ when running from the editor even when your device has an accelerometer. You must export your project to a supported device to read values from the accelerometer.
--   				__Note:__ This method only works on iOS, Android, and UWP. On other platforms, it always returns @Vector3.ZERO@. On Android the unit of measurement for each axis is m/s² while on iOS and UWP it's a multiple of the Earth's gravitational acceleration @g@ (~9.81 m/s²).
bindInput_get_accelerometer :: MethodBind
bindInput_get_accelerometer
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_accelerometer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the acceleration of the device's accelerometer sensor, if the device has one. Otherwise, the method returns @Vector3.ZERO@.
--   				Note this method returns an empty @Vector3@ when running from the editor even when your device has an accelerometer. You must export your project to a supported device to read values from the accelerometer.
--   				__Note:__ This method only works on iOS, Android, and UWP. On other platforms, it always returns @Vector3.ZERO@. On Android the unit of measurement for each axis is m/s² while on iOS and UWP it's a multiple of the Earth's gravitational acceleration @g@ (~9.81 m/s²).
get_accelerometer ::
                    (Input :< cls, Object :< cls) => cls -> IO Vector3
get_accelerometer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_accelerometer (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_accelerometer" '[] (IO Vector3)
         where
        nodeMethod = Godot.Core.Input.get_accelerometer

{-# NOINLINE bindInput_get_action_raw_strength #-}

-- | Returns a value between 0 and 1 representing the raw intensity of the given action, ignoring the action's deadzone. In most cases, you should use @method get_action_strength@ instead.
--   				If @exact@ is @false@, it ignores additional input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
bindInput_get_action_raw_strength :: MethodBind
bindInput_get_action_raw_strength
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_action_raw_strength" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a value between 0 and 1 representing the raw intensity of the given action, ignoring the action's deadzone. In most cases, you should use @method get_action_strength@ instead.
--   				If @exact@ is @false@, it ignores additional input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
get_action_raw_strength ::
                          (Input :< cls, Object :< cls) =>
                          cls -> GodotString -> Maybe Bool -> IO Float
get_action_raw_strength cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_action_raw_strength
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_action_raw_strength"
           '[GodotString, Maybe Bool]
           (IO Float)
         where
        nodeMethod = Godot.Core.Input.get_action_raw_strength

{-# NOINLINE bindInput_get_action_strength #-}

-- | Returns a value between 0 and 1 representing the intensity of the given action. In a joypad, for example, the further away the axis (analog sticks or L2, R2 triggers) is from the dead zone, the closer the value will be to 1. If the action is mapped to a control that has no axis as the keyboard, the value returned will be 0 or 1.
--   				If @exact@ is @false@, it ignores additional input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
bindInput_get_action_strength :: MethodBind
bindInput_get_action_strength
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_action_strength" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a value between 0 and 1 representing the intensity of the given action. In a joypad, for example, the further away the axis (analog sticks or L2, R2 triggers) is from the dead zone, the closer the value will be to 1. If the action is mapped to a control that has no axis as the keyboard, the value returned will be 0 or 1.
--   				If @exact@ is @false@, it ignores additional input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
get_action_strength ::
                      (Input :< cls, Object :< cls) =>
                      cls -> GodotString -> Maybe Bool -> IO Float
get_action_strength cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_action_strength (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_action_strength"
           '[GodotString, Maybe Bool]
           (IO Float)
         where
        nodeMethod = Godot.Core.Input.get_action_strength

{-# NOINLINE bindInput_get_axis #-}

-- | Get axis input by specifying two actions, one negative and one positive.
--   				This is a shorthand for writing @Input.get_action_strength("positive_action") - Input.get_action_strength("negative_action")@.
bindInput_get_axis :: MethodBind
bindInput_get_axis
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_axis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get axis input by specifying two actions, one negative and one positive.
--   				This is a shorthand for writing @Input.get_action_strength("positive_action") - Input.get_action_strength("negative_action")@.
get_axis ::
           (Input :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> IO Float
get_axis cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_axis (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_axis" '[GodotString, GodotString]
           (IO Float)
         where
        nodeMethod = Godot.Core.Input.get_axis

{-# NOINLINE bindInput_get_connected_joypads #-}

-- | Returns an @Array@ containing the device IDs of all currently connected joypads.
bindInput_get_connected_joypads :: MethodBind
bindInput_get_connected_joypads
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_connected_joypads" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an @Array@ containing the device IDs of all currently connected joypads.
get_connected_joypads ::
                        (Input :< cls, Object :< cls) => cls -> IO Array
get_connected_joypads cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_connected_joypads (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_connected_joypads" '[] (IO Array)
         where
        nodeMethod = Godot.Core.Input.get_connected_joypads

{-# NOINLINE bindInput_get_current_cursor_shape #-}

-- | Returns the currently assigned cursor shape (see @enum CursorShape@).
bindInput_get_current_cursor_shape :: MethodBind
bindInput_get_current_cursor_shape
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_current_cursor_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the currently assigned cursor shape (see @enum CursorShape@).
get_current_cursor_shape ::
                           (Input :< cls, Object :< cls) => cls -> IO Int
get_current_cursor_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_current_cursor_shape
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_current_cursor_shape" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Input.get_current_cursor_shape

{-# NOINLINE bindInput_get_gravity #-}

-- | Returns the gravity of the device's accelerometer sensor, if the device has one. Otherwise, the method returns @Vector3.ZERO@.
--   				__Note:__ This method only works on Android and iOS. On other platforms, it always returns @Vector3.ZERO@. On Android the unit of measurement for each axis is m/s² while on iOS it's a multiple of the Earth's gravitational acceleration @g@ (~9.81 m/s²).
bindInput_get_gravity :: MethodBind
bindInput_get_gravity
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the gravity of the device's accelerometer sensor, if the device has one. Otherwise, the method returns @Vector3.ZERO@.
--   				__Note:__ This method only works on Android and iOS. On other platforms, it always returns @Vector3.ZERO@. On Android the unit of measurement for each axis is m/s² while on iOS it's a multiple of the Earth's gravitational acceleration @g@ (~9.81 m/s²).
get_gravity :: (Input :< cls, Object :< cls) => cls -> IO Vector3
get_gravity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_gravity (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_gravity" '[] (IO Vector3) where
        nodeMethod = Godot.Core.Input.get_gravity

{-# NOINLINE bindInput_get_gyroscope #-}

-- | Returns the rotation rate in rad/s around a device's X, Y, and Z axes of the gyroscope sensor, if the device has one. Otherwise, the method returns @Vector3.ZERO@.
--   				__Note:__ This method only works on Android and iOS. On other platforms, it always returns @Vector3.ZERO@.
bindInput_get_gyroscope :: MethodBind
bindInput_get_gyroscope
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_gyroscope" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the rotation rate in rad/s around a device's X, Y, and Z axes of the gyroscope sensor, if the device has one. Otherwise, the method returns @Vector3.ZERO@.
--   				__Note:__ This method only works on Android and iOS. On other platforms, it always returns @Vector3.ZERO@.
get_gyroscope :: (Input :< cls, Object :< cls) => cls -> IO Vector3
get_gyroscope cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_gyroscope (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_gyroscope" '[] (IO Vector3) where
        nodeMethod = Godot.Core.Input.get_gyroscope

{-# NOINLINE bindInput_get_joy_axis #-}

-- | Returns the current value of the joypad axis at given index (see @enum JoystickList@).
bindInput_get_joy_axis :: MethodBind
bindInput_get_joy_axis
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_axis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current value of the joypad axis at given index (see @enum JoystickList@).
get_joy_axis ::
               (Input :< cls, Object :< cls) => cls -> Int -> Int -> IO Float
get_joy_axis cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_axis (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_joy_axis" '[Int, Int] (IO Float)
         where
        nodeMethod = Godot.Core.Input.get_joy_axis

{-# NOINLINE bindInput_get_joy_axis_index_from_string #-}

-- | Returns the index of the provided axis name.
bindInput_get_joy_axis_index_from_string :: MethodBind
bindInput_get_joy_axis_index_from_string
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_axis_index_from_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the index of the provided axis name.
get_joy_axis_index_from_string ::
                                 (Input :< cls, Object :< cls) => cls -> GodotString -> IO Int
get_joy_axis_index_from_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_axis_index_from_string
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_joy_axis_index_from_string"
           '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.Input.get_joy_axis_index_from_string

{-# NOINLINE bindInput_get_joy_axis_string #-}

-- | Receives a @enum JoystickList@ axis and returns its equivalent name as a string.
bindInput_get_joy_axis_string :: MethodBind
bindInput_get_joy_axis_string
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_axis_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Receives a @enum JoystickList@ axis and returns its equivalent name as a string.
get_joy_axis_string ::
                      (Input :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_joy_axis_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_axis_string (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_joy_axis_string" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Input.get_joy_axis_string

{-# NOINLINE bindInput_get_joy_button_index_from_string #-}

-- | Returns the index of the provided button name.
bindInput_get_joy_button_index_from_string :: MethodBind
bindInput_get_joy_button_index_from_string
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_button_index_from_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the index of the provided button name.
get_joy_button_index_from_string ::
                                   (Input :< cls, Object :< cls) => cls -> GodotString -> IO Int
get_joy_button_index_from_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_button_index_from_string
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_joy_button_index_from_string"
           '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.Input.get_joy_button_index_from_string

{-# NOINLINE bindInput_get_joy_button_string #-}

-- | Receives a gamepad button from @enum JoystickList@ and returns its equivalent name as a string.
bindInput_get_joy_button_string :: MethodBind
bindInput_get_joy_button_string
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_button_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Receives a gamepad button from @enum JoystickList@ and returns its equivalent name as a string.
get_joy_button_string ::
                        (Input :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_joy_button_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_button_string (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_joy_button_string" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Input.get_joy_button_string

{-# NOINLINE bindInput_get_joy_guid #-}

-- | Returns a SDL2-compatible device GUID on platforms that use gamepad remapping, e.g. @030000004c050000c405000000010000@. Returns @"Default Gamepad"@ otherwise. Godot uses the @url=https://github.com/gabomdq/SDL_GameControllerDB@SDL2 game controller database@/url@ to determine gamepad names and mappings based on this GUID.
bindInput_get_joy_guid :: MethodBind
bindInput_get_joy_guid
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_guid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a SDL2-compatible device GUID on platforms that use gamepad remapping, e.g. @030000004c050000c405000000010000@. Returns @"Default Gamepad"@ otherwise. Godot uses the @url=https://github.com/gabomdq/SDL_GameControllerDB@SDL2 game controller database@/url@ to determine gamepad names and mappings based on this GUID.
get_joy_guid ::
               (Input :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_joy_guid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_guid (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_joy_guid" '[Int] (IO GodotString)
         where
        nodeMethod = Godot.Core.Input.get_joy_guid

{-# NOINLINE bindInput_get_joy_name #-}

-- | Returns the name of the joypad at the specified device index, e.g. @PS4 Controller@. Godot uses the @url=https://github.com/gabomdq/SDL_GameControllerDB@SDL2 game controller database@/url@ to determine gamepad names.
bindInput_get_joy_name :: MethodBind
bindInput_get_joy_name
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the joypad at the specified device index, e.g. @PS4 Controller@. Godot uses the @url=https://github.com/gabomdq/SDL_GameControllerDB@SDL2 game controller database@/url@ to determine gamepad names.
get_joy_name ::
               (Input :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_joy_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_name (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_joy_name" '[Int] (IO GodotString)
         where
        nodeMethod = Godot.Core.Input.get_joy_name

{-# NOINLINE bindInput_get_joy_vibration_duration #-}

-- | Returns the duration of the current vibration effect in seconds.
bindInput_get_joy_vibration_duration :: MethodBind
bindInput_get_joy_vibration_duration
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_vibration_duration" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the duration of the current vibration effect in seconds.
get_joy_vibration_duration ::
                             (Input :< cls, Object :< cls) => cls -> Int -> IO Float
get_joy_vibration_duration cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_vibration_duration
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_joy_vibration_duration" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.Input.get_joy_vibration_duration

{-# NOINLINE bindInput_get_joy_vibration_strength #-}

-- | Returns the strength of the joypad vibration: x is the strength of the weak motor, and y is the strength of the strong motor.
bindInput_get_joy_vibration_strength :: MethodBind
bindInput_get_joy_vibration_strength
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_vibration_strength" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the strength of the joypad vibration: x is the strength of the weak motor, and y is the strength of the strong motor.
get_joy_vibration_strength ::
                             (Input :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_joy_vibration_strength cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_vibration_strength
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_joy_vibration_strength" '[Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Input.get_joy_vibration_strength

{-# NOINLINE bindInput_get_last_mouse_speed #-}

-- | Returns the last mouse speed. To provide a precise and jitter-free speed, mouse speed is only calculated every 0.1s. Therefore, mouse speed will lag mouse movements.
bindInput_get_last_mouse_speed :: MethodBind
bindInput_get_last_mouse_speed
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_last_mouse_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the last mouse speed. To provide a precise and jitter-free speed, mouse speed is only calculated every 0.1s. Therefore, mouse speed will lag mouse movements.
get_last_mouse_speed ::
                       (Input :< cls, Object :< cls) => cls -> IO Vector2
get_last_mouse_speed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_last_mouse_speed (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_last_mouse_speed" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.Input.get_last_mouse_speed

{-# NOINLINE bindInput_get_magnetometer #-}

-- | Returns the magnetic field strength in micro-Tesla for all axes of the device's magnetometer sensor, if the device has one. Otherwise, the method returns @Vector3.ZERO@.
--   				__Note:__ This method only works on Android, iOS and UWP. On other platforms, it always returns @Vector3.ZERO@.
bindInput_get_magnetometer :: MethodBind
bindInput_get_magnetometer
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_magnetometer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the magnetic field strength in micro-Tesla for all axes of the device's magnetometer sensor, if the device has one. Otherwise, the method returns @Vector3.ZERO@.
--   				__Note:__ This method only works on Android, iOS and UWP. On other platforms, it always returns @Vector3.ZERO@.
get_magnetometer ::
                   (Input :< cls, Object :< cls) => cls -> IO Vector3
get_magnetometer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_magnetometer (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_magnetometer" '[] (IO Vector3) where
        nodeMethod = Godot.Core.Input.get_magnetometer

{-# NOINLINE bindInput_get_mouse_button_mask #-}

-- | Returns mouse buttons as a bitmask. If multiple mouse buttons are pressed at the same time, the bits are added together.
bindInput_get_mouse_button_mask :: MethodBind
bindInput_get_mouse_button_mask
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_mouse_button_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns mouse buttons as a bitmask. If multiple mouse buttons are pressed at the same time, the bits are added together.
get_mouse_button_mask ::
                        (Input :< cls, Object :< cls) => cls -> IO Int
get_mouse_button_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_mouse_button_mask (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_mouse_button_mask" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Input.get_mouse_button_mask

{-# NOINLINE bindInput_get_mouse_mode #-}

-- | Controls the mouse mode. See @enum MouseMode@ for more information.
bindInput_get_mouse_mode :: MethodBind
bindInput_get_mouse_mode
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_mouse_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the mouse mode. See @enum MouseMode@ for more information.
get_mouse_mode :: (Input :< cls, Object :< cls) => cls -> IO Int
get_mouse_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_mouse_mode (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_mouse_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.Input.get_mouse_mode

{-# NOINLINE bindInput_get_vector #-}

-- | Gets an input vector by specifying four actions for the positive and negative X and Y axes.
--   				This method is useful when getting vector input, such as from a joystick, directional pad, arrows, or WASD. The vector has its length limited to 1 and has a circular deadzone, which is useful for using vector input as movement.
--   				By default, the deadzone is automatically calculated from the average of the action deadzones. However, you can override the deadzone to be whatever you want (on the range of 0 to 1).
bindInput_get_vector :: MethodBind
bindInput_get_vector
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_vector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets an input vector by specifying four actions for the positive and negative X and Y axes.
--   				This method is useful when getting vector input, such as from a joystick, directional pad, arrows, or WASD. The vector has its length limited to 1 and has a circular deadzone, which is useful for using vector input as movement.
--   				By default, the deadzone is automatically calculated from the average of the action deadzones. However, you can override the deadzone to be whatever you want (on the range of 0 to 1).
get_vector ::
             (Input :< cls, Object :< cls) =>
             cls ->
               GodotString ->
                 GodotString ->
                   GodotString -> GodotString -> Maybe Float -> IO Vector2
get_vector cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       maybe (VariantReal (-1)) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_vector (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "get_vector"
           '[GodotString, GodotString, GodotString, GodotString, Maybe Float]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Input.get_vector

{-# NOINLINE bindInput_is_action_just_pressed #-}

-- | Returns @true@ when the user has @i@started@/i@ pressing the action event in the current frame or physics tick. It will only return @true@ on the frame or tick that the user pressed down the button.
--   				This is useful for code that needs to run only once when an action is pressed, instead of every frame while it's pressed.
--   				If @exact@ is @false@, it ignores additional input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
--   				__Note:__ Returning @true@ does not imply that the action is @i@still@/i@ pressed. An action can be pressed and released again rapidly, and @true@ will still be returned so as not to miss input.
--   				__Note:__ Due to keyboard ghosting, @method is_action_just_pressed@ may return @false@ even if one of the action's keys is pressed. See @url=$DOCS_URL/tutorials/inputs/input_examples.html#keyboard-events@Input examples@/url@ in the documentation for more information.
bindInput_is_action_just_pressed :: MethodBind
bindInput_is_action_just_pressed
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "is_action_just_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ when the user has @i@started@/i@ pressing the action event in the current frame or physics tick. It will only return @true@ on the frame or tick that the user pressed down the button.
--   				This is useful for code that needs to run only once when an action is pressed, instead of every frame while it's pressed.
--   				If @exact@ is @false@, it ignores additional input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
--   				__Note:__ Returning @true@ does not imply that the action is @i@still@/i@ pressed. An action can be pressed and released again rapidly, and @true@ will still be returned so as not to miss input.
--   				__Note:__ Due to keyboard ghosting, @method is_action_just_pressed@ may return @false@ even if one of the action's keys is pressed. See @url=$DOCS_URL/tutorials/inputs/input_examples.html#keyboard-events@Input examples@/url@ in the documentation for more information.
is_action_just_pressed ::
                         (Input :< cls, Object :< cls) =>
                         cls -> GodotString -> Maybe Bool -> IO Bool
is_action_just_pressed cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_is_action_just_pressed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "is_action_just_pressed"
           '[GodotString, Maybe Bool]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Input.is_action_just_pressed

{-# NOINLINE bindInput_is_action_just_released #-}

-- | Returns @true@ when the user @i@stops@/i@ pressing the action event in the current frame or physics tick. It will only return @true@ on the frame or tick that the user releases the button.
--   				If @exact@ is @false@, it ignores additional input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
--   				__Note:__ Returning @true@ does not imply that the action is @i@still@/i@ not pressed. An action can be released and pressed again rapidly, and @true@ will still be returned so as not to miss input.
bindInput_is_action_just_released :: MethodBind
bindInput_is_action_just_released
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "is_action_just_released" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ when the user @i@stops@/i@ pressing the action event in the current frame or physics tick. It will only return @true@ on the frame or tick that the user releases the button.
--   				If @exact@ is @false@, it ignores additional input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
--   				__Note:__ Returning @true@ does not imply that the action is @i@still@/i@ not pressed. An action can be released and pressed again rapidly, and @true@ will still be returned so as not to miss input.
is_action_just_released ::
                          (Input :< cls, Object :< cls) =>
                          cls -> GodotString -> Maybe Bool -> IO Bool
is_action_just_released cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_is_action_just_released
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "is_action_just_released"
           '[GodotString, Maybe Bool]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Input.is_action_just_released

{-# NOINLINE bindInput_is_action_pressed #-}

-- | Returns @true@ if you are pressing the action event. Note that if an action has multiple buttons assigned and more than one of them is pressed, releasing one button will release the action, even if some other button assigned to this action is still pressed.
--   				If @exact@ is @false@, it ignores additional input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
--   				__Note:__ Due to keyboard ghosting, @method is_action_pressed@ may return @false@ even if one of the action's keys is pressed. See @url=$DOCS_URL/tutorials/inputs/input_examples.html#keyboard-events@Input examples@/url@ in the documentation for more information.
bindInput_is_action_pressed :: MethodBind
bindInput_is_action_pressed
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "is_action_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if you are pressing the action event. Note that if an action has multiple buttons assigned and more than one of them is pressed, releasing one button will release the action, even if some other button assigned to this action is still pressed.
--   				If @exact@ is @false@, it ignores additional input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
--   				__Note:__ Due to keyboard ghosting, @method is_action_pressed@ may return @false@ even if one of the action's keys is pressed. See @url=$DOCS_URL/tutorials/inputs/input_examples.html#keyboard-events@Input examples@/url@ in the documentation for more information.
is_action_pressed ::
                    (Input :< cls, Object :< cls) =>
                    cls -> GodotString -> Maybe Bool -> IO Bool
is_action_pressed cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_is_action_pressed (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "is_action_pressed"
           '[GodotString, Maybe Bool]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Input.is_action_pressed

{-# NOINLINE bindInput_is_joy_button_pressed #-}

-- | Returns @true@ if you are pressing the joypad button (see @enum JoystickList@).
bindInput_is_joy_button_pressed :: MethodBind
bindInput_is_joy_button_pressed
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "is_joy_button_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if you are pressing the joypad button (see @enum JoystickList@).
is_joy_button_pressed ::
                        (Input :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
is_joy_button_pressed cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_is_joy_button_pressed (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "is_joy_button_pressed" '[Int, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Input.is_joy_button_pressed

{-# NOINLINE bindInput_is_joy_known #-}

-- | Returns @true@ if the system knows the specified device. This means that it sets all button and axis indices exactly as defined in @enum JoystickList@. Unknown joypads are not expected to match these constants, but you can still retrieve events from them.
bindInput_is_joy_known :: MethodBind
bindInput_is_joy_known
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "is_joy_known" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the system knows the specified device. This means that it sets all button and axis indices exactly as defined in @enum JoystickList@. Unknown joypads are not expected to match these constants, but you can still retrieve events from them.
is_joy_known ::
               (Input :< cls, Object :< cls) => cls -> Int -> IO Bool
is_joy_known cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_is_joy_known (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "is_joy_known" '[Int] (IO Bool) where
        nodeMethod = Godot.Core.Input.is_joy_known

{-# NOINLINE bindInput_is_key_pressed #-}

-- | Returns @true@ if you are pressing the key in the current keyboard layout. You can pass a @enum KeyList@ constant.
--   				@method is_key_pressed@ is only recommended over @method is_physical_key_pressed@ in non-game applications. This ensures that shortcut keys behave as expected depending on the user's keyboard layout, as keyboard shortcuts are generally dependent on the keyboard layout in non-game applications. If in doubt, use @method is_physical_key_pressed@.
--   				__Note:__ Due to keyboard ghosting, @method is_key_pressed@ may return @false@ even if one of the action's keys is pressed. See @url=$DOCS_URL/tutorials/inputs/input_examples.html#keyboard-events@Input examples@/url@ in the documentation for more information.
bindInput_is_key_pressed :: MethodBind
bindInput_is_key_pressed
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "is_key_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if you are pressing the key in the current keyboard layout. You can pass a @enum KeyList@ constant.
--   				@method is_key_pressed@ is only recommended over @method is_physical_key_pressed@ in non-game applications. This ensures that shortcut keys behave as expected depending on the user's keyboard layout, as keyboard shortcuts are generally dependent on the keyboard layout in non-game applications. If in doubt, use @method is_physical_key_pressed@.
--   				__Note:__ Due to keyboard ghosting, @method is_key_pressed@ may return @false@ even if one of the action's keys is pressed. See @url=$DOCS_URL/tutorials/inputs/input_examples.html#keyboard-events@Input examples@/url@ in the documentation for more information.
is_key_pressed ::
                 (Input :< cls, Object :< cls) => cls -> Int -> IO Bool
is_key_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_is_key_pressed (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "is_key_pressed" '[Int] (IO Bool) where
        nodeMethod = Godot.Core.Input.is_key_pressed

{-# NOINLINE bindInput_is_mouse_button_pressed #-}

-- | Returns @true@ if you are pressing the mouse button specified with @enum ButtonList@.
bindInput_is_mouse_button_pressed :: MethodBind
bindInput_is_mouse_button_pressed
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "is_mouse_button_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if you are pressing the mouse button specified with @enum ButtonList@.
is_mouse_button_pressed ::
                          (Input :< cls, Object :< cls) => cls -> Int -> IO Bool
is_mouse_button_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_is_mouse_button_pressed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "is_mouse_button_pressed" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Input.is_mouse_button_pressed

{-# NOINLINE bindInput_is_physical_key_pressed #-}

-- | Returns @true@ if you are pressing the key in the physical location on the 101/102-key US QWERTY keyboard. You can pass a @enum KeyList@ constant.
--   				@method is_physical_key_pressed@ is recommended over @method is_key_pressed@ for in-game actions, as it will make W/A/S/D layouts work regardless of the user's keyboard layout. @method is_physical_key_pressed@ will also ensure that the top row number keys work on any keyboard layout. If in doubt, use @method is_physical_key_pressed@.
--   				__Note:__ Due to keyboard ghosting, @method is_physical_key_pressed@ may return @false@ even if one of the action's keys is pressed. See @url=$DOCS_URL/tutorials/inputs/input_examples.html#keyboard-events@Input examples@/url@ in the documentation for more information.
bindInput_is_physical_key_pressed :: MethodBind
bindInput_is_physical_key_pressed
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "is_physical_key_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if you are pressing the key in the physical location on the 101/102-key US QWERTY keyboard. You can pass a @enum KeyList@ constant.
--   				@method is_physical_key_pressed@ is recommended over @method is_key_pressed@ for in-game actions, as it will make W/A/S/D layouts work regardless of the user's keyboard layout. @method is_physical_key_pressed@ will also ensure that the top row number keys work on any keyboard layout. If in doubt, use @method is_physical_key_pressed@.
--   				__Note:__ Due to keyboard ghosting, @method is_physical_key_pressed@ may return @false@ even if one of the action's keys is pressed. See @url=$DOCS_URL/tutorials/inputs/input_examples.html#keyboard-events@Input examples@/url@ in the documentation for more information.
is_physical_key_pressed ::
                          (Input :< cls, Object :< cls) => cls -> Int -> IO Bool
is_physical_key_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_is_physical_key_pressed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "is_physical_key_pressed" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Input.is_physical_key_pressed

{-# NOINLINE bindInput_is_using_accumulated_input #-}

-- | If @true@, similar input events sent by the operating system are accumulated. When input accumulation is enabled, all input events generated during a frame will be merged and emitted when the frame is done rendering. Therefore, this limits the number of input method calls per second to the rendering FPS.
--   			Input accumulation can be disabled to get slightly more precise/reactive input at the cost of increased CPU usage. In applications where drawing freehand lines is required, input accumulation should generally be disabled while the user is drawing the line to get results that closely follow the actual input.
--   			__Note:__ Input accumulation is @i@enabled@/i@ by default. It is recommended to keep it enabled for games which don't require very reactive input, as this will decrease CPU usage.
bindInput_is_using_accumulated_input :: MethodBind
bindInput_is_using_accumulated_input
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "is_using_accumulated_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, similar input events sent by the operating system are accumulated. When input accumulation is enabled, all input events generated during a frame will be merged and emitted when the frame is done rendering. Therefore, this limits the number of input method calls per second to the rendering FPS.
--   			Input accumulation can be disabled to get slightly more precise/reactive input at the cost of increased CPU usage. In applications where drawing freehand lines is required, input accumulation should generally be disabled while the user is drawing the line to get results that closely follow the actual input.
--   			__Note:__ Input accumulation is @i@enabled@/i@ by default. It is recommended to keep it enabled for games which don't require very reactive input, as this will decrease CPU usage.
is_using_accumulated_input ::
                             (Input :< cls, Object :< cls) => cls -> IO Bool
is_using_accumulated_input cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_is_using_accumulated_input
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "is_using_accumulated_input" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Input.is_using_accumulated_input

{-# NOINLINE bindInput_joy_connection_changed #-}

-- | Notifies the @Input@ singleton that a connection has changed, to update the state for the @device@ index.
--   				This is used internally and should not have to be called from user scripts. See @signal joy_connection_changed@ for the signal emitted when this is triggered internally.
bindInput_joy_connection_changed :: MethodBind
bindInput_joy_connection_changed
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "joy_connection_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Notifies the @Input@ singleton that a connection has changed, to update the state for the @device@ index.
--   				This is used internally and should not have to be called from user scripts. See @signal joy_connection_changed@ for the signal emitted when this is triggered internally.
joy_connection_changed ::
                         (Input :< cls, Object :< cls) =>
                         cls -> Int -> Bool -> GodotString -> GodotString -> IO ()
joy_connection_changed cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_joy_connection_changed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "joy_connection_changed"
           '[Int, Bool, GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Input.joy_connection_changed

{-# NOINLINE bindInput_parse_input_event #-}

-- | Feeds an @InputEvent@ to the game. Can be used to artificially trigger input events from code. Also generates @method Node._input@ calls.
--   				Example:
--   				
--   @
--   
--   				var a = InputEventAction.new()
--   				a.action = "ui_cancel"
--   				a.pressed = true
--   				Input.parse_input_event(a)
--   				
--   @
bindInput_parse_input_event :: MethodBind
bindInput_parse_input_event
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "parse_input_event" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Feeds an @InputEvent@ to the game. Can be used to artificially trigger input events from code. Also generates @method Node._input@ calls.
--   				Example:
--   				
--   @
--   
--   				var a = InputEventAction.new()
--   				a.action = "ui_cancel"
--   				a.pressed = true
--   				Input.parse_input_event(a)
--   				
--   @
parse_input_event ::
                    (Input :< cls, Object :< cls) => cls -> InputEvent -> IO ()
parse_input_event cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_parse_input_event (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "parse_input_event" '[InputEvent] (IO ())
         where
        nodeMethod = Godot.Core.Input.parse_input_event

{-# NOINLINE bindInput_remove_joy_mapping #-}

-- | Removes all mappings from the internal database that match the given GUID.
bindInput_remove_joy_mapping :: MethodBind
bindInput_remove_joy_mapping
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "remove_joy_mapping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all mappings from the internal database that match the given GUID.
remove_joy_mapping ::
                     (Input :< cls, Object :< cls) => cls -> GodotString -> IO ()
remove_joy_mapping cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_remove_joy_mapping (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "remove_joy_mapping" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Input.remove_joy_mapping

{-# NOINLINE bindInput_set_accelerometer #-}

-- | Sets the acceleration value of the accelerometer sensor. Can be used for debugging on devices without a hardware sensor, for example in an editor on a PC.
--   				__Note:__ This value can be immediately overwritten by the hardware sensor value on Android and iOS.
bindInput_set_accelerometer :: MethodBind
bindInput_set_accelerometer
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "set_accelerometer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the acceleration value of the accelerometer sensor. Can be used for debugging on devices without a hardware sensor, for example in an editor on a PC.
--   				__Note:__ This value can be immediately overwritten by the hardware sensor value on Android and iOS.
set_accelerometer ::
                    (Input :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_accelerometer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_set_accelerometer (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "set_accelerometer" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.Input.set_accelerometer

{-# NOINLINE bindInput_set_custom_mouse_cursor #-}

-- | Sets a custom mouse cursor image, which is only visible inside the game window. The hotspot can also be specified. Passing @null@ to the image parameter resets to the system cursor. See @enum CursorShape@ for the list of shapes.
--   				@image@'s size must be lower than or equal to 256×256. To avoid rendering issues, sizes lower than or equal to 128×128 are recommended.
--   				@hotspot@ must be within @image@'s size.
--   				__Note:__ @AnimatedTexture@s aren't supported as custom mouse cursors. If using an @AnimatedTexture@, only the first frame will be displayed.
--   				__Note:__ Only images imported with the __Lossless__, __Lossy__ or __Uncompressed__ compression modes are supported. The __Video RAM__ compression mode can't be used for custom cursors.
--   				__Note:__ On the web platform, the maximum allowed cursor image size is 128×128. Cursor images larger than 32×32 will also only be displayed if the mouse cursor image is entirely located within the page for @url=https://chromestatus.com/feature/5825971391299584@security reasons@/url@.
bindInput_set_custom_mouse_cursor :: MethodBind
bindInput_set_custom_mouse_cursor
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "set_custom_mouse_cursor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a custom mouse cursor image, which is only visible inside the game window. The hotspot can also be specified. Passing @null@ to the image parameter resets to the system cursor. See @enum CursorShape@ for the list of shapes.
--   				@image@'s size must be lower than or equal to 256×256. To avoid rendering issues, sizes lower than or equal to 128×128 are recommended.
--   				@hotspot@ must be within @image@'s size.
--   				__Note:__ @AnimatedTexture@s aren't supported as custom mouse cursors. If using an @AnimatedTexture@, only the first frame will be displayed.
--   				__Note:__ Only images imported with the __Lossless__, __Lossy__ or __Uncompressed__ compression modes are supported. The __Video RAM__ compression mode can't be used for custom cursors.
--   				__Note:__ On the web platform, the maximum allowed cursor image size is 128×128. Cursor images larger than 32×32 will also only be displayed if the mouse cursor image is entirely located within the page for @url=https://chromestatus.com/feature/5825971391299584@security reasons@/url@.
set_custom_mouse_cursor ::
                          (Input :< cls, Object :< cls) =>
                          cls -> Resource -> Maybe Int -> Maybe Vector2 -> IO ()
set_custom_mouse_cursor cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (0)) toVariant arg2,
       defaultedVariant VariantVector2 (V2 0 0) arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_set_custom_mouse_cursor
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "set_custom_mouse_cursor"
           '[Resource, Maybe Int, Maybe Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Input.set_custom_mouse_cursor

{-# NOINLINE bindInput_set_default_cursor_shape #-}

-- | Sets the default cursor shape to be used in the viewport instead of @CURSOR_ARROW@.
--   				__Note:__ If you want to change the default cursor shape for @Control@'s nodes, use @Control.mouse_default_cursor_shape@ instead.
--   				__Note:__ This method generates an @InputEventMouseMotion@ to update cursor immediately.
bindInput_set_default_cursor_shape :: MethodBind
bindInput_set_default_cursor_shape
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "set_default_cursor_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the default cursor shape to be used in the viewport instead of @CURSOR_ARROW@.
--   				__Note:__ If you want to change the default cursor shape for @Control@'s nodes, use @Control.mouse_default_cursor_shape@ instead.
--   				__Note:__ This method generates an @InputEventMouseMotion@ to update cursor immediately.
set_default_cursor_shape ::
                           (Input :< cls, Object :< cls) => cls -> Maybe Int -> IO ()
set_default_cursor_shape cls arg1
  = withVariantArray [maybe (VariantInt (0)) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_set_default_cursor_shape
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "set_default_cursor_shape" '[Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Input.set_default_cursor_shape

{-# NOINLINE bindInput_set_gravity #-}

-- | Sets the gravity value of the accelerometer sensor. Can be used for debugging on devices without a hardware sensor, for example in an editor on a PC.
--   				__Note:__ This value can be immediately overwritten by the hardware sensor value on Android and iOS.
bindInput_set_gravity :: MethodBind
bindInput_set_gravity
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "set_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the gravity value of the accelerometer sensor. Can be used for debugging on devices without a hardware sensor, for example in an editor on a PC.
--   				__Note:__ This value can be immediately overwritten by the hardware sensor value on Android and iOS.
set_gravity ::
              (Input :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_gravity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_set_gravity (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "set_gravity" '[Vector3] (IO ()) where
        nodeMethod = Godot.Core.Input.set_gravity

{-# NOINLINE bindInput_set_gyroscope #-}

-- | Sets the value of the rotation rate of the gyroscope sensor. Can be used for debugging on devices without a hardware sensor, for example in an editor on a PC.
--   				__Note:__ This value can be immediately overwritten by the hardware sensor value on Android and iOS.
bindInput_set_gyroscope :: MethodBind
bindInput_set_gyroscope
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "set_gyroscope" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the value of the rotation rate of the gyroscope sensor. Can be used for debugging on devices without a hardware sensor, for example in an editor on a PC.
--   				__Note:__ This value can be immediately overwritten by the hardware sensor value on Android and iOS.
set_gyroscope ::
                (Input :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_gyroscope cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_set_gyroscope (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "set_gyroscope" '[Vector3] (IO ()) where
        nodeMethod = Godot.Core.Input.set_gyroscope

{-# NOINLINE bindInput_set_magnetometer #-}

-- | Sets the value of the magnetic field of the magnetometer sensor. Can be used for debugging on devices without a hardware sensor, for example in an editor on a PC.
--   				__Note:__ This value can be immediately overwritten by the hardware sensor value on Android and iOS.
bindInput_set_magnetometer :: MethodBind
bindInput_set_magnetometer
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "set_magnetometer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the value of the magnetic field of the magnetometer sensor. Can be used for debugging on devices without a hardware sensor, for example in an editor on a PC.
--   				__Note:__ This value can be immediately overwritten by the hardware sensor value on Android and iOS.
set_magnetometer ::
                   (Input :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_magnetometer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_set_magnetometer (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "set_magnetometer" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.Input.set_magnetometer

{-# NOINLINE bindInput_set_mouse_mode #-}

-- | Controls the mouse mode. See @enum MouseMode@ for more information.
bindInput_set_mouse_mode :: MethodBind
bindInput_set_mouse_mode
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "set_mouse_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the mouse mode. See @enum MouseMode@ for more information.
set_mouse_mode ::
                 (Input :< cls, Object :< cls) => cls -> Int -> IO ()
set_mouse_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_set_mouse_mode (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "set_mouse_mode" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Input.set_mouse_mode

{-# NOINLINE bindInput_set_use_accumulated_input #-}

-- | If @true@, similar input events sent by the operating system are accumulated. When input accumulation is enabled, all input events generated during a frame will be merged and emitted when the frame is done rendering. Therefore, this limits the number of input method calls per second to the rendering FPS.
--   			Input accumulation can be disabled to get slightly more precise/reactive input at the cost of increased CPU usage. In applications where drawing freehand lines is required, input accumulation should generally be disabled while the user is drawing the line to get results that closely follow the actual input.
--   			__Note:__ Input accumulation is @i@enabled@/i@ by default. It is recommended to keep it enabled for games which don't require very reactive input, as this will decrease CPU usage.
bindInput_set_use_accumulated_input :: MethodBind
bindInput_set_use_accumulated_input
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "set_use_accumulated_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, similar input events sent by the operating system are accumulated. When input accumulation is enabled, all input events generated during a frame will be merged and emitted when the frame is done rendering. Therefore, this limits the number of input method calls per second to the rendering FPS.
--   			Input accumulation can be disabled to get slightly more precise/reactive input at the cost of increased CPU usage. In applications where drawing freehand lines is required, input accumulation should generally be disabled while the user is drawing the line to get results that closely follow the actual input.
--   			__Note:__ Input accumulation is @i@enabled@/i@ by default. It is recommended to keep it enabled for games which don't require very reactive input, as this will decrease CPU usage.
set_use_accumulated_input ::
                            (Input :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_accumulated_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_set_use_accumulated_input
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "set_use_accumulated_input" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Input.set_use_accumulated_input

{-# NOINLINE bindInput_should_ignore_device #-}

-- | Queries whether an input device should be ignored or not. Devices can be ignored by setting the environment variable @SDL_GAMECONTROLLER_IGNORE_DEVICES@. Read the @url=https://wiki.libsdl.org/SDL2@SDL documentation@/url@ for more information.
--   				__Note:__ Some 3rd party tools can contribute to the list of ignored devices. For example, @i@SteamInput@/i@ creates virtual devices from physical devices for remapping purposes. To avoid handling the same input device twice, the original device is added to the ignore list.
bindInput_should_ignore_device :: MethodBind
bindInput_should_ignore_device
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "should_ignore_device" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Queries whether an input device should be ignored or not. Devices can be ignored by setting the environment variable @SDL_GAMECONTROLLER_IGNORE_DEVICES@. Read the @url=https://wiki.libsdl.org/SDL2@SDL documentation@/url@ for more information.
--   				__Note:__ Some 3rd party tools can contribute to the list of ignored devices. For example, @i@SteamInput@/i@ creates virtual devices from physical devices for remapping purposes. To avoid handling the same input device twice, the original device is added to the ignore list.
should_ignore_device ::
                       (Input :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
should_ignore_device cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_should_ignore_device (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "should_ignore_device" '[Int, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Input.should_ignore_device

{-# NOINLINE bindInput_start_joy_vibration #-}

-- | Starts to vibrate the joypad. Joypads usually come with two rumble motors, a strong and a weak one. @weak_magnitude@ is the strength of the weak motor (between 0 and 1) and @strong_magnitude@ is the strength of the strong motor (between 0 and 1). @duration@ is the duration of the effect in seconds (a duration of 0 will try to play the vibration indefinitely). The vibration can be stopped early by calling @method stop_joy_vibration@.
--   				__Note:__ Not every hardware is compatible with long effect durations; it is recommended to restart an effect if it has to be played for more than a few seconds.
bindInput_start_joy_vibration :: MethodBind
bindInput_start_joy_vibration
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "start_joy_vibration" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Starts to vibrate the joypad. Joypads usually come with two rumble motors, a strong and a weak one. @weak_magnitude@ is the strength of the weak motor (between 0 and 1) and @strong_magnitude@ is the strength of the strong motor (between 0 and 1). @duration@ is the duration of the effect in seconds (a duration of 0 will try to play the vibration indefinitely). The vibration can be stopped early by calling @method stop_joy_vibration@.
--   				__Note:__ Not every hardware is compatible with long effect durations; it is recommended to restart an effect if it has to be played for more than a few seconds.
start_joy_vibration ::
                      (Input :< cls, Object :< cls) =>
                      cls -> Int -> Float -> Float -> Maybe Float -> IO ()
start_joy_vibration cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantReal (0)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_start_joy_vibration (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "start_joy_vibration"
           '[Int, Float, Float, Maybe Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Input.start_joy_vibration

{-# NOINLINE bindInput_stop_joy_vibration #-}

-- | Stops the vibration of the joypad started with @method start_joy_vibration@.
bindInput_stop_joy_vibration :: MethodBind
bindInput_stop_joy_vibration
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "stop_joy_vibration" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops the vibration of the joypad started with @method start_joy_vibration@.
stop_joy_vibration ::
                     (Input :< cls, Object :< cls) => cls -> Int -> IO ()
stop_joy_vibration cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_stop_joy_vibration (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "stop_joy_vibration" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Input.stop_joy_vibration

{-# NOINLINE bindInput_vibrate_handheld #-}

-- | Vibrate the handheld device for the specified duration in milliseconds.
--   				__Note:__ This method is implemented on Android, iOS, and HTML5. It has no effect on other platforms.
--   				__Note:__ For Android, @method vibrate_handheld@ requires enabling the @VIBRATE@ permission in the export preset. Otherwise, @method vibrate_handheld@ will have no effect.
--   				__Note:__ For iOS, specifying the duration is only supported in iOS 13 and later.
--   				__Note:__ Some web browsers such as Safari and Firefox for Android do not support @method vibrate_handheld@.
bindInput_vibrate_handheld :: MethodBind
bindInput_vibrate_handheld
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "vibrate_handheld" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Vibrate the handheld device for the specified duration in milliseconds.
--   				__Note:__ This method is implemented on Android, iOS, and HTML5. It has no effect on other platforms.
--   				__Note:__ For Android, @method vibrate_handheld@ requires enabling the @VIBRATE@ permission in the export preset. Otherwise, @method vibrate_handheld@ will have no effect.
--   				__Note:__ For iOS, specifying the duration is only supported in iOS 13 and later.
--   				__Note:__ Some web browsers such as Safari and Firefox for Android do not support @method vibrate_handheld@.
vibrate_handheld ::
                   (Input :< cls, Object :< cls) => cls -> Maybe Int -> IO ()
vibrate_handheld cls arg1
  = withVariantArray [maybe (VariantInt (500)) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_vibrate_handheld (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "vibrate_handheld" '[Maybe Int] (IO ())
         where
        nodeMethod = Godot.Core.Input.vibrate_handheld

{-# NOINLINE bindInput_warp_mouse_position #-}

-- | Sets the mouse position to the specified vector, provided in pixels and relative to an origin at the upper left corner of the game window.
--   				Mouse position is clipped to the limits of the screen resolution, or to the limits of the game window if @enum MouseMode@ is set to @MOUSE_MODE_CONFINED@.
bindInput_warp_mouse_position :: MethodBind
bindInput_warp_mouse_position
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "warp_mouse_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the mouse position to the specified vector, provided in pixels and relative to an origin at the upper left corner of the game window.
--   				Mouse position is clipped to the limits of the screen resolution, or to the limits of the game window if @enum MouseMode@ is set to @MOUSE_MODE_CONFINED@.
warp_mouse_position ::
                      (Input :< cls, Object :< cls) => cls -> Vector2 -> IO ()
warp_mouse_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_warp_mouse_position (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Input "warp_mouse_position" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.Input.warp_mouse_position