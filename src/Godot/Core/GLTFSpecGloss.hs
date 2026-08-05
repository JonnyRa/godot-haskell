{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GLTFSpecGloss
       (Godot.Core.GLTFSpecGloss.get_diffuse_factor,
        Godot.Core.GLTFSpecGloss.get_diffuse_img,
        Godot.Core.GLTFSpecGloss.get_gloss_factor,
        Godot.Core.GLTFSpecGloss.get_spec_gloss_img,
        Godot.Core.GLTFSpecGloss.get_specular_factor,
        Godot.Core.GLTFSpecGloss.set_diffuse_factor,
        Godot.Core.GLTFSpecGloss.set_diffuse_img,
        Godot.Core.GLTFSpecGloss.set_gloss_factor,
        Godot.Core.GLTFSpecGloss.set_spec_gloss_img,
        Godot.Core.GLTFSpecGloss.set_specular_factor)
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

instance NodeProperty GLTFSpecGloss "diffuse_factor" Color 'False
         where
        nodeProperty
          = (get_diffuse_factor, wrapDroppingSetter set_diffuse_factor,
             Nothing)

instance NodeProperty GLTFSpecGloss "diffuse_img" Image 'False
         where
        nodeProperty
          = (get_diffuse_img, wrapDroppingSetter set_diffuse_img, Nothing)

instance NodeProperty GLTFSpecGloss "gloss_factor" Float 'False
         where
        nodeProperty
          = (get_gloss_factor, wrapDroppingSetter set_gloss_factor, Nothing)

instance NodeProperty GLTFSpecGloss "spec_gloss_img" Image 'False
         where
        nodeProperty
          = (get_spec_gloss_img, wrapDroppingSetter set_spec_gloss_img,
             Nothing)

instance NodeProperty GLTFSpecGloss "specular_factor" Color 'False
         where
        nodeProperty
          = (get_specular_factor, wrapDroppingSetter set_specular_factor,
             Nothing)

{-# NOINLINE bindGLTFSpecGloss_get_diffuse_factor #-}

bindGLTFSpecGloss_get_diffuse_factor :: MethodBind
bindGLTFSpecGloss_get_diffuse_factor
  = unsafePerformIO $
      withCString "GLTFSpecGloss" $
        \ clsNamePtr ->
          withCString "get_diffuse_factor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_diffuse_factor ::
                     (GLTFSpecGloss :< cls, Object :< cls) => cls -> IO Color
get_diffuse_factor cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSpecGloss_get_diffuse_factor
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSpecGloss "get_diffuse_factor" '[]
           (IO Color)
         where
        nodeMethod = Godot.Core.GLTFSpecGloss.get_diffuse_factor

{-# NOINLINE bindGLTFSpecGloss_get_diffuse_img #-}

bindGLTFSpecGloss_get_diffuse_img :: MethodBind
bindGLTFSpecGloss_get_diffuse_img
  = unsafePerformIO $
      withCString "GLTFSpecGloss" $
        \ clsNamePtr ->
          withCString "get_diffuse_img" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_diffuse_img ::
                  (GLTFSpecGloss :< cls, Object :< cls) => cls -> IO Image
get_diffuse_img cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSpecGloss_get_diffuse_img
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod GLTFSpecGloss "get_diffuse_img" '[] (IO Image)
         where
        nodeMethod = Godot.Core.GLTFSpecGloss.get_diffuse_img

{-# NOINLINE bindGLTFSpecGloss_get_gloss_factor #-}

bindGLTFSpecGloss_get_gloss_factor :: MethodBind
bindGLTFSpecGloss_get_gloss_factor
  = unsafePerformIO $
      withCString "GLTFSpecGloss" $
        \ clsNamePtr ->
          withCString "get_gloss_factor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_gloss_factor ::
                   (GLTFSpecGloss :< cls, Object :< cls) => cls -> IO Float
get_gloss_factor cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSpecGloss_get_gloss_factor
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSpecGloss "get_gloss_factor" '[] (IO Float)
         where
        nodeMethod = Godot.Core.GLTFSpecGloss.get_gloss_factor

{-# NOINLINE bindGLTFSpecGloss_get_spec_gloss_img #-}

bindGLTFSpecGloss_get_spec_gloss_img :: MethodBind
bindGLTFSpecGloss_get_spec_gloss_img
  = unsafePerformIO $
      withCString "GLTFSpecGloss" $
        \ clsNamePtr ->
          withCString "get_spec_gloss_img" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_spec_gloss_img ::
                     (GLTFSpecGloss :< cls, Object :< cls) => cls -> IO Image
get_spec_gloss_img cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSpecGloss_get_spec_gloss_img
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod GLTFSpecGloss "get_spec_gloss_img" '[]
           (IO Image)
         where
        nodeMethod = Godot.Core.GLTFSpecGloss.get_spec_gloss_img

{-# NOINLINE bindGLTFSpecGloss_get_specular_factor #-}

bindGLTFSpecGloss_get_specular_factor :: MethodBind
bindGLTFSpecGloss_get_specular_factor
  = unsafePerformIO $
      withCString "GLTFSpecGloss" $
        \ clsNamePtr ->
          withCString "get_specular_factor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_specular_factor ::
                      (GLTFSpecGloss :< cls, Object :< cls) => cls -> IO Color
get_specular_factor cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSpecGloss_get_specular_factor
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSpecGloss "get_specular_factor" '[]
           (IO Color)
         where
        nodeMethod = Godot.Core.GLTFSpecGloss.get_specular_factor

{-# NOINLINE bindGLTFSpecGloss_set_diffuse_factor #-}

bindGLTFSpecGloss_set_diffuse_factor :: MethodBind
bindGLTFSpecGloss_set_diffuse_factor
  = unsafePerformIO $
      withCString "GLTFSpecGloss" $
        \ clsNamePtr ->
          withCString "set_diffuse_factor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_diffuse_factor ::
                     (GLTFSpecGloss :< cls, Object :< cls) => cls -> Color -> IO ()
set_diffuse_factor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSpecGloss_set_diffuse_factor
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSpecGloss "set_diffuse_factor" '[Color]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFSpecGloss.set_diffuse_factor

{-# NOINLINE bindGLTFSpecGloss_set_diffuse_img #-}

bindGLTFSpecGloss_set_diffuse_img :: MethodBind
bindGLTFSpecGloss_set_diffuse_img
  = unsafePerformIO $
      withCString "GLTFSpecGloss" $
        \ clsNamePtr ->
          withCString "set_diffuse_img" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_diffuse_img ::
                  (GLTFSpecGloss :< cls, Object :< cls) => cls -> Image -> IO ()
set_diffuse_img cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSpecGloss_set_diffuse_img
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSpecGloss "set_diffuse_img" '[Image]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFSpecGloss.set_diffuse_img

{-# NOINLINE bindGLTFSpecGloss_set_gloss_factor #-}

bindGLTFSpecGloss_set_gloss_factor :: MethodBind
bindGLTFSpecGloss_set_gloss_factor
  = unsafePerformIO $
      withCString "GLTFSpecGloss" $
        \ clsNamePtr ->
          withCString "set_gloss_factor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_gloss_factor ::
                   (GLTFSpecGloss :< cls, Object :< cls) => cls -> Float -> IO ()
set_gloss_factor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSpecGloss_set_gloss_factor
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSpecGloss "set_gloss_factor" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFSpecGloss.set_gloss_factor

{-# NOINLINE bindGLTFSpecGloss_set_spec_gloss_img #-}

bindGLTFSpecGloss_set_spec_gloss_img :: MethodBind
bindGLTFSpecGloss_set_spec_gloss_img
  = unsafePerformIO $
      withCString "GLTFSpecGloss" $
        \ clsNamePtr ->
          withCString "set_spec_gloss_img" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_spec_gloss_img ::
                     (GLTFSpecGloss :< cls, Object :< cls) => cls -> Image -> IO ()
set_spec_gloss_img cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSpecGloss_set_spec_gloss_img
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSpecGloss "set_spec_gloss_img" '[Image]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFSpecGloss.set_spec_gloss_img

{-# NOINLINE bindGLTFSpecGloss_set_specular_factor #-}

bindGLTFSpecGloss_set_specular_factor :: MethodBind
bindGLTFSpecGloss_set_specular_factor
  = unsafePerformIO $
      withCString "GLTFSpecGloss" $
        \ clsNamePtr ->
          withCString "set_specular_factor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_specular_factor ::
                      (GLTFSpecGloss :< cls, Object :< cls) => cls -> Color -> IO ()
set_specular_factor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSpecGloss_set_specular_factor
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSpecGloss "set_specular_factor" '[Color]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFSpecGloss.set_specular_factor