{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Time
       (Godot.Core.Time._WEEKDAY_TUESDAY, Godot.Core.Time._WEEKDAY_MONDAY,
        Godot.Core.Time._WEEKDAY_SATURDAY, Godot.Core.Time._MONTH_MARCH,
        Godot.Core.Time._MONTH_NOVEMBER, Godot.Core.Time._MONTH_JULY,
        Godot.Core.Time._MONTH_DECEMBER, Godot.Core.Time._WEEKDAY_THURSDAY,
        Godot.Core.Time._MONTH_AUGUST, Godot.Core.Time._MONTH_APRIL,
        Godot.Core.Time._MONTH_MAY, Godot.Core.Time._WEEKDAY_WEDNESDAY,
        Godot.Core.Time._MONTH_JANUARY, Godot.Core.Time._MONTH_OCTOBER,
        Godot.Core.Time._MONTH_SEPTEMBER, Godot.Core.Time._WEEKDAY_SUNDAY,
        Godot.Core.Time._MONTH_FEBRUARY, Godot.Core.Time._MONTH_JUNE,
        Godot.Core.Time._WEEKDAY_FRIDAY,
        Godot.Core.Time.get_date_dict_from_system,
        Godot.Core.Time.get_date_dict_from_unix_time,
        Godot.Core.Time.get_date_string_from_system,
        Godot.Core.Time.get_date_string_from_unix_time,
        Godot.Core.Time.get_datetime_dict_from_datetime_string,
        Godot.Core.Time.get_datetime_dict_from_system,
        Godot.Core.Time.get_datetime_dict_from_unix_time,
        Godot.Core.Time.get_datetime_string_from_datetime_dict,
        Godot.Core.Time.get_datetime_string_from_system,
        Godot.Core.Time.get_datetime_string_from_unix_time,
        Godot.Core.Time.get_offset_string_from_offset_minutes,
        Godot.Core.Time.get_ticks_msec, Godot.Core.Time.get_ticks_usec,
        Godot.Core.Time.get_time_dict_from_system,
        Godot.Core.Time.get_time_dict_from_unix_time,
        Godot.Core.Time.get_time_string_from_system,
        Godot.Core.Time.get_time_string_from_unix_time,
        Godot.Core.Time.get_time_zone_from_system,
        Godot.Core.Time.get_unix_time_from_datetime_dict,
        Godot.Core.Time.get_unix_time_from_datetime_string,
        Godot.Core.Time.get_unix_time_from_system)
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

_WEEKDAY_TUESDAY :: Int
_WEEKDAY_TUESDAY = 2

_WEEKDAY_MONDAY :: Int
_WEEKDAY_MONDAY = 1

_WEEKDAY_SATURDAY :: Int
_WEEKDAY_SATURDAY = 6

_MONTH_MARCH :: Int
_MONTH_MARCH = 3

_MONTH_NOVEMBER :: Int
_MONTH_NOVEMBER = 11

_MONTH_JULY :: Int
_MONTH_JULY = 7

_MONTH_DECEMBER :: Int
_MONTH_DECEMBER = 12

_WEEKDAY_THURSDAY :: Int
_WEEKDAY_THURSDAY = 4

_MONTH_AUGUST :: Int
_MONTH_AUGUST = 8

_MONTH_APRIL :: Int
_MONTH_APRIL = 4

_MONTH_MAY :: Int
_MONTH_MAY = 5

_WEEKDAY_WEDNESDAY :: Int
_WEEKDAY_WEDNESDAY = 3

_MONTH_JANUARY :: Int
_MONTH_JANUARY = 1

_MONTH_OCTOBER :: Int
_MONTH_OCTOBER = 10

_MONTH_SEPTEMBER :: Int
_MONTH_SEPTEMBER = 9

_WEEKDAY_SUNDAY :: Int
_WEEKDAY_SUNDAY = 0

_MONTH_FEBRUARY :: Int
_MONTH_FEBRUARY = 2

_MONTH_JUNE :: Int
_MONTH_JUNE = 6

_WEEKDAY_FRIDAY :: Int
_WEEKDAY_FRIDAY = 5

{-# NOINLINE bindTime_get_date_dict_from_system #-}

-- | Returns the current date as a dictionary of keys: @year@, @month@, @day@, @weekday@, and @dst@ (Daylight Savings Time).
--   				The returned values are in the system's local time when @utc@ is false, otherwise they are in UTC.
bindTime_get_date_dict_from_system :: MethodBind
bindTime_get_date_dict_from_system
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_date_dict_from_system" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current date as a dictionary of keys: @year@, @month@, @day@, @weekday@, and @dst@ (Daylight Savings Time).
--   				The returned values are in the system's local time when @utc@ is false, otherwise they are in UTC.
get_date_dict_from_system ::
                            (Time :< cls, Object :< cls) => cls -> Maybe Bool -> IO Dictionary
get_date_dict_from_system cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_date_dict_from_system
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_date_dict_from_system" '[Maybe Bool]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.Time.get_date_dict_from_system

{-# NOINLINE bindTime_get_date_dict_from_unix_time #-}

-- | Converts the given Unix timestamp to a dictionary of keys: @year@, @month@, @day@, and @weekday@.
bindTime_get_date_dict_from_unix_time :: MethodBind
bindTime_get_date_dict_from_unix_time
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_date_dict_from_unix_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Converts the given Unix timestamp to a dictionary of keys: @year@, @month@, @day@, and @weekday@.
get_date_dict_from_unix_time ::
                               (Time :< cls, Object :< cls) => cls -> Int -> IO Dictionary
get_date_dict_from_unix_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_date_dict_from_unix_time
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_date_dict_from_unix_time" '[Int]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.Time.get_date_dict_from_unix_time

{-# NOINLINE bindTime_get_date_string_from_system #-}

-- | Returns the current date as an ISO 8601 date string (YYYY-MM-DD).
--   				The returned values are in the system's local time when @utc@ is false, otherwise they are in UTC.
bindTime_get_date_string_from_system :: MethodBind
bindTime_get_date_string_from_system
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_date_string_from_system" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current date as an ISO 8601 date string (YYYY-MM-DD).
--   				The returned values are in the system's local time when @utc@ is false, otherwise they are in UTC.
get_date_string_from_system ::
                              (Time :< cls, Object :< cls) => cls -> Maybe Bool -> IO GodotString
get_date_string_from_system cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_date_string_from_system
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_date_string_from_system"
           '[Maybe Bool]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Time.get_date_string_from_system

{-# NOINLINE bindTime_get_date_string_from_unix_time #-}

-- | Converts the given Unix timestamp to an ISO 8601 date string (YYYY-MM-DD).
bindTime_get_date_string_from_unix_time :: MethodBind
bindTime_get_date_string_from_unix_time
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_date_string_from_unix_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Converts the given Unix timestamp to an ISO 8601 date string (YYYY-MM-DD).
get_date_string_from_unix_time ::
                                 (Time :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_date_string_from_unix_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_date_string_from_unix_time
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_date_string_from_unix_time" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Time.get_date_string_from_unix_time

{-# NOINLINE bindTime_get_datetime_dict_from_datetime_string #-}

-- | Converts the given ISO 8601 date and time string (YYYY-MM-DDTHH:MM:SS) to a dictionary of keys: @year@, @month@, @day@, @weekday@, @hour@, @minute@, and @second@.
--   				If @weekday@ is false, then the @weekday@ entry is excluded (the calculation is relatively expensive).
--   				__Note:__ Any decimal fraction in the time string will be ignored silently.
bindTime_get_datetime_dict_from_datetime_string :: MethodBind
bindTime_get_datetime_dict_from_datetime_string
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_datetime_dict_from_datetime_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Converts the given ISO 8601 date and time string (YYYY-MM-DDTHH:MM:SS) to a dictionary of keys: @year@, @month@, @day@, @weekday@, @hour@, @minute@, and @second@.
--   				If @weekday@ is false, then the @weekday@ entry is excluded (the calculation is relatively expensive).
--   				__Note:__ Any decimal fraction in the time string will be ignored silently.
get_datetime_dict_from_datetime_string ::
                                         (Time :< cls, Object :< cls) =>
                                         cls -> GodotString -> Bool -> IO Dictionary
get_datetime_dict_from_datetime_string cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindTime_get_datetime_dict_from_datetime_string
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_datetime_dict_from_datetime_string"
           '[GodotString, Bool]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.Time.get_datetime_dict_from_datetime_string

{-# NOINLINE bindTime_get_datetime_dict_from_system #-}

-- | Returns the current date as a dictionary of keys: @year@, @month@, @day@, @weekday@, @hour@, @minute@, and @second@.
bindTime_get_datetime_dict_from_system :: MethodBind
bindTime_get_datetime_dict_from_system
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_datetime_dict_from_system" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current date as a dictionary of keys: @year@, @month@, @day@, @weekday@, @hour@, @minute@, and @second@.
get_datetime_dict_from_system ::
                                (Time :< cls, Object :< cls) => cls -> Maybe Bool -> IO Dictionary
get_datetime_dict_from_system cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_datetime_dict_from_system
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_datetime_dict_from_system"
           '[Maybe Bool]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.Time.get_datetime_dict_from_system

{-# NOINLINE bindTime_get_datetime_dict_from_unix_time #-}

-- | Converts the given Unix timestamp to a dictionary of keys: @year@, @month@, @day@, and @weekday@.
--   				The returned Dictionary's values will be the same as the @method get_datetime_dict_from_system@ if the Unix timestamp is the current time, with the exception of Daylight Savings Time as it cannot be determined from the epoch.
bindTime_get_datetime_dict_from_unix_time :: MethodBind
bindTime_get_datetime_dict_from_unix_time
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_datetime_dict_from_unix_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Converts the given Unix timestamp to a dictionary of keys: @year@, @month@, @day@, and @weekday@.
--   				The returned Dictionary's values will be the same as the @method get_datetime_dict_from_system@ if the Unix timestamp is the current time, with the exception of Daylight Savings Time as it cannot be determined from the epoch.
get_datetime_dict_from_unix_time ::
                                   (Time :< cls, Object :< cls) => cls -> Int -> IO Dictionary
get_datetime_dict_from_unix_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_datetime_dict_from_unix_time
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_datetime_dict_from_unix_time" '[Int]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.Time.get_datetime_dict_from_unix_time

{-# NOINLINE bindTime_get_datetime_string_from_datetime_dict #-}

-- | Converts the given dictionary of keys to an ISO 8601 date and time string (YYYY-MM-DDTHH:MM:SS).
--   				The given dictionary can be populated with the following keys: @year@, @month@, @day@, @hour@, @minute@, and @second@. Any other entries (including @dst@) are ignored.
--   				If the dictionary is empty, @0@ is returned. If some keys are omitted, they default to the equivalent values for the Unix epoch timestamp 0 (1970-01-01 at 00:00:00).
--   				If @use_space@ is true, use a space instead of the letter T in the middle.
bindTime_get_datetime_string_from_datetime_dict :: MethodBind
bindTime_get_datetime_string_from_datetime_dict
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_datetime_string_from_datetime_dict" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Converts the given dictionary of keys to an ISO 8601 date and time string (YYYY-MM-DDTHH:MM:SS).
--   				The given dictionary can be populated with the following keys: @year@, @month@, @day@, @hour@, @minute@, and @second@. Any other entries (including @dst@) are ignored.
--   				If the dictionary is empty, @0@ is returned. If some keys are omitted, they default to the equivalent values for the Unix epoch timestamp 0 (1970-01-01 at 00:00:00).
--   				If @use_space@ is true, use a space instead of the letter T in the middle.
get_datetime_string_from_datetime_dict ::
                                         (Time :< cls, Object :< cls) =>
                                         cls -> Dictionary -> Bool -> IO GodotString
get_datetime_string_from_datetime_dict cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindTime_get_datetime_string_from_datetime_dict
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_datetime_string_from_datetime_dict"
           '[Dictionary, Bool]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Time.get_datetime_string_from_datetime_dict

{-# NOINLINE bindTime_get_datetime_string_from_system #-}

-- | Returns the current date and time as an ISO 8601 date and time string (YYYY-MM-DDTHH:MM:SS).
--   				The returned values are in the system's local time when @utc@ is false, otherwise they are in UTC.
--   				If @use_space@ is true, use a space instead of the letter T in the middle.
bindTime_get_datetime_string_from_system :: MethodBind
bindTime_get_datetime_string_from_system
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_datetime_string_from_system" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current date and time as an ISO 8601 date and time string (YYYY-MM-DDTHH:MM:SS).
--   				The returned values are in the system's local time when @utc@ is false, otherwise they are in UTC.
--   				If @use_space@ is true, use a space instead of the letter T in the middle.
get_datetime_string_from_system ::
                                  (Time :< cls, Object :< cls) =>
                                  cls -> Maybe Bool -> Maybe Bool -> IO GodotString
get_datetime_string_from_system cls arg1 arg2
  = withVariantArray
      [maybe (VariantBool False) toVariant arg1,
       maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_datetime_string_from_system
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_datetime_string_from_system"
           '[Maybe Bool, Maybe Bool]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Time.get_datetime_string_from_system

{-# NOINLINE bindTime_get_datetime_string_from_unix_time #-}

-- | Converts the given Unix timestamp to an ISO 8601 date and time string (YYYY-MM-DDTHH:MM:SS).
--   				If @use_space@ is true, use a space instead of the letter T in the middle.
bindTime_get_datetime_string_from_unix_time :: MethodBind
bindTime_get_datetime_string_from_unix_time
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_datetime_string_from_unix_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Converts the given Unix timestamp to an ISO 8601 date and time string (YYYY-MM-DDTHH:MM:SS).
--   				If @use_space@ is true, use a space instead of the letter T in the middle.
get_datetime_string_from_unix_time ::
                                     (Time :< cls, Object :< cls) =>
                                     cls -> Int -> Maybe Bool -> IO GodotString
get_datetime_string_from_unix_time cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_datetime_string_from_unix_time
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_datetime_string_from_unix_time"
           '[Int, Maybe Bool]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Time.get_datetime_string_from_unix_time

{-# NOINLINE bindTime_get_offset_string_from_offset_minutes #-}

-- | Converts the given timezone offset in minutes to a timezone offset string. For example, -480 returns "-08:00", 345 returns "+05:45", and 0 returns "+00:00".
bindTime_get_offset_string_from_offset_minutes :: MethodBind
bindTime_get_offset_string_from_offset_minutes
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_offset_string_from_offset_minutes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Converts the given timezone offset in minutes to a timezone offset string. For example, -480 returns "-08:00", 345 returns "+05:45", and 0 returns "+00:00".
get_offset_string_from_offset_minutes ::
                                        (Time :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_offset_string_from_offset_minutes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindTime_get_offset_string_from_offset_minutes
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_offset_string_from_offset_minutes"
           '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Time.get_offset_string_from_offset_minutes

{-# NOINLINE bindTime_get_ticks_msec #-}

-- | Returns the amount of time passed in milliseconds since the engine started.
--   				Will always be positive or 0 and uses a 64-bit value (it will wrap after roughly 500 million years).
bindTime_get_ticks_msec :: MethodBind
bindTime_get_ticks_msec
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_ticks_msec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of time passed in milliseconds since the engine started.
--   				Will always be positive or 0 and uses a 64-bit value (it will wrap after roughly 500 million years).
get_ticks_msec :: (Time :< cls, Object :< cls) => cls -> IO Int
get_ticks_msec cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_ticks_msec (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_ticks_msec" '[] (IO Int) where
        nodeMethod = Godot.Core.Time.get_ticks_msec

{-# NOINLINE bindTime_get_ticks_usec #-}

-- | Returns the amount of time passed in microseconds since the engine started.
--   				Will always be positive or 0 and uses a 64-bit value (it will wrap after roughly half a million years).
bindTime_get_ticks_usec :: MethodBind
bindTime_get_ticks_usec
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_ticks_usec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of time passed in microseconds since the engine started.
--   				Will always be positive or 0 and uses a 64-bit value (it will wrap after roughly half a million years).
get_ticks_usec :: (Time :< cls, Object :< cls) => cls -> IO Int
get_ticks_usec cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_ticks_usec (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_ticks_usec" '[] (IO Int) where
        nodeMethod = Godot.Core.Time.get_ticks_usec

{-# NOINLINE bindTime_get_time_dict_from_system #-}

-- | Returns the current time as a dictionary of keys: @hour@, @minute@, and @second@.
--   				The returned values are in the system's local time when @utc@ is false, otherwise they are in UTC.
bindTime_get_time_dict_from_system :: MethodBind
bindTime_get_time_dict_from_system
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_time_dict_from_system" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current time as a dictionary of keys: @hour@, @minute@, and @second@.
--   				The returned values are in the system's local time when @utc@ is false, otherwise they are in UTC.
get_time_dict_from_system ::
                            (Time :< cls, Object :< cls) => cls -> Maybe Bool -> IO Dictionary
get_time_dict_from_system cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_time_dict_from_system
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_time_dict_from_system" '[Maybe Bool]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.Time.get_time_dict_from_system

{-# NOINLINE bindTime_get_time_dict_from_unix_time #-}

-- | Converts the given time to a dictionary of keys: @hour@, @minute@, and @second@.
bindTime_get_time_dict_from_unix_time :: MethodBind
bindTime_get_time_dict_from_unix_time
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_time_dict_from_unix_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Converts the given time to a dictionary of keys: @hour@, @minute@, and @second@.
get_time_dict_from_unix_time ::
                               (Time :< cls, Object :< cls) => cls -> Int -> IO Dictionary
get_time_dict_from_unix_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_time_dict_from_unix_time
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_time_dict_from_unix_time" '[Int]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.Time.get_time_dict_from_unix_time

{-# NOINLINE bindTime_get_time_string_from_system #-}

-- | Returns the current time as an ISO 8601 time string (HH:MM:SS).
--   				The returned values are in the system's local time when @utc@ is false, otherwise they are in UTC.
bindTime_get_time_string_from_system :: MethodBind
bindTime_get_time_string_from_system
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_time_string_from_system" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current time as an ISO 8601 time string (HH:MM:SS).
--   				The returned values are in the system's local time when @utc@ is false, otherwise they are in UTC.
get_time_string_from_system ::
                              (Time :< cls, Object :< cls) => cls -> Maybe Bool -> IO GodotString
get_time_string_from_system cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_time_string_from_system
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_time_string_from_system"
           '[Maybe Bool]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Time.get_time_string_from_system

{-# NOINLINE bindTime_get_time_string_from_unix_time #-}

-- | Converts the given Unix timestamp to an ISO 8601 time string (HH:MM:SS).
bindTime_get_time_string_from_unix_time :: MethodBind
bindTime_get_time_string_from_unix_time
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_time_string_from_unix_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Converts the given Unix timestamp to an ISO 8601 time string (HH:MM:SS).
get_time_string_from_unix_time ::
                                 (Time :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_time_string_from_unix_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_time_string_from_unix_time
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_time_string_from_unix_time" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Time.get_time_string_from_unix_time

{-# NOINLINE bindTime_get_time_zone_from_system #-}

-- | Returns the current time zone as a dictionary of keys: @bias@ and @name@. The @bias@ value is the offset from UTC in minutes, since not all time zones are multiples of an hour from UTC.
bindTime_get_time_zone_from_system :: MethodBind
bindTime_get_time_zone_from_system
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_time_zone_from_system" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current time zone as a dictionary of keys: @bias@ and @name@. The @bias@ value is the offset from UTC in minutes, since not all time zones are multiples of an hour from UTC.
get_time_zone_from_system ::
                            (Time :< cls, Object :< cls) => cls -> IO Dictionary
get_time_zone_from_system cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_time_zone_from_system
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_time_zone_from_system" '[]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.Time.get_time_zone_from_system

{-# NOINLINE bindTime_get_unix_time_from_datetime_dict #-}

-- | Converts a dictionary of time values to a Unix timestamp.
--   				The given dictionary can be populated with the following keys: @year@, @month@, @day@, @hour@, @minute@, and @second@. Any other entries (including @dst@) are ignored.
--   				If the dictionary is empty, @0@ is returned. If some keys are omitted, they default to the equivalent values for the Unix epoch timestamp 0 (1970-01-01 at 00:00:00).
--   				You can pass the output from @method get_datetime_dict_from_unix_time@ directly into this function and get the same as what was put in.
--   				__Note:__ Unix timestamps are often in UTC. This method does not do any timezone conversion, so the timestamp will be in the same timezone as the given datetime dictionary.
bindTime_get_unix_time_from_datetime_dict :: MethodBind
bindTime_get_unix_time_from_datetime_dict
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_unix_time_from_datetime_dict" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Converts a dictionary of time values to a Unix timestamp.
--   				The given dictionary can be populated with the following keys: @year@, @month@, @day@, @hour@, @minute@, and @second@. Any other entries (including @dst@) are ignored.
--   				If the dictionary is empty, @0@ is returned. If some keys are omitted, they default to the equivalent values for the Unix epoch timestamp 0 (1970-01-01 at 00:00:00).
--   				You can pass the output from @method get_datetime_dict_from_unix_time@ directly into this function and get the same as what was put in.
--   				__Note:__ Unix timestamps are often in UTC. This method does not do any timezone conversion, so the timestamp will be in the same timezone as the given datetime dictionary.
get_unix_time_from_datetime_dict ::
                                   (Time :< cls, Object :< cls) => cls -> Dictionary -> IO Int
get_unix_time_from_datetime_dict cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_unix_time_from_datetime_dict
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_unix_time_from_datetime_dict"
           '[Dictionary]
           (IO Int)
         where
        nodeMethod = Godot.Core.Time.get_unix_time_from_datetime_dict

{-# NOINLINE bindTime_get_unix_time_from_datetime_string #-}

-- | Converts the given ISO 8601 date and/or time string to a Unix timestamp. The string can contain a date only, a time only, or both.
--   				__Note:__ Unix timestamps are often in UTC. This method does not do any timezone conversion, so the timestamp will be in the same timezone as the given datetime string.
--   				__Note:__ Any decimal fraction in the time string will be ignored silently.
bindTime_get_unix_time_from_datetime_string :: MethodBind
bindTime_get_unix_time_from_datetime_string
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_unix_time_from_datetime_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Converts the given ISO 8601 date and/or time string to a Unix timestamp. The string can contain a date only, a time only, or both.
--   				__Note:__ Unix timestamps are often in UTC. This method does not do any timezone conversion, so the timestamp will be in the same timezone as the given datetime string.
--   				__Note:__ Any decimal fraction in the time string will be ignored silently.
get_unix_time_from_datetime_string ::
                                     (Time :< cls, Object :< cls) => cls -> GodotString -> IO Int
get_unix_time_from_datetime_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_unix_time_from_datetime_string
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_unix_time_from_datetime_string"
           '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.Time.get_unix_time_from_datetime_string

{-# NOINLINE bindTime_get_unix_time_from_system #-}

-- | Returns the current Unix timestamp in seconds based on the system time in UTC. This method is implemented by the operating system and always returns the time in UTC.
--   				__Note:__ Unlike other methods that use integer timestamps, this method returns the timestamp as a @float@ for sub-second precision.
bindTime_get_unix_time_from_system :: MethodBind
bindTime_get_unix_time_from_system
  = unsafePerformIO $
      withCString "Time" $
        \ clsNamePtr ->
          withCString "get_unix_time_from_system" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current Unix timestamp in seconds based on the system time in UTC. This method is implemented by the operating system and always returns the time in UTC.
--   				__Note:__ Unlike other methods that use integer timestamps, this method returns the timestamp as a @float@ for sub-second precision.
get_unix_time_from_system ::
                            (Time :< cls, Object :< cls) => cls -> IO Float
get_unix_time_from_system cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTime_get_unix_time_from_system
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Time "get_unix_time_from_system" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Time.get_unix_time_from_system