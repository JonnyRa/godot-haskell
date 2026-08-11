{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeBooleanUniform
       (Godot.Core.VisualShaderNodeBooleanUniform.get_default_value,
        Godot.Core.VisualShaderNodeBooleanUniform.is_default_value_enabled,
        Godot.Core.VisualShaderNodeBooleanUniform.set_default_value,
        Godot.Core.VisualShaderNodeBooleanUniform.set_default_value_enabled)
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

instance NodeProperty VisualShaderNodeBooleanUniform
           "default_value"
           Bool
           'False
         where
        nodeProperty
          = (get_default_value, wrapDroppingSetter set_default_value,
             Nothing)

instance NodeProperty VisualShaderNodeBooleanUniform
           "default_value_enabled"
           Bool
           'False
         where
        nodeProperty
          = (is_default_value_enabled,
             wrapDroppingSetter set_default_value_enabled, Nothing)

{-# NOINLINE bindVisualShaderNodeBooleanUniform_get_default_value
             #-}

-- | A default value to be assigned within the shader.
bindVisualShaderNodeBooleanUniform_get_default_value :: MethodBind
bindVisualShaderNodeBooleanUniform_get_default_value
  = unsafePerformIO $
      withCString "VisualShaderNodeBooleanUniform" $
        \ clsNamePtr ->
          withCString "get_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A default value to be assigned within the shader.
get_default_value ::
                    (VisualShaderNodeBooleanUniform :< cls, Object :< cls) =>
                    cls -> IO Bool
get_default_value cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeBooleanUniform_get_default_value
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeBooleanUniform
           "get_default_value"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeBooleanUniform.get_default_value

{-# NOINLINE bindVisualShaderNodeBooleanUniform_is_default_value_enabled
             #-}

-- | Enables usage of the @default_value@.
bindVisualShaderNodeBooleanUniform_is_default_value_enabled ::
                                                            MethodBind
bindVisualShaderNodeBooleanUniform_is_default_value_enabled
  = unsafePerformIO $
      withCString "VisualShaderNodeBooleanUniform" $
        \ clsNamePtr ->
          withCString "is_default_value_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables usage of the @default_value@.
is_default_value_enabled ::
                           (VisualShaderNodeBooleanUniform :< cls, Object :< cls) =>
                           cls -> IO Bool
is_default_value_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeBooleanUniform_is_default_value_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeBooleanUniform
           "is_default_value_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeBooleanUniform.is_default_value_enabled

{-# NOINLINE bindVisualShaderNodeBooleanUniform_set_default_value
             #-}

-- | A default value to be assigned within the shader.
bindVisualShaderNodeBooleanUniform_set_default_value :: MethodBind
bindVisualShaderNodeBooleanUniform_set_default_value
  = unsafePerformIO $
      withCString "VisualShaderNodeBooleanUniform" $
        \ clsNamePtr ->
          withCString "set_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A default value to be assigned within the shader.
set_default_value ::
                    (VisualShaderNodeBooleanUniform :< cls, Object :< cls) =>
                    cls -> Bool -> IO ()
set_default_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeBooleanUniform_set_default_value
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeBooleanUniform
           "set_default_value"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeBooleanUniform.set_default_value

{-# NOINLINE bindVisualShaderNodeBooleanUniform_set_default_value_enabled
             #-}

-- | Enables usage of the @default_value@.
bindVisualShaderNodeBooleanUniform_set_default_value_enabled ::
                                                             MethodBind
bindVisualShaderNodeBooleanUniform_set_default_value_enabled
  = unsafePerformIO $
      withCString "VisualShaderNodeBooleanUniform" $
        \ clsNamePtr ->
          withCString "set_default_value_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables usage of the @default_value@.
set_default_value_enabled ::
                            (VisualShaderNodeBooleanUniform :< cls, Object :< cls) =>
                            cls -> Bool -> IO ()
set_default_value_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeBooleanUniform_set_default_value_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod VisualShaderNodeBooleanUniform
           "set_default_value_enabled"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeBooleanUniform.set_default_value_enabled