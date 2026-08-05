{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GLTFAnimation
       (Godot.Core.GLTFAnimation.get_loop,
        Godot.Core.GLTFAnimation.set_loop)
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

instance NodeProperty GLTFAnimation "loop" Bool 'False where
        nodeProperty = (get_loop, wrapDroppingSetter set_loop, Nothing)

{-# NOINLINE bindGLTFAnimation_get_loop #-}

bindGLTFAnimation_get_loop :: MethodBind
bindGLTFAnimation_get_loop
  = unsafePerformIO $
      withCString "GLTFAnimation" $
        \ clsNamePtr ->
          withCString "get_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_loop :: (GLTFAnimation :< cls, Object :< cls) => cls -> IO Bool
get_loop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAnimation_get_loop (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAnimation "get_loop" '[] (IO Bool) where
        nodeMethod = Godot.Core.GLTFAnimation.get_loop

{-# NOINLINE bindGLTFAnimation_set_loop #-}

bindGLTFAnimation_set_loop :: MethodBind
bindGLTFAnimation_set_loop
  = unsafePerformIO $
      withCString "GLTFAnimation" $
        \ clsNamePtr ->
          withCString "set_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_loop ::
           (GLTFAnimation :< cls, Object :< cls) => cls -> Bool -> IO ()
set_loop cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAnimation_set_loop (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAnimation "set_loop" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.GLTFAnimation.set_loop