{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeTransformUniform
       (Godot.Core.VisualShaderNodeTransformUniform.get_default_value,
        Godot.Core.VisualShaderNodeTransformUniform.is_default_value_enabled,
        Godot.Core.VisualShaderNodeTransformUniform.set_default_value,
        Godot.Core.VisualShaderNodeTransformUniform.set_default_value_enabled)
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

instance NodeProperty VisualShaderNodeTransformUniform
           "default_value"
           Transform
           'False
         where
        nodeProperty
          = (get_default_value, wrapDroppingSetter set_default_value,
             Nothing)

instance NodeProperty VisualShaderNodeTransformUniform
           "default_value_enabled"
           Bool
           'False
         where
        nodeProperty
          = (is_default_value_enabled,
             wrapDroppingSetter set_default_value_enabled, Nothing)

{-# NOINLINE bindVisualShaderNodeTransformUniform_get_default_value
             #-}

-- | A default value to be assigned within the shader.
bindVisualShaderNodeTransformUniform_get_default_value ::
                                                       MethodBind
bindVisualShaderNodeTransformUniform_get_default_value
  = unsafePerformIO $
      withCString "VisualShaderNodeTransformUniform" $
        \ clsNamePtr ->
          withCString "get_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A default value to be assigned within the shader.
get_default_value ::
                    (VisualShaderNodeTransformUniform :< cls, Object :< cls) =>
                    cls -> IO Transform
get_default_value cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeTransformUniform_get_default_value
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeTransformUniform
           "get_default_value"
           '[]
           (IO Transform)
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeTransformUniform.get_default_value

{-# NOINLINE bindVisualShaderNodeTransformUniform_is_default_value_enabled
             #-}

-- | Enables usage of the @default_value@.
bindVisualShaderNodeTransformUniform_is_default_value_enabled ::
                                                              MethodBind
bindVisualShaderNodeTransformUniform_is_default_value_enabled
  = unsafePerformIO $
      withCString "VisualShaderNodeTransformUniform" $
        \ clsNamePtr ->
          withCString "is_default_value_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables usage of the @default_value@.
is_default_value_enabled ::
                           (VisualShaderNodeTransformUniform :< cls, Object :< cls) =>
                           cls -> IO Bool
is_default_value_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeTransformUniform_is_default_value_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeTransformUniform
           "is_default_value_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeTransformUniform.is_default_value_enabled

{-# NOINLINE bindVisualShaderNodeTransformUniform_set_default_value
             #-}

-- | A default value to be assigned within the shader.
bindVisualShaderNodeTransformUniform_set_default_value ::
                                                       MethodBind
bindVisualShaderNodeTransformUniform_set_default_value
  = unsafePerformIO $
      withCString "VisualShaderNodeTransformUniform" $
        \ clsNamePtr ->
          withCString "set_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A default value to be assigned within the shader.
set_default_value ::
                    (VisualShaderNodeTransformUniform :< cls, Object :< cls) =>
                    cls -> Transform -> IO ()
set_default_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeTransformUniform_set_default_value
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeTransformUniform
           "set_default_value"
           '[Transform]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeTransformUniform.set_default_value

{-# NOINLINE bindVisualShaderNodeTransformUniform_set_default_value_enabled
             #-}

-- | Enables usage of the @default_value@.
bindVisualShaderNodeTransformUniform_set_default_value_enabled ::
                                                               MethodBind
bindVisualShaderNodeTransformUniform_set_default_value_enabled
  = unsafePerformIO $
      withCString "VisualShaderNodeTransformUniform" $
        \ clsNamePtr ->
          withCString "set_default_value_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables usage of the @default_value@.
set_default_value_enabled ::
                            (VisualShaderNodeTransformUniform :< cls, Object :< cls) =>
                            cls -> Bool -> IO ()
set_default_value_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeTransformUniform_set_default_value_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeTransformUniform
           "set_default_value_enabled"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeTransformUniform.set_default_value_enabled