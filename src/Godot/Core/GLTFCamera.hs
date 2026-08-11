{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GLTFCamera
       (Godot.Core.GLTFCamera.get_fov_size,
        Godot.Core.GLTFCamera.get_perspective,
        Godot.Core.GLTFCamera.get_size_mag, Godot.Core.GLTFCamera.get_zfar,
        Godot.Core.GLTFCamera.get_znear,
        Godot.Core.GLTFCamera.set_fov_size,
        Godot.Core.GLTFCamera.set_perspective,
        Godot.Core.GLTFCamera.set_size_mag, Godot.Core.GLTFCamera.set_zfar,
        Godot.Core.GLTFCamera.set_znear,
        Godot.Core.GLTFCamera.to_dictionary, Godot.Core.GLTFCamera.to_node)
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

instance NodeProperty GLTFCamera "fov_size" Float 'False where
        nodeProperty
          = (get_fov_size, wrapDroppingSetter set_fov_size, Nothing)

instance NodeProperty GLTFCamera "perspective" Bool 'False where
        nodeProperty
          = (get_perspective, wrapDroppingSetter set_perspective, Nothing)

instance NodeProperty GLTFCamera "size_mag" Float 'False where
        nodeProperty
          = (get_size_mag, wrapDroppingSetter set_size_mag, Nothing)

instance NodeProperty GLTFCamera "zfar" Float 'False where
        nodeProperty = (get_zfar, wrapDroppingSetter set_zfar, Nothing)

instance NodeProperty GLTFCamera "znear" Float 'False where
        nodeProperty = (get_znear, wrapDroppingSetter set_znear, Nothing)

{-# NOINLINE bindGLTFCamera_get_fov_size #-}

bindGLTFCamera_get_fov_size :: MethodBind
bindGLTFCamera_get_fov_size
  = unsafePerformIO $
      withCString "GLTFCamera" $
        \ clsNamePtr ->
          withCString "get_fov_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_fov_size ::
               (GLTFCamera :< cls, Object :< cls) => cls -> IO Float
get_fov_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCamera_get_fov_size (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCamera "get_fov_size" '[] (IO Float) where
        nodeMethod = Godot.Core.GLTFCamera.get_fov_size

{-# NOINLINE bindGLTFCamera_get_perspective #-}

bindGLTFCamera_get_perspective :: MethodBind
bindGLTFCamera_get_perspective
  = unsafePerformIO $
      withCString "GLTFCamera" $
        \ clsNamePtr ->
          withCString "get_perspective" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_perspective ::
                  (GLTFCamera :< cls, Object :< cls) => cls -> IO Bool
get_perspective cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCamera_get_perspective (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCamera "get_perspective" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.GLTFCamera.get_perspective

{-# NOINLINE bindGLTFCamera_get_size_mag #-}

bindGLTFCamera_get_size_mag :: MethodBind
bindGLTFCamera_get_size_mag
  = unsafePerformIO $
      withCString "GLTFCamera" $
        \ clsNamePtr ->
          withCString "get_size_mag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_size_mag ::
               (GLTFCamera :< cls, Object :< cls) => cls -> IO Float
get_size_mag cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCamera_get_size_mag (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCamera "get_size_mag" '[] (IO Float) where
        nodeMethod = Godot.Core.GLTFCamera.get_size_mag

{-# NOINLINE bindGLTFCamera_get_zfar #-}

bindGLTFCamera_get_zfar :: MethodBind
bindGLTFCamera_get_zfar
  = unsafePerformIO $
      withCString "GLTFCamera" $
        \ clsNamePtr ->
          withCString "get_zfar" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_zfar :: (GLTFCamera :< cls, Object :< cls) => cls -> IO Float
get_zfar cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCamera_get_zfar (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCamera "get_zfar" '[] (IO Float) where
        nodeMethod = Godot.Core.GLTFCamera.get_zfar

{-# NOINLINE bindGLTFCamera_get_znear #-}

bindGLTFCamera_get_znear :: MethodBind
bindGLTFCamera_get_znear
  = unsafePerformIO $
      withCString "GLTFCamera" $
        \ clsNamePtr ->
          withCString "get_znear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_znear :: (GLTFCamera :< cls, Object :< cls) => cls -> IO Float
get_znear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCamera_get_znear (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCamera "get_znear" '[] (IO Float) where
        nodeMethod = Godot.Core.GLTFCamera.get_znear

{-# NOINLINE bindGLTFCamera_set_fov_size #-}

bindGLTFCamera_set_fov_size :: MethodBind
bindGLTFCamera_set_fov_size
  = unsafePerformIO $
      withCString "GLTFCamera" $
        \ clsNamePtr ->
          withCString "set_fov_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_fov_size ::
               (GLTFCamera :< cls, Object :< cls) => cls -> Float -> IO ()
set_fov_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCamera_set_fov_size (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCamera "set_fov_size" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.GLTFCamera.set_fov_size

{-# NOINLINE bindGLTFCamera_set_perspective #-}

bindGLTFCamera_set_perspective :: MethodBind
bindGLTFCamera_set_perspective
  = unsafePerformIO $
      withCString "GLTFCamera" $
        \ clsNamePtr ->
          withCString "set_perspective" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_perspective ::
                  (GLTFCamera :< cls, Object :< cls) => cls -> Bool -> IO ()
set_perspective cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCamera_set_perspective (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCamera "set_perspective" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.GLTFCamera.set_perspective

{-# NOINLINE bindGLTFCamera_set_size_mag #-}

bindGLTFCamera_set_size_mag :: MethodBind
bindGLTFCamera_set_size_mag
  = unsafePerformIO $
      withCString "GLTFCamera" $
        \ clsNamePtr ->
          withCString "set_size_mag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_size_mag ::
               (GLTFCamera :< cls, Object :< cls) => cls -> Float -> IO ()
set_size_mag cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCamera_set_size_mag (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCamera "set_size_mag" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.GLTFCamera.set_size_mag

{-# NOINLINE bindGLTFCamera_set_zfar #-}

bindGLTFCamera_set_zfar :: MethodBind
bindGLTFCamera_set_zfar
  = unsafePerformIO $
      withCString "GLTFCamera" $
        \ clsNamePtr ->
          withCString "set_zfar" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_zfar ::
           (GLTFCamera :< cls, Object :< cls) => cls -> Float -> IO ()
set_zfar cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCamera_set_zfar (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCamera "set_zfar" '[Float] (IO ()) where
        nodeMethod = Godot.Core.GLTFCamera.set_zfar

{-# NOINLINE bindGLTFCamera_set_znear #-}

bindGLTFCamera_set_znear :: MethodBind
bindGLTFCamera_set_znear
  = unsafePerformIO $
      withCString "GLTFCamera" $
        \ clsNamePtr ->
          withCString "set_znear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_znear ::
            (GLTFCamera :< cls, Object :< cls) => cls -> Float -> IO ()
set_znear cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCamera_set_znear (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCamera "set_znear" '[Float] (IO ()) where
        nodeMethod = Godot.Core.GLTFCamera.set_znear

{-# NOINLINE bindGLTFCamera_to_dictionary #-}

bindGLTFCamera_to_dictionary :: MethodBind
bindGLTFCamera_to_dictionary
  = unsafePerformIO $
      withCString "GLTFCamera" $
        \ clsNamePtr ->
          withCString "to_dictionary" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

to_dictionary ::
                (GLTFCamera :< cls, Object :< cls) => cls -> IO Dictionary
to_dictionary cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCamera_to_dictionary (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCamera "to_dictionary" '[] (IO Dictionary)
         where
        nodeMethod = Godot.Core.GLTFCamera.to_dictionary

{-# NOINLINE bindGLTFCamera_to_node #-}

bindGLTFCamera_to_node :: MethodBind
bindGLTFCamera_to_node
  = unsafePerformIO $
      withCString "GLTFCamera" $
        \ clsNamePtr ->
          withCString "to_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

to_node :: (GLTFCamera :< cls, Object :< cls) => cls -> IO Camera
to_node cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCamera_to_node (upcast cls) arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod GLTFCamera "to_node" '[] (IO Camera) where
        nodeMethod = Godot.Core.GLTFCamera.to_node