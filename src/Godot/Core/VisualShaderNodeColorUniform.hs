{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeColorUniform
       (Godot.Core.VisualShaderNodeColorUniform.get_default_value,
        Godot.Core.VisualShaderNodeColorUniform.is_default_value_enabled,
        Godot.Core.VisualShaderNodeColorUniform.set_default_value,
        Godot.Core.VisualShaderNodeColorUniform.set_default_value_enabled)
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

instance NodeProperty VisualShaderNodeColorUniform "default_value"
           Color
           'False
         where
        nodeProperty
          = (get_default_value, wrapDroppingSetter set_default_value,
             Nothing)

instance NodeProperty VisualShaderNodeColorUniform
           "default_value_enabled"
           Bool
           'False
         where
        nodeProperty
          = (is_default_value_enabled,
             wrapDroppingSetter set_default_value_enabled, Nothing)

{-# NOINLINE bindVisualShaderNodeColorUniform_get_default_value #-}

-- | A default value to be assigned within the shader.
bindVisualShaderNodeColorUniform_get_default_value :: MethodBind
bindVisualShaderNodeColorUniform_get_default_value
  = unsafePerformIO $
      withCString "VisualShaderNodeColorUniform" $
        \ clsNamePtr ->
          withCString "get_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A default value to be assigned within the shader.
get_default_value ::
                    (VisualShaderNodeColorUniform :< cls, Object :< cls) =>
                    cls -> IO Color
get_default_value cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeColorUniform_get_default_value
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeColorUniform
           "get_default_value"
           '[]
           (IO Color)
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeColorUniform.get_default_value

{-# NOINLINE bindVisualShaderNodeColorUniform_is_default_value_enabled
             #-}

-- | Enables usage of the @default_value@.
bindVisualShaderNodeColorUniform_is_default_value_enabled ::
                                                          MethodBind
bindVisualShaderNodeColorUniform_is_default_value_enabled
  = unsafePerformIO $
      withCString "VisualShaderNodeColorUniform" $
        \ clsNamePtr ->
          withCString "is_default_value_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables usage of the @default_value@.
is_default_value_enabled ::
                           (VisualShaderNodeColorUniform :< cls, Object :< cls) =>
                           cls -> IO Bool
is_default_value_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeColorUniform_is_default_value_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeColorUniform
           "is_default_value_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeColorUniform.is_default_value_enabled

{-# NOINLINE bindVisualShaderNodeColorUniform_set_default_value #-}

-- | A default value to be assigned within the shader.
bindVisualShaderNodeColorUniform_set_default_value :: MethodBind
bindVisualShaderNodeColorUniform_set_default_value
  = unsafePerformIO $
      withCString "VisualShaderNodeColorUniform" $
        \ clsNamePtr ->
          withCString "set_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A default value to be assigned within the shader.
set_default_value ::
                    (VisualShaderNodeColorUniform :< cls, Object :< cls) =>
                    cls -> Color -> IO ()
set_default_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeColorUniform_set_default_value
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeColorUniform
           "set_default_value"
           '[Color]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeColorUniform.set_default_value

{-# NOINLINE bindVisualShaderNodeColorUniform_set_default_value_enabled
             #-}

-- | Enables usage of the @default_value@.
bindVisualShaderNodeColorUniform_set_default_value_enabled ::
                                                           MethodBind
bindVisualShaderNodeColorUniform_set_default_value_enabled
  = unsafePerformIO $
      withCString "VisualShaderNodeColorUniform" $
        \ clsNamePtr ->
          withCString "set_default_value_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables usage of the @default_value@.
set_default_value_enabled ::
                            (VisualShaderNodeColorUniform :< cls, Object :< cls) =>
                            cls -> Bool -> IO ()
set_default_value_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeColorUniform_set_default_value_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeColorUniform
           "set_default_value_enabled"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeColorUniform.set_default_value_enabled