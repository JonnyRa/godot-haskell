{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InputEventMIDI
       (Godot.Core.InputEventMIDI.get_channel,
        Godot.Core.InputEventMIDI.get_controller_number,
        Godot.Core.InputEventMIDI.get_controller_value,
        Godot.Core.InputEventMIDI.get_instrument,
        Godot.Core.InputEventMIDI.get_message,
        Godot.Core.InputEventMIDI.get_pitch,
        Godot.Core.InputEventMIDI.get_pressure,
        Godot.Core.InputEventMIDI.get_velocity,
        Godot.Core.InputEventMIDI.set_channel,
        Godot.Core.InputEventMIDI.set_controller_number,
        Godot.Core.InputEventMIDI.set_controller_value,
        Godot.Core.InputEventMIDI.set_instrument,
        Godot.Core.InputEventMIDI.set_message,
        Godot.Core.InputEventMIDI.set_pitch,
        Godot.Core.InputEventMIDI.set_pressure,
        Godot.Core.InputEventMIDI.set_velocity)
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
import Godot.Core.InputEvent()

instance NodeProperty InputEventMIDI "channel" Int 'False where
        nodeProperty
          = (get_channel, wrapDroppingSetter set_channel, Nothing)

instance NodeProperty InputEventMIDI "controller_number" Int 'False
         where
        nodeProperty
          = (get_controller_number, wrapDroppingSetter set_controller_number,
             Nothing)

instance NodeProperty InputEventMIDI "controller_value" Int 'False
         where
        nodeProperty
          = (get_controller_value, wrapDroppingSetter set_controller_value,
             Nothing)

instance NodeProperty InputEventMIDI "instrument" Int 'False where
        nodeProperty
          = (get_instrument, wrapDroppingSetter set_instrument, Nothing)

instance NodeProperty InputEventMIDI "message" Int 'False where
        nodeProperty
          = (get_message, wrapDroppingSetter set_message, Nothing)

instance NodeProperty InputEventMIDI "pitch" Int 'False where
        nodeProperty = (get_pitch, wrapDroppingSetter set_pitch, Nothing)

instance NodeProperty InputEventMIDI "pressure" Int 'False where
        nodeProperty
          = (get_pressure, wrapDroppingSetter set_pressure, Nothing)

instance NodeProperty InputEventMIDI "velocity" Int 'False where
        nodeProperty
          = (get_velocity, wrapDroppingSetter set_velocity, Nothing)

{-# NOINLINE bindInputEventMIDI_get_channel #-}

-- | The MIDI channel of this input event. There are 16 channels, so this value ranges from 0 to 15. MIDI channel 9 is reserved for the use with percussion instruments, the rest of the channels are for non-percussion instruments.
bindInputEventMIDI_get_channel :: MethodBind
bindInputEventMIDI_get_channel
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "get_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The MIDI channel of this input event. There are 16 channels, so this value ranges from 0 to 15. MIDI channel 9 is reserved for the use with percussion instruments, the rest of the channels are for non-percussion instruments.
get_channel ::
              (InputEventMIDI :< cls, Object :< cls) => cls -> IO Int
get_channel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_get_channel (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod InputEventMIDI "get_channel" '[] (IO Int) where
        nodeMethod = Godot.Core.InputEventMIDI.get_channel

{-# NOINLINE bindInputEventMIDI_get_controller_number #-}

-- | If the message is @MIDI_MESSAGE_CONTROL_CHANGE@, this indicates the controller number, otherwise this is zero. Controllers include devices such as pedals and levers.
bindInputEventMIDI_get_controller_number :: MethodBind
bindInputEventMIDI_get_controller_number
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "get_controller_number" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If the message is @MIDI_MESSAGE_CONTROL_CHANGE@, this indicates the controller number, otherwise this is zero. Controllers include devices such as pedals and levers.
get_controller_number ::
                        (InputEventMIDI :< cls, Object :< cls) => cls -> IO Int
get_controller_number cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_get_controller_number
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod InputEventMIDI "get_controller_number" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.InputEventMIDI.get_controller_number

{-# NOINLINE bindInputEventMIDI_get_controller_value #-}

-- | If the message is @MIDI_MESSAGE_CONTROL_CHANGE@, this indicates the controller value, otherwise this is zero. Controllers include devices such as pedals and levers.
bindInputEventMIDI_get_controller_value :: MethodBind
bindInputEventMIDI_get_controller_value
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "get_controller_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If the message is @MIDI_MESSAGE_CONTROL_CHANGE@, this indicates the controller value, otherwise this is zero. Controllers include devices such as pedals and levers.
get_controller_value ::
                       (InputEventMIDI :< cls, Object :< cls) => cls -> IO Int
get_controller_value cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_get_controller_value
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod InputEventMIDI "get_controller_value" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.InputEventMIDI.get_controller_value

{-# NOINLINE bindInputEventMIDI_get_instrument #-}

-- | The instrument of this input event. This value ranges from 0 to 127. Refer to the instrument list on the General MIDI wikipedia article to see a list of instruments, except that this value is 0-index, so subtract one from every number on that chart. A standard piano will have an instrument number of 0.
bindInputEventMIDI_get_instrument :: MethodBind
bindInputEventMIDI_get_instrument
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "get_instrument" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The instrument of this input event. This value ranges from 0 to 127. Refer to the instrument list on the General MIDI wikipedia article to see a list of instruments, except that this value is 0-index, so subtract one from every number on that chart. A standard piano will have an instrument number of 0.
get_instrument ::
                 (InputEventMIDI :< cls, Object :< cls) => cls -> IO Int
get_instrument cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_get_instrument
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod InputEventMIDI "get_instrument" '[] (IO Int)
         where
        nodeMethod = Godot.Core.InputEventMIDI.get_instrument

{-# NOINLINE bindInputEventMIDI_get_message #-}

-- | Returns a value indicating the type of message for this MIDI signal. This is a member of the @enum @GlobalScope.MidiMessageList@ enum.
--   			For MIDI messages between 0x80 and 0xEF, only the left half of the bits are returned as this value, as the other part is the channel (ex: 0x94 becomes 0x9). For MIDI messages from 0xF0 to 0xFF, the value is returned as-is.
--   			Notes will return @MIDI_MESSAGE_NOTE_ON@ when activated, but they might not always return @MIDI_MESSAGE_NOTE_OFF@ when deactivated, therefore your code should treat the input as stopped if some period of time has passed.
--   			For more information, see the MIDI message status byte list chart linked above.
bindInputEventMIDI_get_message :: MethodBind
bindInputEventMIDI_get_message
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "get_message" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a value indicating the type of message for this MIDI signal. This is a member of the @enum @GlobalScope.MidiMessageList@ enum.
--   			For MIDI messages between 0x80 and 0xEF, only the left half of the bits are returned as this value, as the other part is the channel (ex: 0x94 becomes 0x9). For MIDI messages from 0xF0 to 0xFF, the value is returned as-is.
--   			Notes will return @MIDI_MESSAGE_NOTE_ON@ when activated, but they might not always return @MIDI_MESSAGE_NOTE_OFF@ when deactivated, therefore your code should treat the input as stopped if some period of time has passed.
--   			For more information, see the MIDI message status byte list chart linked above.
get_message ::
              (InputEventMIDI :< cls, Object :< cls) => cls -> IO Int
get_message cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_get_message (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod InputEventMIDI "get_message" '[] (IO Int) where
        nodeMethod = Godot.Core.InputEventMIDI.get_message

{-# NOINLINE bindInputEventMIDI_get_pitch #-}

-- | The pitch index number of this MIDI signal. This value ranges from 0 to 127. On a piano, middle C is 60, and A440 is 69, see the "MIDI note" column of the piano key frequency chart on Wikipedia for more information.
bindInputEventMIDI_get_pitch :: MethodBind
bindInputEventMIDI_get_pitch
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "get_pitch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The pitch index number of this MIDI signal. This value ranges from 0 to 127. On a piano, middle C is 60, and A440 is 69, see the "MIDI note" column of the piano key frequency chart on Wikipedia for more information.
get_pitch ::
            (InputEventMIDI :< cls, Object :< cls) => cls -> IO Int
get_pitch cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_get_pitch (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod InputEventMIDI "get_pitch" '[] (IO Int) where
        nodeMethod = Godot.Core.InputEventMIDI.get_pitch

{-# NOINLINE bindInputEventMIDI_get_pressure #-}

-- | The pressure of the MIDI signal. This value ranges from 0 to 127. For many devices, this value is always zero.
bindInputEventMIDI_get_pressure :: MethodBind
bindInputEventMIDI_get_pressure
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "get_pressure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The pressure of the MIDI signal. This value ranges from 0 to 127. For many devices, this value is always zero.
get_pressure ::
               (InputEventMIDI :< cls, Object :< cls) => cls -> IO Int
get_pressure cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_get_pressure (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod InputEventMIDI "get_pressure" '[] (IO Int)
         where
        nodeMethod = Godot.Core.InputEventMIDI.get_pressure

{-# NOINLINE bindInputEventMIDI_get_velocity #-}

-- | The velocity of the MIDI signal. This value ranges from 0 to 127. For a piano, this corresponds to how quickly the key was pressed, and is rarely above about 110 in practice. Note that some MIDI devices may send a @MIDI_MESSAGE_NOTE_ON@ message with zero velocity and expect this to be treated the same as a @MIDI_MESSAGE_NOTE_OFF@ message, but device implementations vary so Godot reports event data exactly as received.
bindInputEventMIDI_get_velocity :: MethodBind
bindInputEventMIDI_get_velocity
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "get_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The velocity of the MIDI signal. This value ranges from 0 to 127. For a piano, this corresponds to how quickly the key was pressed, and is rarely above about 110 in practice. Note that some MIDI devices may send a @MIDI_MESSAGE_NOTE_ON@ message with zero velocity and expect this to be treated the same as a @MIDI_MESSAGE_NOTE_OFF@ message, but device implementations vary so Godot reports event data exactly as received.
get_velocity ::
               (InputEventMIDI :< cls, Object :< cls) => cls -> IO Int
get_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_get_velocity (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod InputEventMIDI "get_velocity" '[] (IO Int)
         where
        nodeMethod = Godot.Core.InputEventMIDI.get_velocity

{-# NOINLINE bindInputEventMIDI_set_channel #-}

-- | The MIDI channel of this input event. There are 16 channels, so this value ranges from 0 to 15. MIDI channel 9 is reserved for the use with percussion instruments, the rest of the channels are for non-percussion instruments.
bindInputEventMIDI_set_channel :: MethodBind
bindInputEventMIDI_set_channel
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "set_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The MIDI channel of this input event. There are 16 channels, so this value ranges from 0 to 15. MIDI channel 9 is reserved for the use with percussion instruments, the rest of the channels are for non-percussion instruments.
set_channel ::
              (InputEventMIDI :< cls, Object :< cls) => cls -> Int -> IO ()
set_channel cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_set_channel (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod InputEventMIDI "set_channel" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.InputEventMIDI.set_channel

{-# NOINLINE bindInputEventMIDI_set_controller_number #-}

-- | If the message is @MIDI_MESSAGE_CONTROL_CHANGE@, this indicates the controller number, otherwise this is zero. Controllers include devices such as pedals and levers.
bindInputEventMIDI_set_controller_number :: MethodBind
bindInputEventMIDI_set_controller_number
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "set_controller_number" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If the message is @MIDI_MESSAGE_CONTROL_CHANGE@, this indicates the controller number, otherwise this is zero. Controllers include devices such as pedals and levers.
set_controller_number ::
                        (InputEventMIDI :< cls, Object :< cls) => cls -> Int -> IO ()
set_controller_number cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_set_controller_number
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod InputEventMIDI "set_controller_number" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventMIDI.set_controller_number

{-# NOINLINE bindInputEventMIDI_set_controller_value #-}

-- | If the message is @MIDI_MESSAGE_CONTROL_CHANGE@, this indicates the controller value, otherwise this is zero. Controllers include devices such as pedals and levers.
bindInputEventMIDI_set_controller_value :: MethodBind
bindInputEventMIDI_set_controller_value
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "set_controller_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If the message is @MIDI_MESSAGE_CONTROL_CHANGE@, this indicates the controller value, otherwise this is zero. Controllers include devices such as pedals and levers.
set_controller_value ::
                       (InputEventMIDI :< cls, Object :< cls) => cls -> Int -> IO ()
set_controller_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_set_controller_value
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod InputEventMIDI "set_controller_value" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventMIDI.set_controller_value

{-# NOINLINE bindInputEventMIDI_set_instrument #-}

-- | The instrument of this input event. This value ranges from 0 to 127. Refer to the instrument list on the General MIDI wikipedia article to see a list of instruments, except that this value is 0-index, so subtract one from every number on that chart. A standard piano will have an instrument number of 0.
bindInputEventMIDI_set_instrument :: MethodBind
bindInputEventMIDI_set_instrument
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "set_instrument" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The instrument of this input event. This value ranges from 0 to 127. Refer to the instrument list on the General MIDI wikipedia article to see a list of instruments, except that this value is 0-index, so subtract one from every number on that chart. A standard piano will have an instrument number of 0.
set_instrument ::
                 (InputEventMIDI :< cls, Object :< cls) => cls -> Int -> IO ()
set_instrument cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_set_instrument
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod InputEventMIDI "set_instrument" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.InputEventMIDI.set_instrument

{-# NOINLINE bindInputEventMIDI_set_message #-}

-- | Returns a value indicating the type of message for this MIDI signal. This is a member of the @enum @GlobalScope.MidiMessageList@ enum.
--   			For MIDI messages between 0x80 and 0xEF, only the left half of the bits are returned as this value, as the other part is the channel (ex: 0x94 becomes 0x9). For MIDI messages from 0xF0 to 0xFF, the value is returned as-is.
--   			Notes will return @MIDI_MESSAGE_NOTE_ON@ when activated, but they might not always return @MIDI_MESSAGE_NOTE_OFF@ when deactivated, therefore your code should treat the input as stopped if some period of time has passed.
--   			For more information, see the MIDI message status byte list chart linked above.
bindInputEventMIDI_set_message :: MethodBind
bindInputEventMIDI_set_message
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "set_message" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a value indicating the type of message for this MIDI signal. This is a member of the @enum @GlobalScope.MidiMessageList@ enum.
--   			For MIDI messages between 0x80 and 0xEF, only the left half of the bits are returned as this value, as the other part is the channel (ex: 0x94 becomes 0x9). For MIDI messages from 0xF0 to 0xFF, the value is returned as-is.
--   			Notes will return @MIDI_MESSAGE_NOTE_ON@ when activated, but they might not always return @MIDI_MESSAGE_NOTE_OFF@ when deactivated, therefore your code should treat the input as stopped if some period of time has passed.
--   			For more information, see the MIDI message status byte list chart linked above.
set_message ::
              (InputEventMIDI :< cls, Object :< cls) => cls -> Int -> IO ()
set_message cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_set_message (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod InputEventMIDI "set_message" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.InputEventMIDI.set_message

{-# NOINLINE bindInputEventMIDI_set_pitch #-}

-- | The pitch index number of this MIDI signal. This value ranges from 0 to 127. On a piano, middle C is 60, and A440 is 69, see the "MIDI note" column of the piano key frequency chart on Wikipedia for more information.
bindInputEventMIDI_set_pitch :: MethodBind
bindInputEventMIDI_set_pitch
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "set_pitch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The pitch index number of this MIDI signal. This value ranges from 0 to 127. On a piano, middle C is 60, and A440 is 69, see the "MIDI note" column of the piano key frequency chart on Wikipedia for more information.
set_pitch ::
            (InputEventMIDI :< cls, Object :< cls) => cls -> Int -> IO ()
set_pitch cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_set_pitch (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod InputEventMIDI "set_pitch" '[Int] (IO ()) where
        nodeMethod = Godot.Core.InputEventMIDI.set_pitch

{-# NOINLINE bindInputEventMIDI_set_pressure #-}

-- | The pressure of the MIDI signal. This value ranges from 0 to 127. For many devices, this value is always zero.
bindInputEventMIDI_set_pressure :: MethodBind
bindInputEventMIDI_set_pressure
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "set_pressure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The pressure of the MIDI signal. This value ranges from 0 to 127. For many devices, this value is always zero.
set_pressure ::
               (InputEventMIDI :< cls, Object :< cls) => cls -> Int -> IO ()
set_pressure cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_set_pressure (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod InputEventMIDI "set_pressure" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.InputEventMIDI.set_pressure

{-# NOINLINE bindInputEventMIDI_set_velocity #-}

-- | The velocity of the MIDI signal. This value ranges from 0 to 127. For a piano, this corresponds to how quickly the key was pressed, and is rarely above about 110 in practice. Note that some MIDI devices may send a @MIDI_MESSAGE_NOTE_ON@ message with zero velocity and expect this to be treated the same as a @MIDI_MESSAGE_NOTE_OFF@ message, but device implementations vary so Godot reports event data exactly as received.
bindInputEventMIDI_set_velocity :: MethodBind
bindInputEventMIDI_set_velocity
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "set_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The velocity of the MIDI signal. This value ranges from 0 to 127. For a piano, this corresponds to how quickly the key was pressed, and is rarely above about 110 in practice. Note that some MIDI devices may send a @MIDI_MESSAGE_NOTE_ON@ message with zero velocity and expect this to be treated the same as a @MIDI_MESSAGE_NOTE_OFF@ message, but device implementations vary so Godot reports event data exactly as received.
set_velocity ::
               (InputEventMIDI :< cls, Object :< cls) => cls -> Int -> IO ()
set_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_set_velocity (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod InputEventMIDI "set_velocity" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.InputEventMIDI.set_velocity