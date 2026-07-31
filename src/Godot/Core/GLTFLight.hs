{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GLTFLight
       (Godot.Core.GLTFLight.get_color,
        Godot.Core.GLTFLight.get_inner_cone_angle,
        Godot.Core.GLTFLight.get_intensity,
        Godot.Core.GLTFLight.get_outer_cone_angle,
        Godot.Core.GLTFLight.get_range, Godot.Core.GLTFLight.get_type,
        Godot.Core.GLTFLight.set_color,
        Godot.Core.GLTFLight.set_inner_cone_angle,
        Godot.Core.GLTFLight.set_intensity,
        Godot.Core.GLTFLight.set_outer_cone_angle,
        Godot.Core.GLTFLight.set_range, Godot.Core.GLTFLight.set_type)
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
import Godot.Core.Resource()

instance NodeProperty GLTFLight "color" Color 'False where
        nodeProperty = (get_color, wrapDroppingSetter set_color, Nothing)

instance NodeProperty GLTFLight "inner_cone_angle" Float 'False
         where
        nodeProperty
          = (get_inner_cone_angle, wrapDroppingSetter set_inner_cone_angle,
             Nothing)

instance NodeProperty GLTFLight "intensity" Float 'False where
        nodeProperty
          = (get_intensity, wrapDroppingSetter set_intensity, Nothing)

instance NodeProperty GLTFLight "outer_cone_angle" Float 'False
         where
        nodeProperty
          = (get_outer_cone_angle, wrapDroppingSetter set_outer_cone_angle,
             Nothing)

instance NodeProperty GLTFLight "range" Float 'False where
        nodeProperty = (get_range, wrapDroppingSetter set_range, Nothing)

instance NodeProperty GLTFLight "type" GodotString 'False where
        nodeProperty = (get_type, wrapDroppingSetter set_type, Nothing)

{-# NOINLINE bindGLTFLight_get_color #-}

bindGLTFLight_get_color :: MethodBind
bindGLTFLight_get_color
  = unsafePerformIO $
      withCString "GLTFLight" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_color :: (GLTFLight :< cls, Object :< cls) => cls -> IO Color
get_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFLight_get_color (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFLight "get_color" '[] (IO Color) where
        nodeMethod = Godot.Core.GLTFLight.get_color

{-# NOINLINE bindGLTFLight_get_inner_cone_angle #-}

bindGLTFLight_get_inner_cone_angle :: MethodBind
bindGLTFLight_get_inner_cone_angle
  = unsafePerformIO $
      withCString "GLTFLight" $
        \ clsNamePtr ->
          withCString "get_inner_cone_angle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_inner_cone_angle ::
                       (GLTFLight :< cls, Object :< cls) => cls -> IO Float
get_inner_cone_angle cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFLight_get_inner_cone_angle
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFLight "get_inner_cone_angle" '[] (IO Float)
         where
        nodeMethod = Godot.Core.GLTFLight.get_inner_cone_angle

{-# NOINLINE bindGLTFLight_get_intensity #-}

bindGLTFLight_get_intensity :: MethodBind
bindGLTFLight_get_intensity
  = unsafePerformIO $
      withCString "GLTFLight" $
        \ clsNamePtr ->
          withCString "get_intensity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_intensity ::
                (GLTFLight :< cls, Object :< cls) => cls -> IO Float
get_intensity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFLight_get_intensity (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFLight "get_intensity" '[] (IO Float) where
        nodeMethod = Godot.Core.GLTFLight.get_intensity

{-# NOINLINE bindGLTFLight_get_outer_cone_angle #-}

bindGLTFLight_get_outer_cone_angle :: MethodBind
bindGLTFLight_get_outer_cone_angle
  = unsafePerformIO $
      withCString "GLTFLight" $
        \ clsNamePtr ->
          withCString "get_outer_cone_angle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_outer_cone_angle ::
                       (GLTFLight :< cls, Object :< cls) => cls -> IO Float
get_outer_cone_angle cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFLight_get_outer_cone_angle
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFLight "get_outer_cone_angle" '[] (IO Float)
         where
        nodeMethod = Godot.Core.GLTFLight.get_outer_cone_angle

{-# NOINLINE bindGLTFLight_get_range #-}

bindGLTFLight_get_range :: MethodBind
bindGLTFLight_get_range
  = unsafePerformIO $
      withCString "GLTFLight" $
        \ clsNamePtr ->
          withCString "get_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_range :: (GLTFLight :< cls, Object :< cls) => cls -> IO Float
get_range cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFLight_get_range (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFLight "get_range" '[] (IO Float) where
        nodeMethod = Godot.Core.GLTFLight.get_range

{-# NOINLINE bindGLTFLight_get_type #-}

bindGLTFLight_get_type :: MethodBind
bindGLTFLight_get_type
  = unsafePerformIO $
      withCString "GLTFLight" $
        \ clsNamePtr ->
          withCString "get_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_type ::
           (GLTFLight :< cls, Object :< cls) => cls -> IO GodotString
get_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFLight_get_type (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFLight "get_type" '[] (IO GodotString) where
        nodeMethod = Godot.Core.GLTFLight.get_type

{-# NOINLINE bindGLTFLight_set_color #-}

bindGLTFLight_set_color :: MethodBind
bindGLTFLight_set_color
  = unsafePerformIO $
      withCString "GLTFLight" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_color ::
            (GLTFLight :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFLight_set_color (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFLight "set_color" '[Color] (IO ()) where
        nodeMethod = Godot.Core.GLTFLight.set_color

{-# NOINLINE bindGLTFLight_set_inner_cone_angle #-}

bindGLTFLight_set_inner_cone_angle :: MethodBind
bindGLTFLight_set_inner_cone_angle
  = unsafePerformIO $
      withCString "GLTFLight" $
        \ clsNamePtr ->
          withCString "set_inner_cone_angle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_inner_cone_angle ::
                       (GLTFLight :< cls, Object :< cls) => cls -> Float -> IO ()
set_inner_cone_angle cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFLight_set_inner_cone_angle
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFLight "set_inner_cone_angle" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFLight.set_inner_cone_angle

{-# NOINLINE bindGLTFLight_set_intensity #-}

bindGLTFLight_set_intensity :: MethodBind
bindGLTFLight_set_intensity
  = unsafePerformIO $
      withCString "GLTFLight" $
        \ clsNamePtr ->
          withCString "set_intensity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_intensity ::
                (GLTFLight :< cls, Object :< cls) => cls -> Float -> IO ()
set_intensity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFLight_set_intensity (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFLight "set_intensity" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.GLTFLight.set_intensity

{-# NOINLINE bindGLTFLight_set_outer_cone_angle #-}

bindGLTFLight_set_outer_cone_angle :: MethodBind
bindGLTFLight_set_outer_cone_angle
  = unsafePerformIO $
      withCString "GLTFLight" $
        \ clsNamePtr ->
          withCString "set_outer_cone_angle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_outer_cone_angle ::
                       (GLTFLight :< cls, Object :< cls) => cls -> Float -> IO ()
set_outer_cone_angle cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFLight_set_outer_cone_angle
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFLight "set_outer_cone_angle" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFLight.set_outer_cone_angle

{-# NOINLINE bindGLTFLight_set_range #-}

bindGLTFLight_set_range :: MethodBind
bindGLTFLight_set_range
  = unsafePerformIO $
      withCString "GLTFLight" $
        \ clsNamePtr ->
          withCString "set_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_range ::
            (GLTFLight :< cls, Object :< cls) => cls -> Float -> IO ()
set_range cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFLight_set_range (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFLight "set_range" '[Float] (IO ()) where
        nodeMethod = Godot.Core.GLTFLight.set_range

{-# NOINLINE bindGLTFLight_set_type #-}

bindGLTFLight_set_type :: MethodBind
bindGLTFLight_set_type
  = unsafePerformIO $
      withCString "GLTFLight" $
        \ clsNamePtr ->
          withCString "set_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_type ::
           (GLTFLight :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFLight_set_type (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFLight "set_type" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.GLTFLight.set_type