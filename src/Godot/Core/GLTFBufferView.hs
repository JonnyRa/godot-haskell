{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GLTFBufferView
       (Godot.Core.GLTFBufferView.get_buffer,
        Godot.Core.GLTFBufferView.get_byte_length,
        Godot.Core.GLTFBufferView.get_byte_offset,
        Godot.Core.GLTFBufferView.get_byte_stride,
        Godot.Core.GLTFBufferView.get_indices,
        Godot.Core.GLTFBufferView.set_buffer,
        Godot.Core.GLTFBufferView.set_byte_length,
        Godot.Core.GLTFBufferView.set_byte_offset,
        Godot.Core.GLTFBufferView.set_byte_stride,
        Godot.Core.GLTFBufferView.set_indices)
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

instance NodeProperty GLTFBufferView "buffer" Int 'False where
        nodeProperty = (get_buffer, wrapDroppingSetter set_buffer, Nothing)

instance NodeProperty GLTFBufferView "byte_length" Int 'False where
        nodeProperty
          = (get_byte_length, wrapDroppingSetter set_byte_length, Nothing)

instance NodeProperty GLTFBufferView "byte_offset" Int 'False where
        nodeProperty
          = (get_byte_offset, wrapDroppingSetter set_byte_offset, Nothing)

instance NodeProperty GLTFBufferView "byte_stride" Int 'False where
        nodeProperty
          = (get_byte_stride, wrapDroppingSetter set_byte_stride, Nothing)

instance NodeProperty GLTFBufferView "indices" Bool 'False where
        nodeProperty
          = (get_indices, wrapDroppingSetter set_indices, Nothing)

{-# NOINLINE bindGLTFBufferView_get_buffer #-}

bindGLTFBufferView_get_buffer :: MethodBind
bindGLTFBufferView_get_buffer
  = unsafePerformIO $
      withCString "GLTFBufferView" $
        \ clsNamePtr ->
          withCString "get_buffer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_buffer ::
             (GLTFBufferView :< cls, Object :< cls) => cls -> IO Int
get_buffer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFBufferView_get_buffer (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFBufferView "get_buffer" '[] (IO Int) where
        nodeMethod = Godot.Core.GLTFBufferView.get_buffer

{-# NOINLINE bindGLTFBufferView_get_byte_length #-}

bindGLTFBufferView_get_byte_length :: MethodBind
bindGLTFBufferView_get_byte_length
  = unsafePerformIO $
      withCString "GLTFBufferView" $
        \ clsNamePtr ->
          withCString "get_byte_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_byte_length ::
                  (GLTFBufferView :< cls, Object :< cls) => cls -> IO Int
get_byte_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFBufferView_get_byte_length
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFBufferView "get_byte_length" '[] (IO Int)
         where
        nodeMethod = Godot.Core.GLTFBufferView.get_byte_length

{-# NOINLINE bindGLTFBufferView_get_byte_offset #-}

bindGLTFBufferView_get_byte_offset :: MethodBind
bindGLTFBufferView_get_byte_offset
  = unsafePerformIO $
      withCString "GLTFBufferView" $
        \ clsNamePtr ->
          withCString "get_byte_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_byte_offset ::
                  (GLTFBufferView :< cls, Object :< cls) => cls -> IO Int
get_byte_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFBufferView_get_byte_offset
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFBufferView "get_byte_offset" '[] (IO Int)
         where
        nodeMethod = Godot.Core.GLTFBufferView.get_byte_offset

{-# NOINLINE bindGLTFBufferView_get_byte_stride #-}

bindGLTFBufferView_get_byte_stride :: MethodBind
bindGLTFBufferView_get_byte_stride
  = unsafePerformIO $
      withCString "GLTFBufferView" $
        \ clsNamePtr ->
          withCString "get_byte_stride" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_byte_stride ::
                  (GLTFBufferView :< cls, Object :< cls) => cls -> IO Int
get_byte_stride cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFBufferView_get_byte_stride
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFBufferView "get_byte_stride" '[] (IO Int)
         where
        nodeMethod = Godot.Core.GLTFBufferView.get_byte_stride

{-# NOINLINE bindGLTFBufferView_get_indices #-}

bindGLTFBufferView_get_indices :: MethodBind
bindGLTFBufferView_get_indices
  = unsafePerformIO $
      withCString "GLTFBufferView" $
        \ clsNamePtr ->
          withCString "get_indices" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_indices ::
              (GLTFBufferView :< cls, Object :< cls) => cls -> IO Bool
get_indices cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFBufferView_get_indices (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFBufferView "get_indices" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.GLTFBufferView.get_indices

{-# NOINLINE bindGLTFBufferView_set_buffer #-}

bindGLTFBufferView_set_buffer :: MethodBind
bindGLTFBufferView_set_buffer
  = unsafePerformIO $
      withCString "GLTFBufferView" $
        \ clsNamePtr ->
          withCString "set_buffer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_buffer ::
             (GLTFBufferView :< cls, Object :< cls) => cls -> Int -> IO ()
set_buffer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFBufferView_set_buffer (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFBufferView "set_buffer" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GLTFBufferView.set_buffer

{-# NOINLINE bindGLTFBufferView_set_byte_length #-}

bindGLTFBufferView_set_byte_length :: MethodBind
bindGLTFBufferView_set_byte_length
  = unsafePerformIO $
      withCString "GLTFBufferView" $
        \ clsNamePtr ->
          withCString "set_byte_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_byte_length ::
                  (GLTFBufferView :< cls, Object :< cls) => cls -> Int -> IO ()
set_byte_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFBufferView_set_byte_length
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFBufferView "set_byte_length" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GLTFBufferView.set_byte_length

{-# NOINLINE bindGLTFBufferView_set_byte_offset #-}

bindGLTFBufferView_set_byte_offset :: MethodBind
bindGLTFBufferView_set_byte_offset
  = unsafePerformIO $
      withCString "GLTFBufferView" $
        \ clsNamePtr ->
          withCString "set_byte_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_byte_offset ::
                  (GLTFBufferView :< cls, Object :< cls) => cls -> Int -> IO ()
set_byte_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFBufferView_set_byte_offset
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFBufferView "set_byte_offset" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GLTFBufferView.set_byte_offset

{-# NOINLINE bindGLTFBufferView_set_byte_stride #-}

bindGLTFBufferView_set_byte_stride :: MethodBind
bindGLTFBufferView_set_byte_stride
  = unsafePerformIO $
      withCString "GLTFBufferView" $
        \ clsNamePtr ->
          withCString "set_byte_stride" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_byte_stride ::
                  (GLTFBufferView :< cls, Object :< cls) => cls -> Int -> IO ()
set_byte_stride cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFBufferView_set_byte_stride
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFBufferView "set_byte_stride" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GLTFBufferView.set_byte_stride

{-# NOINLINE bindGLTFBufferView_set_indices #-}

bindGLTFBufferView_set_indices :: MethodBind
bindGLTFBufferView_set_indices
  = unsafePerformIO $
      withCString "GLTFBufferView" $
        \ clsNamePtr ->
          withCString "set_indices" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_indices ::
              (GLTFBufferView :< cls, Object :< cls) => cls -> Bool -> IO ()
set_indices cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFBufferView_set_indices (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFBufferView "set_indices" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.GLTFBufferView.set_indices