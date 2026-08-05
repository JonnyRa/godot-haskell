{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GLTFAccessor
       (Godot.Core.GLTFAccessor.get_buffer_view,
        Godot.Core.GLTFAccessor.get_byte_offset,
        Godot.Core.GLTFAccessor.get_component_type,
        Godot.Core.GLTFAccessor.get_count, Godot.Core.GLTFAccessor.get_max,
        Godot.Core.GLTFAccessor.get_min,
        Godot.Core.GLTFAccessor.get_normalized,
        Godot.Core.GLTFAccessor.get_sparse_count,
        Godot.Core.GLTFAccessor.get_sparse_indices_buffer_view,
        Godot.Core.GLTFAccessor.get_sparse_indices_byte_offset,
        Godot.Core.GLTFAccessor.get_sparse_indices_component_type,
        Godot.Core.GLTFAccessor.get_sparse_values_buffer_view,
        Godot.Core.GLTFAccessor.get_sparse_values_byte_offset,
        Godot.Core.GLTFAccessor.get_type,
        Godot.Core.GLTFAccessor.set_buffer_view,
        Godot.Core.GLTFAccessor.set_byte_offset,
        Godot.Core.GLTFAccessor.set_component_type,
        Godot.Core.GLTFAccessor.set_count, Godot.Core.GLTFAccessor.set_max,
        Godot.Core.GLTFAccessor.set_min,
        Godot.Core.GLTFAccessor.set_normalized,
        Godot.Core.GLTFAccessor.set_sparse_count,
        Godot.Core.GLTFAccessor.set_sparse_indices_buffer_view,
        Godot.Core.GLTFAccessor.set_sparse_indices_byte_offset,
        Godot.Core.GLTFAccessor.set_sparse_indices_component_type,
        Godot.Core.GLTFAccessor.set_sparse_values_buffer_view,
        Godot.Core.GLTFAccessor.set_sparse_values_byte_offset,
        Godot.Core.GLTFAccessor.set_type)
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

instance NodeProperty GLTFAccessor "buffer_view" Int 'False where
        nodeProperty
          = (get_buffer_view, wrapDroppingSetter set_buffer_view, Nothing)

instance NodeProperty GLTFAccessor "byte_offset" Int 'False where
        nodeProperty
          = (get_byte_offset, wrapDroppingSetter set_byte_offset, Nothing)

instance NodeProperty GLTFAccessor "component_type" Int 'False
         where
        nodeProperty
          = (get_component_type, wrapDroppingSetter set_component_type,
             Nothing)

instance NodeProperty GLTFAccessor "count" Int 'False where
        nodeProperty = (get_count, wrapDroppingSetter set_count, Nothing)

instance NodeProperty GLTFAccessor "max" PoolRealArray 'False where
        nodeProperty = (get_max, wrapDroppingSetter set_max, Nothing)

instance NodeProperty GLTFAccessor "min" PoolRealArray 'False where
        nodeProperty = (get_min, wrapDroppingSetter set_min, Nothing)

instance NodeProperty GLTFAccessor "normalized" Bool 'False where
        nodeProperty
          = (get_normalized, wrapDroppingSetter set_normalized, Nothing)

instance NodeProperty GLTFAccessor "sparse_count" Int 'False where
        nodeProperty
          = (get_sparse_count, wrapDroppingSetter set_sparse_count, Nothing)

instance NodeProperty GLTFAccessor "sparse_indices_buffer_view" Int
           'False
         where
        nodeProperty
          = (get_sparse_indices_buffer_view,
             wrapDroppingSetter set_sparse_indices_buffer_view, Nothing)

instance NodeProperty GLTFAccessor "sparse_indices_byte_offset" Int
           'False
         where
        nodeProperty
          = (get_sparse_indices_byte_offset,
             wrapDroppingSetter set_sparse_indices_byte_offset, Nothing)

instance NodeProperty GLTFAccessor "sparse_indices_component_type"
           Int
           'False
         where
        nodeProperty
          = (get_sparse_indices_component_type,
             wrapDroppingSetter set_sparse_indices_component_type, Nothing)

instance NodeProperty GLTFAccessor "sparse_values_buffer_view" Int
           'False
         where
        nodeProperty
          = (get_sparse_values_buffer_view,
             wrapDroppingSetter set_sparse_values_buffer_view, Nothing)

instance NodeProperty GLTFAccessor "sparse_values_byte_offset" Int
           'False
         where
        nodeProperty
          = (get_sparse_values_byte_offset,
             wrapDroppingSetter set_sparse_values_byte_offset, Nothing)

instance NodeProperty GLTFAccessor "type" Int 'False where
        nodeProperty = (get_type, wrapDroppingSetter set_type, Nothing)

{-# NOINLINE bindGLTFAccessor_get_buffer_view #-}

bindGLTFAccessor_get_buffer_view :: MethodBind
bindGLTFAccessor_get_buffer_view
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "get_buffer_view" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_buffer_view ::
                  (GLTFAccessor :< cls, Object :< cls) => cls -> IO Int
get_buffer_view cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_get_buffer_view
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "get_buffer_view" '[] (IO Int)
         where
        nodeMethod = Godot.Core.GLTFAccessor.get_buffer_view

{-# NOINLINE bindGLTFAccessor_get_byte_offset #-}

bindGLTFAccessor_get_byte_offset :: MethodBind
bindGLTFAccessor_get_byte_offset
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "get_byte_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_byte_offset ::
                  (GLTFAccessor :< cls, Object :< cls) => cls -> IO Int
get_byte_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_get_byte_offset
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "get_byte_offset" '[] (IO Int)
         where
        nodeMethod = Godot.Core.GLTFAccessor.get_byte_offset

{-# NOINLINE bindGLTFAccessor_get_component_type #-}

bindGLTFAccessor_get_component_type :: MethodBind
bindGLTFAccessor_get_component_type
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "get_component_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_component_type ::
                     (GLTFAccessor :< cls, Object :< cls) => cls -> IO Int
get_component_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_get_component_type
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "get_component_type" '[] (IO Int)
         where
        nodeMethod = Godot.Core.GLTFAccessor.get_component_type

{-# NOINLINE bindGLTFAccessor_get_count #-}

bindGLTFAccessor_get_count :: MethodBind
bindGLTFAccessor_get_count
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "get_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_count :: (GLTFAccessor :< cls, Object :< cls) => cls -> IO Int
get_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_get_count (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "get_count" '[] (IO Int) where
        nodeMethod = Godot.Core.GLTFAccessor.get_count

{-# NOINLINE bindGLTFAccessor_get_max #-}

bindGLTFAccessor_get_max :: MethodBind
bindGLTFAccessor_get_max
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "get_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_max ::
          (GLTFAccessor :< cls, Object :< cls) => cls -> IO PoolRealArray
get_max cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_get_max (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "get_max" '[] (IO PoolRealArray)
         where
        nodeMethod = Godot.Core.GLTFAccessor.get_max

{-# NOINLINE bindGLTFAccessor_get_min #-}

bindGLTFAccessor_get_min :: MethodBind
bindGLTFAccessor_get_min
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "get_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_min ::
          (GLTFAccessor :< cls, Object :< cls) => cls -> IO PoolRealArray
get_min cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_get_min (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "get_min" '[] (IO PoolRealArray)
         where
        nodeMethod = Godot.Core.GLTFAccessor.get_min

{-# NOINLINE bindGLTFAccessor_get_normalized #-}

bindGLTFAccessor_get_normalized :: MethodBind
bindGLTFAccessor_get_normalized
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "get_normalized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_normalized ::
                 (GLTFAccessor :< cls, Object :< cls) => cls -> IO Bool
get_normalized cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_get_normalized (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "get_normalized" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.GLTFAccessor.get_normalized

{-# NOINLINE bindGLTFAccessor_get_sparse_count #-}

bindGLTFAccessor_get_sparse_count :: MethodBind
bindGLTFAccessor_get_sparse_count
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "get_sparse_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_sparse_count ::
                   (GLTFAccessor :< cls, Object :< cls) => cls -> IO Int
get_sparse_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_get_sparse_count
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "get_sparse_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.GLTFAccessor.get_sparse_count

{-# NOINLINE bindGLTFAccessor_get_sparse_indices_buffer_view #-}

bindGLTFAccessor_get_sparse_indices_buffer_view :: MethodBind
bindGLTFAccessor_get_sparse_indices_buffer_view
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "get_sparse_indices_buffer_view" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_sparse_indices_buffer_view ::
                                 (GLTFAccessor :< cls, Object :< cls) => cls -> IO Int
get_sparse_indices_buffer_view cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFAccessor_get_sparse_indices_buffer_view
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "get_sparse_indices_buffer_view"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.GLTFAccessor.get_sparse_indices_buffer_view

{-# NOINLINE bindGLTFAccessor_get_sparse_indices_byte_offset #-}

bindGLTFAccessor_get_sparse_indices_byte_offset :: MethodBind
bindGLTFAccessor_get_sparse_indices_byte_offset
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "get_sparse_indices_byte_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_sparse_indices_byte_offset ::
                                 (GLTFAccessor :< cls, Object :< cls) => cls -> IO Int
get_sparse_indices_byte_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFAccessor_get_sparse_indices_byte_offset
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "get_sparse_indices_byte_offset"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.GLTFAccessor.get_sparse_indices_byte_offset

{-# NOINLINE bindGLTFAccessor_get_sparse_indices_component_type #-}

bindGLTFAccessor_get_sparse_indices_component_type :: MethodBind
bindGLTFAccessor_get_sparse_indices_component_type
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "get_sparse_indices_component_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_sparse_indices_component_type ::
                                    (GLTFAccessor :< cls, Object :< cls) => cls -> IO Int
get_sparse_indices_component_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFAccessor_get_sparse_indices_component_type
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor
           "get_sparse_indices_component_type"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.GLTFAccessor.get_sparse_indices_component_type

{-# NOINLINE bindGLTFAccessor_get_sparse_values_buffer_view #-}

bindGLTFAccessor_get_sparse_values_buffer_view :: MethodBind
bindGLTFAccessor_get_sparse_values_buffer_view
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "get_sparse_values_buffer_view" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_sparse_values_buffer_view ::
                                (GLTFAccessor :< cls, Object :< cls) => cls -> IO Int
get_sparse_values_buffer_view cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFAccessor_get_sparse_values_buffer_view
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "get_sparse_values_buffer_view"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.GLTFAccessor.get_sparse_values_buffer_view

{-# NOINLINE bindGLTFAccessor_get_sparse_values_byte_offset #-}

bindGLTFAccessor_get_sparse_values_byte_offset :: MethodBind
bindGLTFAccessor_get_sparse_values_byte_offset
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "get_sparse_values_byte_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_sparse_values_byte_offset ::
                                (GLTFAccessor :< cls, Object :< cls) => cls -> IO Int
get_sparse_values_byte_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFAccessor_get_sparse_values_byte_offset
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "get_sparse_values_byte_offset"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.GLTFAccessor.get_sparse_values_byte_offset

{-# NOINLINE bindGLTFAccessor_get_type #-}

bindGLTFAccessor_get_type :: MethodBind
bindGLTFAccessor_get_type
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "get_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_type :: (GLTFAccessor :< cls, Object :< cls) => cls -> IO Int
get_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_get_type (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "get_type" '[] (IO Int) where
        nodeMethod = Godot.Core.GLTFAccessor.get_type

{-# NOINLINE bindGLTFAccessor_set_buffer_view #-}

bindGLTFAccessor_set_buffer_view :: MethodBind
bindGLTFAccessor_set_buffer_view
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "set_buffer_view" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_buffer_view ::
                  (GLTFAccessor :< cls, Object :< cls) => cls -> Int -> IO ()
set_buffer_view cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_set_buffer_view
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "set_buffer_view" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GLTFAccessor.set_buffer_view

{-# NOINLINE bindGLTFAccessor_set_byte_offset #-}

bindGLTFAccessor_set_byte_offset :: MethodBind
bindGLTFAccessor_set_byte_offset
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "set_byte_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_byte_offset ::
                  (GLTFAccessor :< cls, Object :< cls) => cls -> Int -> IO ()
set_byte_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_set_byte_offset
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "set_byte_offset" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GLTFAccessor.set_byte_offset

{-# NOINLINE bindGLTFAccessor_set_component_type #-}

bindGLTFAccessor_set_component_type :: MethodBind
bindGLTFAccessor_set_component_type
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "set_component_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_component_type ::
                     (GLTFAccessor :< cls, Object :< cls) => cls -> Int -> IO ()
set_component_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_set_component_type
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "set_component_type" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFAccessor.set_component_type

{-# NOINLINE bindGLTFAccessor_set_count #-}

bindGLTFAccessor_set_count :: MethodBind
bindGLTFAccessor_set_count
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "set_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_count ::
            (GLTFAccessor :< cls, Object :< cls) => cls -> Int -> IO ()
set_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_set_count (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "set_count" '[Int] (IO ()) where
        nodeMethod = Godot.Core.GLTFAccessor.set_count

{-# NOINLINE bindGLTFAccessor_set_max #-}

bindGLTFAccessor_set_max :: MethodBind
bindGLTFAccessor_set_max
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "set_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_max ::
          (GLTFAccessor :< cls, Object :< cls) =>
          cls -> PoolRealArray -> IO ()
set_max cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_set_max (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "set_max" '[PoolRealArray] (IO ())
         where
        nodeMethod = Godot.Core.GLTFAccessor.set_max

{-# NOINLINE bindGLTFAccessor_set_min #-}

bindGLTFAccessor_set_min :: MethodBind
bindGLTFAccessor_set_min
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "set_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_min ::
          (GLTFAccessor :< cls, Object :< cls) =>
          cls -> PoolRealArray -> IO ()
set_min cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_set_min (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "set_min" '[PoolRealArray] (IO ())
         where
        nodeMethod = Godot.Core.GLTFAccessor.set_min

{-# NOINLINE bindGLTFAccessor_set_normalized #-}

bindGLTFAccessor_set_normalized :: MethodBind
bindGLTFAccessor_set_normalized
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "set_normalized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_normalized ::
                 (GLTFAccessor :< cls, Object :< cls) => cls -> Bool -> IO ()
set_normalized cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_set_normalized (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "set_normalized" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.GLTFAccessor.set_normalized

{-# NOINLINE bindGLTFAccessor_set_sparse_count #-}

bindGLTFAccessor_set_sparse_count :: MethodBind
bindGLTFAccessor_set_sparse_count
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "set_sparse_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_sparse_count ::
                   (GLTFAccessor :< cls, Object :< cls) => cls -> Int -> IO ()
set_sparse_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_set_sparse_count
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "set_sparse_count" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GLTFAccessor.set_sparse_count

{-# NOINLINE bindGLTFAccessor_set_sparse_indices_buffer_view #-}

bindGLTFAccessor_set_sparse_indices_buffer_view :: MethodBind
bindGLTFAccessor_set_sparse_indices_buffer_view
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "set_sparse_indices_buffer_view" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_sparse_indices_buffer_view ::
                                 (GLTFAccessor :< cls, Object :< cls) => cls -> Int -> IO ()
set_sparse_indices_buffer_view cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFAccessor_set_sparse_indices_buffer_view
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "set_sparse_indices_buffer_view"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFAccessor.set_sparse_indices_buffer_view

{-# NOINLINE bindGLTFAccessor_set_sparse_indices_byte_offset #-}

bindGLTFAccessor_set_sparse_indices_byte_offset :: MethodBind
bindGLTFAccessor_set_sparse_indices_byte_offset
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "set_sparse_indices_byte_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_sparse_indices_byte_offset ::
                                 (GLTFAccessor :< cls, Object :< cls) => cls -> Int -> IO ()
set_sparse_indices_byte_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFAccessor_set_sparse_indices_byte_offset
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "set_sparse_indices_byte_offset"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFAccessor.set_sparse_indices_byte_offset

{-# NOINLINE bindGLTFAccessor_set_sparse_indices_component_type #-}

bindGLTFAccessor_set_sparse_indices_component_type :: MethodBind
bindGLTFAccessor_set_sparse_indices_component_type
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "set_sparse_indices_component_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_sparse_indices_component_type ::
                                    (GLTFAccessor :< cls, Object :< cls) => cls -> Int -> IO ()
set_sparse_indices_component_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFAccessor_set_sparse_indices_component_type
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor
           "set_sparse_indices_component_type"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.GLTFAccessor.set_sparse_indices_component_type

{-# NOINLINE bindGLTFAccessor_set_sparse_values_buffer_view #-}

bindGLTFAccessor_set_sparse_values_buffer_view :: MethodBind
bindGLTFAccessor_set_sparse_values_buffer_view
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "set_sparse_values_buffer_view" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_sparse_values_buffer_view ::
                                (GLTFAccessor :< cls, Object :< cls) => cls -> Int -> IO ()
set_sparse_values_buffer_view cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFAccessor_set_sparse_values_buffer_view
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "set_sparse_values_buffer_view"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFAccessor.set_sparse_values_buffer_view

{-# NOINLINE bindGLTFAccessor_set_sparse_values_byte_offset #-}

bindGLTFAccessor_set_sparse_values_byte_offset :: MethodBind
bindGLTFAccessor_set_sparse_values_byte_offset
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "set_sparse_values_byte_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_sparse_values_byte_offset ::
                                (GLTFAccessor :< cls, Object :< cls) => cls -> Int -> IO ()
set_sparse_values_byte_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFAccessor_set_sparse_values_byte_offset
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "set_sparse_values_byte_offset"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFAccessor.set_sparse_values_byte_offset

{-# NOINLINE bindGLTFAccessor_set_type #-}

bindGLTFAccessor_set_type :: MethodBind
bindGLTFAccessor_set_type
  = unsafePerformIO $
      withCString "GLTFAccessor" $
        \ clsNamePtr ->
          withCString "set_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_type ::
           (GLTFAccessor :< cls, Object :< cls) => cls -> Int -> IO ()
set_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFAccessor_set_type (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFAccessor "set_type" '[Int] (IO ()) where
        nodeMethod = Godot.Core.GLTFAccessor.set_type