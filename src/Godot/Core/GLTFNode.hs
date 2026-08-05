{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GLTFNode
       (Godot.Core.GLTFNode.get_camera, Godot.Core.GLTFNode.get_children,
        Godot.Core.GLTFNode.get_height, Godot.Core.GLTFNode.get_joint,
        Godot.Core.GLTFNode.get_light, Godot.Core.GLTFNode.get_mesh,
        Godot.Core.GLTFNode.get_parent, Godot.Core.GLTFNode.get_rotation,
        Godot.Core.GLTFNode.get_scale, Godot.Core.GLTFNode.get_skeleton,
        Godot.Core.GLTFNode.get_skin, Godot.Core.GLTFNode.get_translation,
        Godot.Core.GLTFNode.get_xform, Godot.Core.GLTFNode.set_camera,
        Godot.Core.GLTFNode.set_children, Godot.Core.GLTFNode.set_height,
        Godot.Core.GLTFNode.set_joint, Godot.Core.GLTFNode.set_light,
        Godot.Core.GLTFNode.set_mesh, Godot.Core.GLTFNode.set_parent,
        Godot.Core.GLTFNode.set_rotation, Godot.Core.GLTFNode.set_scale,
        Godot.Core.GLTFNode.set_skeleton, Godot.Core.GLTFNode.set_skin,
        Godot.Core.GLTFNode.set_translation, Godot.Core.GLTFNode.set_xform)
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

instance NodeProperty GLTFNode "camera" Int 'False where
        nodeProperty = (get_camera, wrapDroppingSetter set_camera, Nothing)

instance NodeProperty GLTFNode "children" PoolIntArray 'False where
        nodeProperty
          = (get_children, wrapDroppingSetter set_children, Nothing)

instance NodeProperty GLTFNode "height" Int 'False where
        nodeProperty = (get_height, wrapDroppingSetter set_height, Nothing)

instance NodeProperty GLTFNode "joint" Bool 'False where
        nodeProperty = (get_joint, wrapDroppingSetter set_joint, Nothing)

instance NodeProperty GLTFNode "light" Int 'False where
        nodeProperty = (get_light, wrapDroppingSetter set_light, Nothing)

instance NodeProperty GLTFNode "mesh" Int 'False where
        nodeProperty = (get_mesh, wrapDroppingSetter set_mesh, Nothing)

instance NodeProperty GLTFNode "parent" Int 'False where
        nodeProperty = (get_parent, wrapDroppingSetter set_parent, Nothing)

instance NodeProperty GLTFNode "rotation" Quat 'False where
        nodeProperty
          = (get_rotation, wrapDroppingSetter set_rotation, Nothing)

instance NodeProperty GLTFNode "scale" Vector3 'False where
        nodeProperty = (get_scale, wrapDroppingSetter set_scale, Nothing)

instance NodeProperty GLTFNode "skeleton" Int 'False where
        nodeProperty
          = (get_skeleton, wrapDroppingSetter set_skeleton, Nothing)

instance NodeProperty GLTFNode "skin" Int 'False where
        nodeProperty = (get_skin, wrapDroppingSetter set_skin, Nothing)

instance NodeProperty GLTFNode "translation" Vector3 'False where
        nodeProperty
          = (get_translation, wrapDroppingSetter set_translation, Nothing)

instance NodeProperty GLTFNode "xform" Transform 'False where
        nodeProperty = (get_xform, wrapDroppingSetter set_xform, Nothing)

{-# NOINLINE bindGLTFNode_get_camera #-}

bindGLTFNode_get_camera :: MethodBind
bindGLTFNode_get_camera
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "get_camera" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_camera :: (GLTFNode :< cls, Object :< cls) => cls -> IO Int
get_camera cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_get_camera (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "get_camera" '[] (IO Int) where
        nodeMethod = Godot.Core.GLTFNode.get_camera

{-# NOINLINE bindGLTFNode_get_children #-}

bindGLTFNode_get_children :: MethodBind
bindGLTFNode_get_children
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "get_children" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_children ::
               (GLTFNode :< cls, Object :< cls) => cls -> IO PoolIntArray
get_children cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_get_children (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "get_children" '[] (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.GLTFNode.get_children

{-# NOINLINE bindGLTFNode_get_height #-}

bindGLTFNode_get_height :: MethodBind
bindGLTFNode_get_height
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_height :: (GLTFNode :< cls, Object :< cls) => cls -> IO Int
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_get_height (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "get_height" '[] (IO Int) where
        nodeMethod = Godot.Core.GLTFNode.get_height

{-# NOINLINE bindGLTFNode_get_joint #-}

bindGLTFNode_get_joint :: MethodBind
bindGLTFNode_get_joint
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "get_joint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_joint :: (GLTFNode :< cls, Object :< cls) => cls -> IO Bool
get_joint cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_get_joint (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "get_joint" '[] (IO Bool) where
        nodeMethod = Godot.Core.GLTFNode.get_joint

{-# NOINLINE bindGLTFNode_get_light #-}

bindGLTFNode_get_light :: MethodBind
bindGLTFNode_get_light
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "get_light" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_light :: (GLTFNode :< cls, Object :< cls) => cls -> IO Int
get_light cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_get_light (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "get_light" '[] (IO Int) where
        nodeMethod = Godot.Core.GLTFNode.get_light

{-# NOINLINE bindGLTFNode_get_mesh #-}

bindGLTFNode_get_mesh :: MethodBind
bindGLTFNode_get_mesh
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mesh :: (GLTFNode :< cls, Object :< cls) => cls -> IO Int
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_get_mesh (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "get_mesh" '[] (IO Int) where
        nodeMethod = Godot.Core.GLTFNode.get_mesh

{-# NOINLINE bindGLTFNode_get_parent #-}

bindGLTFNode_get_parent :: MethodBind
bindGLTFNode_get_parent
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "get_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_parent :: (GLTFNode :< cls, Object :< cls) => cls -> IO Int
get_parent cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_get_parent (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "get_parent" '[] (IO Int) where
        nodeMethod = Godot.Core.GLTFNode.get_parent

{-# NOINLINE bindGLTFNode_get_rotation #-}

bindGLTFNode_get_rotation :: MethodBind
bindGLTFNode_get_rotation
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "get_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_rotation :: (GLTFNode :< cls, Object :< cls) => cls -> IO Quat
get_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_get_rotation (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "get_rotation" '[] (IO Quat) where
        nodeMethod = Godot.Core.GLTFNode.get_rotation

{-# NOINLINE bindGLTFNode_get_scale #-}

bindGLTFNode_get_scale :: MethodBind
bindGLTFNode_get_scale
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "get_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_scale :: (GLTFNode :< cls, Object :< cls) => cls -> IO Vector3
get_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_get_scale (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "get_scale" '[] (IO Vector3) where
        nodeMethod = Godot.Core.GLTFNode.get_scale

{-# NOINLINE bindGLTFNode_get_skeleton #-}

bindGLTFNode_get_skeleton :: MethodBind
bindGLTFNode_get_skeleton
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "get_skeleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_skeleton :: (GLTFNode :< cls, Object :< cls) => cls -> IO Int
get_skeleton cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_get_skeleton (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "get_skeleton" '[] (IO Int) where
        nodeMethod = Godot.Core.GLTFNode.get_skeleton

{-# NOINLINE bindGLTFNode_get_skin #-}

bindGLTFNode_get_skin :: MethodBind
bindGLTFNode_get_skin
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "get_skin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_skin :: (GLTFNode :< cls, Object :< cls) => cls -> IO Int
get_skin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_get_skin (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "get_skin" '[] (IO Int) where
        nodeMethod = Godot.Core.GLTFNode.get_skin

{-# NOINLINE bindGLTFNode_get_translation #-}

bindGLTFNode_get_translation :: MethodBind
bindGLTFNode_get_translation
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "get_translation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_translation ::
                  (GLTFNode :< cls, Object :< cls) => cls -> IO Vector3
get_translation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_get_translation (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "get_translation" '[] (IO Vector3)
         where
        nodeMethod = Godot.Core.GLTFNode.get_translation

{-# NOINLINE bindGLTFNode_get_xform #-}

bindGLTFNode_get_xform :: MethodBind
bindGLTFNode_get_xform
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "get_xform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_xform ::
            (GLTFNode :< cls, Object :< cls) => cls -> IO Transform
get_xform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_get_xform (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "get_xform" '[] (IO Transform) where
        nodeMethod = Godot.Core.GLTFNode.get_xform

{-# NOINLINE bindGLTFNode_set_camera #-}

bindGLTFNode_set_camera :: MethodBind
bindGLTFNode_set_camera
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "set_camera" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_camera ::
             (GLTFNode :< cls, Object :< cls) => cls -> Int -> IO ()
set_camera cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_set_camera (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "set_camera" '[Int] (IO ()) where
        nodeMethod = Godot.Core.GLTFNode.set_camera

{-# NOINLINE bindGLTFNode_set_children #-}

bindGLTFNode_set_children :: MethodBind
bindGLTFNode_set_children
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "set_children" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_children ::
               (GLTFNode :< cls, Object :< cls) => cls -> PoolIntArray -> IO ()
set_children cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_set_children (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "set_children" '[PoolIntArray] (IO ())
         where
        nodeMethod = Godot.Core.GLTFNode.set_children

{-# NOINLINE bindGLTFNode_set_height #-}

bindGLTFNode_set_height :: MethodBind
bindGLTFNode_set_height
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "set_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_height ::
             (GLTFNode :< cls, Object :< cls) => cls -> Int -> IO ()
set_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_set_height (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "set_height" '[Int] (IO ()) where
        nodeMethod = Godot.Core.GLTFNode.set_height

{-# NOINLINE bindGLTFNode_set_joint #-}

bindGLTFNode_set_joint :: MethodBind
bindGLTFNode_set_joint
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "set_joint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_joint ::
            (GLTFNode :< cls, Object :< cls) => cls -> Bool -> IO ()
set_joint cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_set_joint (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "set_joint" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.GLTFNode.set_joint

{-# NOINLINE bindGLTFNode_set_light #-}

bindGLTFNode_set_light :: MethodBind
bindGLTFNode_set_light
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "set_light" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_light ::
            (GLTFNode :< cls, Object :< cls) => cls -> Int -> IO ()
set_light cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_set_light (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "set_light" '[Int] (IO ()) where
        nodeMethod = Godot.Core.GLTFNode.set_light

{-# NOINLINE bindGLTFNode_set_mesh #-}

bindGLTFNode_set_mesh :: MethodBind
bindGLTFNode_set_mesh
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "set_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_mesh :: (GLTFNode :< cls, Object :< cls) => cls -> Int -> IO ()
set_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_set_mesh (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "set_mesh" '[Int] (IO ()) where
        nodeMethod = Godot.Core.GLTFNode.set_mesh

{-# NOINLINE bindGLTFNode_set_parent #-}

bindGLTFNode_set_parent :: MethodBind
bindGLTFNode_set_parent
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "set_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_parent ::
             (GLTFNode :< cls, Object :< cls) => cls -> Int -> IO ()
set_parent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_set_parent (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "set_parent" '[Int] (IO ()) where
        nodeMethod = Godot.Core.GLTFNode.set_parent

{-# NOINLINE bindGLTFNode_set_rotation #-}

bindGLTFNode_set_rotation :: MethodBind
bindGLTFNode_set_rotation
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "set_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_rotation ::
               (GLTFNode :< cls, Object :< cls) => cls -> Quat -> IO ()
set_rotation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_set_rotation (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "set_rotation" '[Quat] (IO ()) where
        nodeMethod = Godot.Core.GLTFNode.set_rotation

{-# NOINLINE bindGLTFNode_set_scale #-}

bindGLTFNode_set_scale :: MethodBind
bindGLTFNode_set_scale
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "set_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_scale ::
            (GLTFNode :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_set_scale (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "set_scale" '[Vector3] (IO ()) where
        nodeMethod = Godot.Core.GLTFNode.set_scale

{-# NOINLINE bindGLTFNode_set_skeleton #-}

bindGLTFNode_set_skeleton :: MethodBind
bindGLTFNode_set_skeleton
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "set_skeleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_skeleton ::
               (GLTFNode :< cls, Object :< cls) => cls -> Int -> IO ()
set_skeleton cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_set_skeleton (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "set_skeleton" '[Int] (IO ()) where
        nodeMethod = Godot.Core.GLTFNode.set_skeleton

{-# NOINLINE bindGLTFNode_set_skin #-}

bindGLTFNode_set_skin :: MethodBind
bindGLTFNode_set_skin
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "set_skin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_skin :: (GLTFNode :< cls, Object :< cls) => cls -> Int -> IO ()
set_skin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_set_skin (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "set_skin" '[Int] (IO ()) where
        nodeMethod = Godot.Core.GLTFNode.set_skin

{-# NOINLINE bindGLTFNode_set_translation #-}

bindGLTFNode_set_translation :: MethodBind
bindGLTFNode_set_translation
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "set_translation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_translation ::
                  (GLTFNode :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_translation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_set_translation (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "set_translation" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.GLTFNode.set_translation

{-# NOINLINE bindGLTFNode_set_xform #-}

bindGLTFNode_set_xform :: MethodBind
bindGLTFNode_set_xform
  = unsafePerformIO $
      withCString "GLTFNode" $
        \ clsNamePtr ->
          withCString "set_xform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_xform ::
            (GLTFNode :< cls, Object :< cls) => cls -> Transform -> IO ()
set_xform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFNode_set_xform (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFNode "set_xform" '[Transform] (IO ()) where
        nodeMethod = Godot.Core.GLTFNode.set_xform