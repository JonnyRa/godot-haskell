{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeScalarUniform
       (Godot.Core.VisualShaderNodeScalarUniform._HINT_MAX,
        Godot.Core.VisualShaderNodeScalarUniform._HINT_RANGE,
        Godot.Core.VisualShaderNodeScalarUniform._HINT_RANGE_STEP,
        Godot.Core.VisualShaderNodeScalarUniform._HINT_NONE,
        Godot.Core.VisualShaderNodeScalarUniform.get_default_value,
        Godot.Core.VisualShaderNodeScalarUniform.get_hint,
        Godot.Core.VisualShaderNodeScalarUniform.get_max,
        Godot.Core.VisualShaderNodeScalarUniform.get_min,
        Godot.Core.VisualShaderNodeScalarUniform.get_step,
        Godot.Core.VisualShaderNodeScalarUniform.is_default_value_enabled,
        Godot.Core.VisualShaderNodeScalarUniform.set_default_value,
        Godot.Core.VisualShaderNodeScalarUniform.set_default_value_enabled,
        Godot.Core.VisualShaderNodeScalarUniform.set_hint,
        Godot.Core.VisualShaderNodeScalarUniform.set_max,
        Godot.Core.VisualShaderNodeScalarUniform.set_min,
        Godot.Core.VisualShaderNodeScalarUniform.set_step)
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
import Godot.Core.VisualShaderNodeUniform()

_HINT_MAX :: Int
_HINT_MAX = 3

_HINT_RANGE :: Int
_HINT_RANGE = 1

_HINT_RANGE_STEP :: Int
_HINT_RANGE_STEP = 2

_HINT_NONE :: Int
_HINT_NONE = 0

instance NodeProperty VisualShaderNodeScalarUniform "default_value"
           Float
           'False
         where
        nodeProperty
          = (get_default_value, wrapDroppingSetter set_default_value,
             Nothing)

instance NodeProperty VisualShaderNodeScalarUniform
           "default_value_enabled"
           Bool
           'False
         where
        nodeProperty
          = (is_default_value_enabled,
             wrapDroppingSetter set_default_value_enabled, Nothing)

instance NodeProperty VisualShaderNodeScalarUniform "hint" Int
           'False
         where
        nodeProperty = (get_hint, wrapDroppingSetter set_hint, Nothing)

instance NodeProperty VisualShaderNodeScalarUniform "max" Float
           'False
         where
        nodeProperty = (get_max, wrapDroppingSetter set_max, Nothing)

instance NodeProperty VisualShaderNodeScalarUniform "min" Float
           'False
         where
        nodeProperty = (get_min, wrapDroppingSetter set_min, Nothing)

instance NodeProperty VisualShaderNodeScalarUniform "step" Float
           'False
         where
        nodeProperty = (get_step, wrapDroppingSetter set_step, Nothing)

{-# NOINLINE bindVisualShaderNodeScalarUniform_get_default_value
             #-}

-- | A default value to be assigned within the shader.
bindVisualShaderNodeScalarUniform_get_default_value :: MethodBind
bindVisualShaderNodeScalarUniform_get_default_value
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarUniform" $
        \ clsNamePtr ->
          withCString "get_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A default value to be assigned within the shader.
get_default_value ::
                    (VisualShaderNodeScalarUniform :< cls, Object :< cls) =>
                    cls -> IO Float
get_default_value cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeScalarUniform_get_default_value
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeScalarUniform
           "get_default_value"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeScalarUniform.get_default_value

{-# NOINLINE bindVisualShaderNodeScalarUniform_get_hint #-}

-- | A hint applied to the uniform, which controls the values it can take when set through the inspector.
bindVisualShaderNodeScalarUniform_get_hint :: MethodBind
bindVisualShaderNodeScalarUniform_get_hint
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarUniform" $
        \ clsNamePtr ->
          withCString "get_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A hint applied to the uniform, which controls the values it can take when set through the inspector.
get_hint ::
           (VisualShaderNodeScalarUniform :< cls, Object :< cls) =>
           cls -> IO Int
get_hint cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeScalarUniform_get_hint
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeScalarUniform "get_hint" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualShaderNodeScalarUniform.get_hint

{-# NOINLINE bindVisualShaderNodeScalarUniform_get_max #-}

-- | Minimum value for range hints. Used if @hint@ is set to @HINT_RANGE@ or @HINT_RANGE_STEP@.
bindVisualShaderNodeScalarUniform_get_max :: MethodBind
bindVisualShaderNodeScalarUniform_get_max
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarUniform" $
        \ clsNamePtr ->
          withCString "get_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Minimum value for range hints. Used if @hint@ is set to @HINT_RANGE@ or @HINT_RANGE_STEP@.
get_max ::
          (VisualShaderNodeScalarUniform :< cls, Object :< cls) =>
          cls -> IO Float
get_max cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeScalarUniform_get_max
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeScalarUniform "get_max" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.VisualShaderNodeScalarUniform.get_max

{-# NOINLINE bindVisualShaderNodeScalarUniform_get_min #-}

-- | Maximum value for range hints. Used if @hint@ is set to @HINT_RANGE@ or @HINT_RANGE_STEP@.
bindVisualShaderNodeScalarUniform_get_min :: MethodBind
bindVisualShaderNodeScalarUniform_get_min
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarUniform" $
        \ clsNamePtr ->
          withCString "get_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum value for range hints. Used if @hint@ is set to @HINT_RANGE@ or @HINT_RANGE_STEP@.
get_min ::
          (VisualShaderNodeScalarUniform :< cls, Object :< cls) =>
          cls -> IO Float
get_min cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeScalarUniform_get_min
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeScalarUniform "get_min" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.VisualShaderNodeScalarUniform.get_min

{-# NOINLINE bindVisualShaderNodeScalarUniform_get_step #-}

-- | Step (increment) value for the range hint with step. Used if @hint@ is set to @HINT_RANGE_STEP@.
bindVisualShaderNodeScalarUniform_get_step :: MethodBind
bindVisualShaderNodeScalarUniform_get_step
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarUniform" $
        \ clsNamePtr ->
          withCString "get_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Step (increment) value for the range hint with step. Used if @hint@ is set to @HINT_RANGE_STEP@.
get_step ::
           (VisualShaderNodeScalarUniform :< cls, Object :< cls) =>
           cls -> IO Float
get_step cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeScalarUniform_get_step
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeScalarUniform "get_step" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.VisualShaderNodeScalarUniform.get_step

{-# NOINLINE bindVisualShaderNodeScalarUniform_is_default_value_enabled
             #-}

-- | Enables usage of the @default_value@.
bindVisualShaderNodeScalarUniform_is_default_value_enabled ::
                                                           MethodBind
bindVisualShaderNodeScalarUniform_is_default_value_enabled
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarUniform" $
        \ clsNamePtr ->
          withCString "is_default_value_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables usage of the @default_value@.
is_default_value_enabled ::
                           (VisualShaderNodeScalarUniform :< cls, Object :< cls) =>
                           cls -> IO Bool
is_default_value_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeScalarUniform_is_default_value_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeScalarUniform
           "is_default_value_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeScalarUniform.is_default_value_enabled

{-# NOINLINE bindVisualShaderNodeScalarUniform_set_default_value
             #-}

-- | A default value to be assigned within the shader.
bindVisualShaderNodeScalarUniform_set_default_value :: MethodBind
bindVisualShaderNodeScalarUniform_set_default_value
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarUniform" $
        \ clsNamePtr ->
          withCString "set_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A default value to be assigned within the shader.
set_default_value ::
                    (VisualShaderNodeScalarUniform :< cls, Object :< cls) =>
                    cls -> Float -> IO ()
set_default_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeScalarUniform_set_default_value
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeScalarUniform
           "set_default_value"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeScalarUniform.set_default_value

{-# NOINLINE bindVisualShaderNodeScalarUniform_set_default_value_enabled
             #-}

-- | Enables usage of the @default_value@.
bindVisualShaderNodeScalarUniform_set_default_value_enabled ::
                                                            MethodBind
bindVisualShaderNodeScalarUniform_set_default_value_enabled
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarUniform" $
        \ clsNamePtr ->
          withCString "set_default_value_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables usage of the @default_value@.
set_default_value_enabled ::
                            (VisualShaderNodeScalarUniform :< cls, Object :< cls) =>
                            cls -> Bool -> IO ()
set_default_value_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeScalarUniform_set_default_value_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeScalarUniform
           "set_default_value_enabled"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeScalarUniform.set_default_value_enabled

{-# NOINLINE bindVisualShaderNodeScalarUniform_set_hint #-}

-- | A hint applied to the uniform, which controls the values it can take when set through the inspector.
bindVisualShaderNodeScalarUniform_set_hint :: MethodBind
bindVisualShaderNodeScalarUniform_set_hint
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarUniform" $
        \ clsNamePtr ->
          withCString "set_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A hint applied to the uniform, which controls the values it can take when set through the inspector.
set_hint ::
           (VisualShaderNodeScalarUniform :< cls, Object :< cls) =>
           cls -> Int -> IO ()
set_hint cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeScalarUniform_set_hint
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeScalarUniform "set_hint" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeScalarUniform.set_hint

{-# NOINLINE bindVisualShaderNodeScalarUniform_set_max #-}

-- | Minimum value for range hints. Used if @hint@ is set to @HINT_RANGE@ or @HINT_RANGE_STEP@.
bindVisualShaderNodeScalarUniform_set_max :: MethodBind
bindVisualShaderNodeScalarUniform_set_max
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarUniform" $
        \ clsNamePtr ->
          withCString "set_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Minimum value for range hints. Used if @hint@ is set to @HINT_RANGE@ or @HINT_RANGE_STEP@.
set_max ::
          (VisualShaderNodeScalarUniform :< cls, Object :< cls) =>
          cls -> Float -> IO ()
set_max cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeScalarUniform_set_max
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeScalarUniform "set_max"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeScalarUniform.set_max

{-# NOINLINE bindVisualShaderNodeScalarUniform_set_min #-}

-- | Maximum value for range hints. Used if @hint@ is set to @HINT_RANGE@ or @HINT_RANGE_STEP@.
bindVisualShaderNodeScalarUniform_set_min :: MethodBind
bindVisualShaderNodeScalarUniform_set_min
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarUniform" $
        \ clsNamePtr ->
          withCString "set_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum value for range hints. Used if @hint@ is set to @HINT_RANGE@ or @HINT_RANGE_STEP@.
set_min ::
          (VisualShaderNodeScalarUniform :< cls, Object :< cls) =>
          cls -> Float -> IO ()
set_min cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeScalarUniform_set_min
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeScalarUniform "set_min"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeScalarUniform.set_min

{-# NOINLINE bindVisualShaderNodeScalarUniform_set_step #-}

-- | Step (increment) value for the range hint with step. Used if @hint@ is set to @HINT_RANGE_STEP@.
bindVisualShaderNodeScalarUniform_set_step :: MethodBind
bindVisualShaderNodeScalarUniform_set_step
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarUniform" $
        \ clsNamePtr ->
          withCString "set_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Step (increment) value for the range hint with step. Used if @hint@ is set to @HINT_RANGE_STEP@.
set_step ::
           (VisualShaderNodeScalarUniform :< cls, Object :< cls) =>
           cls -> Float -> IO ()
set_step cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeScalarUniform_set_step
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeScalarUniform "set_step"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeScalarUniform.set_step