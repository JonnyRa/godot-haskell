{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GLTFTexture
       (Godot.Core.GLTFTexture.get_src_image,
        Godot.Core.GLTFTexture.set_src_image)
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

instance NodeProperty GLTFTexture "src_image" Int 'False where
        nodeProperty
          = (get_src_image, wrapDroppingSetter set_src_image, Nothing)

{-# NOINLINE bindGLTFTexture_get_src_image #-}

bindGLTFTexture_get_src_image :: MethodBind
bindGLTFTexture_get_src_image
  = unsafePerformIO $
      withCString "GLTFTexture" $
        \ clsNamePtr ->
          withCString "get_src_image" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_src_image ::
                (GLTFTexture :< cls, Object :< cls) => cls -> IO Int
get_src_image cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFTexture_get_src_image (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFTexture "get_src_image" '[] (IO Int) where
        nodeMethod = Godot.Core.GLTFTexture.get_src_image

{-# NOINLINE bindGLTFTexture_set_src_image #-}

bindGLTFTexture_set_src_image :: MethodBind
bindGLTFTexture_set_src_image
  = unsafePerformIO $
      withCString "GLTFTexture" $
        \ clsNamePtr ->
          withCString "set_src_image" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_src_image ::
                (GLTFTexture :< cls, Object :< cls) => cls -> Int -> IO ()
set_src_image cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFTexture_set_src_image (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFTexture "set_src_image" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GLTFTexture.set_src_image