{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GLTFTextureSampler
       (Godot.Core.GLTFTextureSampler.get_mag_filter,
        Godot.Core.GLTFTextureSampler.get_min_filter,
        Godot.Core.GLTFTextureSampler.get_wrap_s,
        Godot.Core.GLTFTextureSampler.get_wrap_t,
        Godot.Core.GLTFTextureSampler.set_mag_filter,
        Godot.Core.GLTFTextureSampler.set_min_filter,
        Godot.Core.GLTFTextureSampler.set_wrap_s,
        Godot.Core.GLTFTextureSampler.set_wrap_t)
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

instance NodeProperty GLTFTextureSampler "mag_filter" Int 'False
         where
        nodeProperty
          = (get_mag_filter, wrapDroppingSetter set_mag_filter, Nothing)

instance NodeProperty GLTFTextureSampler "min_filter" Int 'False
         where
        nodeProperty
          = (get_min_filter, wrapDroppingSetter set_min_filter, Nothing)

instance NodeProperty GLTFTextureSampler "wrap_s" Int 'False where
        nodeProperty = (get_wrap_s, wrapDroppingSetter set_wrap_s, Nothing)

instance NodeProperty GLTFTextureSampler "wrap_t" Int 'False where
        nodeProperty = (get_wrap_t, wrapDroppingSetter set_wrap_t, Nothing)

{-# NOINLINE bindGLTFTextureSampler_get_mag_filter #-}

bindGLTFTextureSampler_get_mag_filter :: MethodBind
bindGLTFTextureSampler_get_mag_filter
  = unsafePerformIO $
      withCString "GLTFTextureSampler" $
        \ clsNamePtr ->
          withCString "get_mag_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mag_filter ::
                 (GLTFTextureSampler :< cls, Object :< cls) => cls -> IO Int
get_mag_filter cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFTextureSampler_get_mag_filter
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFTextureSampler "get_mag_filter" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.GLTFTextureSampler.get_mag_filter

{-# NOINLINE bindGLTFTextureSampler_get_min_filter #-}

bindGLTFTextureSampler_get_min_filter :: MethodBind
bindGLTFTextureSampler_get_min_filter
  = unsafePerformIO $
      withCString "GLTFTextureSampler" $
        \ clsNamePtr ->
          withCString "get_min_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_min_filter ::
                 (GLTFTextureSampler :< cls, Object :< cls) => cls -> IO Int
get_min_filter cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFTextureSampler_get_min_filter
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFTextureSampler "get_min_filter" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.GLTFTextureSampler.get_min_filter

{-# NOINLINE bindGLTFTextureSampler_get_wrap_s #-}

bindGLTFTextureSampler_get_wrap_s :: MethodBind
bindGLTFTextureSampler_get_wrap_s
  = unsafePerformIO $
      withCString "GLTFTextureSampler" $
        \ clsNamePtr ->
          withCString "get_wrap_s" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_wrap_s ::
             (GLTFTextureSampler :< cls, Object :< cls) => cls -> IO Int
get_wrap_s cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFTextureSampler_get_wrap_s
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFTextureSampler "get_wrap_s" '[] (IO Int)
         where
        nodeMethod = Godot.Core.GLTFTextureSampler.get_wrap_s

{-# NOINLINE bindGLTFTextureSampler_get_wrap_t #-}

bindGLTFTextureSampler_get_wrap_t :: MethodBind
bindGLTFTextureSampler_get_wrap_t
  = unsafePerformIO $
      withCString "GLTFTextureSampler" $
        \ clsNamePtr ->
          withCString "get_wrap_t" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_wrap_t ::
             (GLTFTextureSampler :< cls, Object :< cls) => cls -> IO Int
get_wrap_t cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFTextureSampler_get_wrap_t
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFTextureSampler "get_wrap_t" '[] (IO Int)
         where
        nodeMethod = Godot.Core.GLTFTextureSampler.get_wrap_t

{-# NOINLINE bindGLTFTextureSampler_set_mag_filter #-}

bindGLTFTextureSampler_set_mag_filter :: MethodBind
bindGLTFTextureSampler_set_mag_filter
  = unsafePerformIO $
      withCString "GLTFTextureSampler" $
        \ clsNamePtr ->
          withCString "set_mag_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_mag_filter ::
                 (GLTFTextureSampler :< cls, Object :< cls) => cls -> Int -> IO ()
set_mag_filter cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFTextureSampler_set_mag_filter
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFTextureSampler "set_mag_filter" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFTextureSampler.set_mag_filter

{-# NOINLINE bindGLTFTextureSampler_set_min_filter #-}

bindGLTFTextureSampler_set_min_filter :: MethodBind
bindGLTFTextureSampler_set_min_filter
  = unsafePerformIO $
      withCString "GLTFTextureSampler" $
        \ clsNamePtr ->
          withCString "set_min_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_min_filter ::
                 (GLTFTextureSampler :< cls, Object :< cls) => cls -> Int -> IO ()
set_min_filter cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFTextureSampler_set_min_filter
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFTextureSampler "set_min_filter" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFTextureSampler.set_min_filter

{-# NOINLINE bindGLTFTextureSampler_set_wrap_s #-}

bindGLTFTextureSampler_set_wrap_s :: MethodBind
bindGLTFTextureSampler_set_wrap_s
  = unsafePerformIO $
      withCString "GLTFTextureSampler" $
        \ clsNamePtr ->
          withCString "set_wrap_s" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_wrap_s ::
             (GLTFTextureSampler :< cls, Object :< cls) => cls -> Int -> IO ()
set_wrap_s cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFTextureSampler_set_wrap_s
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFTextureSampler "set_wrap_s" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GLTFTextureSampler.set_wrap_s

{-# NOINLINE bindGLTFTextureSampler_set_wrap_t #-}

bindGLTFTextureSampler_set_wrap_t :: MethodBind
bindGLTFTextureSampler_set_wrap_t
  = unsafePerformIO $
      withCString "GLTFTextureSampler" $
        \ clsNamePtr ->
          withCString "set_wrap_t" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_wrap_t ::
             (GLTFTextureSampler :< cls, Object :< cls) => cls -> Int -> IO ()
set_wrap_t cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFTextureSampler_set_wrap_t
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFTextureSampler "set_wrap_t" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GLTFTextureSampler.set_wrap_t