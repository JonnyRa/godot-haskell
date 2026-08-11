{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GLTFCollider
       (Godot.Core.GLTFCollider.get_array_mesh,
        Godot.Core.GLTFCollider.get_height,
        Godot.Core.GLTFCollider.get_is_trigger,
        Godot.Core.GLTFCollider.get_mesh_index,
        Godot.Core.GLTFCollider.get_radius,
        Godot.Core.GLTFCollider.get_shape_type,
        Godot.Core.GLTFCollider.get_size,
        Godot.Core.GLTFCollider.set_array_mesh,
        Godot.Core.GLTFCollider.set_height,
        Godot.Core.GLTFCollider.set_is_trigger,
        Godot.Core.GLTFCollider.set_mesh_index,
        Godot.Core.GLTFCollider.set_radius,
        Godot.Core.GLTFCollider.set_shape_type,
        Godot.Core.GLTFCollider.set_size,
        Godot.Core.GLTFCollider.to_dictionary,
        Godot.Core.GLTFCollider.to_node)
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

instance NodeProperty GLTFCollider "array_mesh" ArrayMesh 'False
         where
        nodeProperty
          = (get_array_mesh, wrapDroppingSetter set_array_mesh, Nothing)

instance NodeProperty GLTFCollider "height" Float 'False where
        nodeProperty = (get_height, wrapDroppingSetter set_height, Nothing)

instance NodeProperty GLTFCollider "is_trigger" Bool 'False where
        nodeProperty
          = (get_is_trigger, wrapDroppingSetter set_is_trigger, Nothing)

instance NodeProperty GLTFCollider "mesh_index" Int 'False where
        nodeProperty
          = (get_mesh_index, wrapDroppingSetter set_mesh_index, Nothing)

instance NodeProperty GLTFCollider "radius" Float 'False where
        nodeProperty = (get_radius, wrapDroppingSetter set_radius, Nothing)

instance NodeProperty GLTFCollider "shape_type" GodotString 'False
         where
        nodeProperty
          = (get_shape_type, wrapDroppingSetter set_shape_type, Nothing)

instance NodeProperty GLTFCollider "size" Vector3 'False where
        nodeProperty = (get_size, wrapDroppingSetter set_size, Nothing)

{-# NOINLINE bindGLTFCollider_get_array_mesh #-}

bindGLTFCollider_get_array_mesh :: MethodBind
bindGLTFCollider_get_array_mesh
  = unsafePerformIO $
      withCString "GLTFCollider" $
        \ clsNamePtr ->
          withCString "get_array_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_array_mesh ::
                 (GLTFCollider :< cls, Object :< cls) => cls -> IO ArrayMesh
get_array_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCollider_get_array_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod GLTFCollider "get_array_mesh" '[]
           (IO ArrayMesh)
         where
        nodeMethod = Godot.Core.GLTFCollider.get_array_mesh

{-# NOINLINE bindGLTFCollider_get_height #-}

bindGLTFCollider_get_height :: MethodBind
bindGLTFCollider_get_height
  = unsafePerformIO $
      withCString "GLTFCollider" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_height ::
             (GLTFCollider :< cls, Object :< cls) => cls -> IO Float
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCollider_get_height (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCollider "get_height" '[] (IO Float) where
        nodeMethod = Godot.Core.GLTFCollider.get_height

{-# NOINLINE bindGLTFCollider_get_is_trigger #-}

bindGLTFCollider_get_is_trigger :: MethodBind
bindGLTFCollider_get_is_trigger
  = unsafePerformIO $
      withCString "GLTFCollider" $
        \ clsNamePtr ->
          withCString "get_is_trigger" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_is_trigger ::
                 (GLTFCollider :< cls, Object :< cls) => cls -> IO Bool
get_is_trigger cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCollider_get_is_trigger (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCollider "get_is_trigger" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.GLTFCollider.get_is_trigger

{-# NOINLINE bindGLTFCollider_get_mesh_index #-}

bindGLTFCollider_get_mesh_index :: MethodBind
bindGLTFCollider_get_mesh_index
  = unsafePerformIO $
      withCString "GLTFCollider" $
        \ clsNamePtr ->
          withCString "get_mesh_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mesh_index ::
                 (GLTFCollider :< cls, Object :< cls) => cls -> IO Int
get_mesh_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCollider_get_mesh_index (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCollider "get_mesh_index" '[] (IO Int)
         where
        nodeMethod = Godot.Core.GLTFCollider.get_mesh_index

{-# NOINLINE bindGLTFCollider_get_radius #-}

bindGLTFCollider_get_radius :: MethodBind
bindGLTFCollider_get_radius
  = unsafePerformIO $
      withCString "GLTFCollider" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_radius ::
             (GLTFCollider :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCollider_get_radius (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCollider "get_radius" '[] (IO Float) where
        nodeMethod = Godot.Core.GLTFCollider.get_radius

{-# NOINLINE bindGLTFCollider_get_shape_type #-}

bindGLTFCollider_get_shape_type :: MethodBind
bindGLTFCollider_get_shape_type
  = unsafePerformIO $
      withCString "GLTFCollider" $
        \ clsNamePtr ->
          withCString "get_shape_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_shape_type ::
                 (GLTFCollider :< cls, Object :< cls) => cls -> IO GodotString
get_shape_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCollider_get_shape_type (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCollider "get_shape_type" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.GLTFCollider.get_shape_type

{-# NOINLINE bindGLTFCollider_get_size #-}

bindGLTFCollider_get_size :: MethodBind
bindGLTFCollider_get_size
  = unsafePerformIO $
      withCString "GLTFCollider" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_size ::
           (GLTFCollider :< cls, Object :< cls) => cls -> IO Vector3
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCollider_get_size (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCollider "get_size" '[] (IO Vector3) where
        nodeMethod = Godot.Core.GLTFCollider.get_size

{-# NOINLINE bindGLTFCollider_set_array_mesh #-}

bindGLTFCollider_set_array_mesh :: MethodBind
bindGLTFCollider_set_array_mesh
  = unsafePerformIO $
      withCString "GLTFCollider" $
        \ clsNamePtr ->
          withCString "set_array_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_array_mesh ::
                 (GLTFCollider :< cls, Object :< cls) => cls -> ArrayMesh -> IO ()
set_array_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCollider_set_array_mesh (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCollider "set_array_mesh" '[ArrayMesh]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFCollider.set_array_mesh

{-# NOINLINE bindGLTFCollider_set_height #-}

bindGLTFCollider_set_height :: MethodBind
bindGLTFCollider_set_height
  = unsafePerformIO $
      withCString "GLTFCollider" $
        \ clsNamePtr ->
          withCString "set_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_height ::
             (GLTFCollider :< cls, Object :< cls) => cls -> Float -> IO ()
set_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCollider_set_height (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCollider "set_height" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.GLTFCollider.set_height

{-# NOINLINE bindGLTFCollider_set_is_trigger #-}

bindGLTFCollider_set_is_trigger :: MethodBind
bindGLTFCollider_set_is_trigger
  = unsafePerformIO $
      withCString "GLTFCollider" $
        \ clsNamePtr ->
          withCString "set_is_trigger" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_is_trigger ::
                 (GLTFCollider :< cls, Object :< cls) => cls -> Bool -> IO ()
set_is_trigger cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCollider_set_is_trigger (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCollider "set_is_trigger" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.GLTFCollider.set_is_trigger

{-# NOINLINE bindGLTFCollider_set_mesh_index #-}

bindGLTFCollider_set_mesh_index :: MethodBind
bindGLTFCollider_set_mesh_index
  = unsafePerformIO $
      withCString "GLTFCollider" $
        \ clsNamePtr ->
          withCString "set_mesh_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_mesh_index ::
                 (GLTFCollider :< cls, Object :< cls) => cls -> Int -> IO ()
set_mesh_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCollider_set_mesh_index (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCollider "set_mesh_index" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GLTFCollider.set_mesh_index

{-# NOINLINE bindGLTFCollider_set_radius #-}

bindGLTFCollider_set_radius :: MethodBind
bindGLTFCollider_set_radius
  = unsafePerformIO $
      withCString "GLTFCollider" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_radius ::
             (GLTFCollider :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCollider_set_radius (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCollider "set_radius" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.GLTFCollider.set_radius

{-# NOINLINE bindGLTFCollider_set_shape_type #-}

bindGLTFCollider_set_shape_type :: MethodBind
bindGLTFCollider_set_shape_type
  = unsafePerformIO $
      withCString "GLTFCollider" $
        \ clsNamePtr ->
          withCString "set_shape_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_shape_type ::
                 (GLTFCollider :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_shape_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCollider_set_shape_type (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCollider "set_shape_type" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFCollider.set_shape_type

{-# NOINLINE bindGLTFCollider_set_size #-}

bindGLTFCollider_set_size :: MethodBind
bindGLTFCollider_set_size
  = unsafePerformIO $
      withCString "GLTFCollider" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_size ::
           (GLTFCollider :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCollider_set_size (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCollider "set_size" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.GLTFCollider.set_size

{-# NOINLINE bindGLTFCollider_to_dictionary #-}

bindGLTFCollider_to_dictionary :: MethodBind
bindGLTFCollider_to_dictionary
  = unsafePerformIO $
      withCString "GLTFCollider" $
        \ clsNamePtr ->
          withCString "to_dictionary" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

to_dictionary ::
                (GLTFCollider :< cls, Object :< cls) => cls -> IO Dictionary
to_dictionary cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCollider_to_dictionary (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFCollider "to_dictionary" '[]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.GLTFCollider.to_dictionary

{-# NOINLINE bindGLTFCollider_to_node #-}

bindGLTFCollider_to_node :: MethodBind
bindGLTFCollider_to_node
  = unsafePerformIO $
      withCString "GLTFCollider" $
        \ clsNamePtr ->
          withCString "to_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

to_node ::
          (GLTFCollider :< cls, Object :< cls) =>
          cls -> Maybe Bool -> IO CollisionShape
to_node cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFCollider_to_node (upcast cls) arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod GLTFCollider "to_node" '[Maybe Bool]
           (IO CollisionShape)
         where
        nodeMethod = Godot.Core.GLTFCollider.to_node