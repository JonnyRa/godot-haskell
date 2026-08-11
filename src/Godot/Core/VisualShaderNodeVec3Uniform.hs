{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeVec3Uniform
       (Godot.Core.VisualShaderNodeVec3Uniform.get_default_value,
        Godot.Core.VisualShaderNodeVec3Uniform.is_default_value_enabled,
        Godot.Core.VisualShaderNodeVec3Uniform.set_default_value,
        Godot.Core.VisualShaderNodeVec3Uniform.set_default_value_enabled)
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

instance NodeProperty VisualShaderNodeVec3Uniform "default_value"
           Vector3
           'False
         where
        nodeProperty
          = (get_default_value, wrapDroppingSetter set_default_value,
             Nothing)

instance NodeProperty VisualShaderNodeVec3Uniform
           "default_value_enabled"
           Bool
           'False
         where
        nodeProperty
          = (is_default_value_enabled,
             wrapDroppingSetter set_default_value_enabled, Nothing)

{-# NOINLINE bindVisualShaderNodeVec3Uniform_get_default_value #-}

-- | A default value to be assigned within the shader.
bindVisualShaderNodeVec3Uniform_get_default_value :: MethodBind
bindVisualShaderNodeVec3Uniform_get_default_value
  = unsafePerformIO $
      withCString "VisualShaderNodeVec3Uniform" $
        \ clsNamePtr ->
          withCString "get_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A default value to be assigned within the shader.
get_default_value ::
                    (VisualShaderNodeVec3Uniform :< cls, Object :< cls) =>
                    cls -> IO Vector3
get_default_value cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeVec3Uniform_get_default_value
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeVec3Uniform "get_default_value"
           '[]
           (IO Vector3)
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeVec3Uniform.get_default_value

{-# NOINLINE bindVisualShaderNodeVec3Uniform_is_default_value_enabled
             #-}

-- | Enables usage of the @default_value@.
bindVisualShaderNodeVec3Uniform_is_default_value_enabled ::
                                                         MethodBind
bindVisualShaderNodeVec3Uniform_is_default_value_enabled
  = unsafePerformIO $
      withCString "VisualShaderNodeVec3Uniform" $
        \ clsNamePtr ->
          withCString "is_default_value_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables usage of the @default_value@.
is_default_value_enabled ::
                           (VisualShaderNodeVec3Uniform :< cls, Object :< cls) =>
                           cls -> IO Bool
is_default_value_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeVec3Uniform_is_default_value_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeVec3Uniform
           "is_default_value_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeVec3Uniform.is_default_value_enabled

{-# NOINLINE bindVisualShaderNodeVec3Uniform_set_default_value #-}

-- | A default value to be assigned within the shader.
bindVisualShaderNodeVec3Uniform_set_default_value :: MethodBind
bindVisualShaderNodeVec3Uniform_set_default_value
  = unsafePerformIO $
      withCString "VisualShaderNodeVec3Uniform" $
        \ clsNamePtr ->
          withCString "set_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A default value to be assigned within the shader.
set_default_value ::
                    (VisualShaderNodeVec3Uniform :< cls, Object :< cls) =>
                    cls -> Vector3 -> IO ()
set_default_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeVec3Uniform_set_default_value
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeVec3Uniform "set_default_value"
           '[Vector3]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeVec3Uniform.set_default_value

{-# NOINLINE bindVisualShaderNodeVec3Uniform_set_default_value_enabled
             #-}

-- | Enables usage of the @default_value@.
bindVisualShaderNodeVec3Uniform_set_default_value_enabled ::
                                                          MethodBind
bindVisualShaderNodeVec3Uniform_set_default_value_enabled
  = unsafePerformIO $
      withCString "VisualShaderNodeVec3Uniform" $
        \ clsNamePtr ->
          withCString "set_default_value_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables usage of the @default_value@.
set_default_value_enabled ::
                            (VisualShaderNodeVec3Uniform :< cls, Object :< cls) =>
                            cls -> Bool -> IO ()
set_default_value_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeVec3Uniform_set_default_value_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeVec3Uniform
           "set_default_value_enabled"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeVec3Uniform.set_default_value_enabled