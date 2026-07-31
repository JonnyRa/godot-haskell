{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GLTFSkeleton
       (Godot.Core.GLTFSkeleton.get_bone_attachment,
        Godot.Core.GLTFSkeleton.get_bone_attachment_count,
        Godot.Core.GLTFSkeleton.get_godot_bone_node,
        Godot.Core.GLTFSkeleton.get_godot_skeleton,
        Godot.Core.GLTFSkeleton.get_joints,
        Godot.Core.GLTFSkeleton.get_roots,
        Godot.Core.GLTFSkeleton.get_unique_names,
        Godot.Core.GLTFSkeleton.set_godot_bone_node,
        Godot.Core.GLTFSkeleton.set_joints,
        Godot.Core.GLTFSkeleton.set_roots,
        Godot.Core.GLTFSkeleton.set_unique_names)
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

instance NodeProperty GLTFSkeleton "godot_bone_node" Dictionary
           'False
         where
        nodeProperty
          = (get_godot_bone_node, wrapDroppingSetter set_godot_bone_node,
             Nothing)

instance NodeProperty GLTFSkeleton "joints" PoolIntArray 'False
         where
        nodeProperty = (get_joints, wrapDroppingSetter set_joints, Nothing)

instance NodeProperty GLTFSkeleton "roots" PoolIntArray 'False
         where
        nodeProperty = (get_roots, wrapDroppingSetter set_roots, Nothing)

instance NodeProperty GLTFSkeleton "unique_names" Array 'False
         where
        nodeProperty
          = (get_unique_names, wrapDroppingSetter set_unique_names, Nothing)

{-# NOINLINE bindGLTFSkeleton_get_bone_attachment #-}

bindGLTFSkeleton_get_bone_attachment :: MethodBind
bindGLTFSkeleton_get_bone_attachment
  = unsafePerformIO $
      withCString "GLTFSkeleton" $
        \ clsNamePtr ->
          withCString "get_bone_attachment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bone_attachment ::
                      (GLTFSkeleton :< cls, Object :< cls) =>
                      cls -> Int -> IO BoneAttachment
get_bone_attachment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkeleton_get_bone_attachment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod GLTFSkeleton "get_bone_attachment" '[Int]
           (IO BoneAttachment)
         where
        nodeMethod = Godot.Core.GLTFSkeleton.get_bone_attachment

{-# NOINLINE bindGLTFSkeleton_get_bone_attachment_count #-}

bindGLTFSkeleton_get_bone_attachment_count :: MethodBind
bindGLTFSkeleton_get_bone_attachment_count
  = unsafePerformIO $
      withCString "GLTFSkeleton" $
        \ clsNamePtr ->
          withCString "get_bone_attachment_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bone_attachment_count ::
                            (GLTFSkeleton :< cls, Object :< cls) => cls -> IO Int
get_bone_attachment_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkeleton_get_bone_attachment_count
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkeleton "get_bone_attachment_count" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.GLTFSkeleton.get_bone_attachment_count

{-# NOINLINE bindGLTFSkeleton_get_godot_bone_node #-}

bindGLTFSkeleton_get_godot_bone_node :: MethodBind
bindGLTFSkeleton_get_godot_bone_node
  = unsafePerformIO $
      withCString "GLTFSkeleton" $
        \ clsNamePtr ->
          withCString "get_godot_bone_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_godot_bone_node ::
                      (GLTFSkeleton :< cls, Object :< cls) => cls -> IO Dictionary
get_godot_bone_node cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkeleton_get_godot_bone_node
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkeleton "get_godot_bone_node" '[]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.GLTFSkeleton.get_godot_bone_node

{-# NOINLINE bindGLTFSkeleton_get_godot_skeleton #-}

bindGLTFSkeleton_get_godot_skeleton :: MethodBind
bindGLTFSkeleton_get_godot_skeleton
  = unsafePerformIO $
      withCString "GLTFSkeleton" $
        \ clsNamePtr ->
          withCString "get_godot_skeleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_godot_skeleton ::
                     (GLTFSkeleton :< cls, Object :< cls) => cls -> IO Skeleton
get_godot_skeleton cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkeleton_get_godot_skeleton
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod GLTFSkeleton "get_godot_skeleton" '[]
           (IO Skeleton)
         where
        nodeMethod = Godot.Core.GLTFSkeleton.get_godot_skeleton

{-# NOINLINE bindGLTFSkeleton_get_joints #-}

bindGLTFSkeleton_get_joints :: MethodBind
bindGLTFSkeleton_get_joints
  = unsafePerformIO $
      withCString "GLTFSkeleton" $
        \ clsNamePtr ->
          withCString "get_joints" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_joints ::
             (GLTFSkeleton :< cls, Object :< cls) => cls -> IO PoolIntArray
get_joints cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkeleton_get_joints (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkeleton "get_joints" '[] (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.GLTFSkeleton.get_joints

{-# NOINLINE bindGLTFSkeleton_get_roots #-}

bindGLTFSkeleton_get_roots :: MethodBind
bindGLTFSkeleton_get_roots
  = unsafePerformIO $
      withCString "GLTFSkeleton" $
        \ clsNamePtr ->
          withCString "get_roots" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_roots ::
            (GLTFSkeleton :< cls, Object :< cls) => cls -> IO PoolIntArray
get_roots cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkeleton_get_roots (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkeleton "get_roots" '[] (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.GLTFSkeleton.get_roots

{-# NOINLINE bindGLTFSkeleton_get_unique_names #-}

bindGLTFSkeleton_get_unique_names :: MethodBind
bindGLTFSkeleton_get_unique_names
  = unsafePerformIO $
      withCString "GLTFSkeleton" $
        \ clsNamePtr ->
          withCString "get_unique_names" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_unique_names ::
                   (GLTFSkeleton :< cls, Object :< cls) => cls -> IO Array
get_unique_names cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkeleton_get_unique_names
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkeleton "get_unique_names" '[] (IO Array)
         where
        nodeMethod = Godot.Core.GLTFSkeleton.get_unique_names

{-# NOINLINE bindGLTFSkeleton_set_godot_bone_node #-}

bindGLTFSkeleton_set_godot_bone_node :: MethodBind
bindGLTFSkeleton_set_godot_bone_node
  = unsafePerformIO $
      withCString "GLTFSkeleton" $
        \ clsNamePtr ->
          withCString "set_godot_bone_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_godot_bone_node ::
                      (GLTFSkeleton :< cls, Object :< cls) => cls -> Dictionary -> IO ()
set_godot_bone_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkeleton_set_godot_bone_node
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkeleton "set_godot_bone_node"
           '[Dictionary]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFSkeleton.set_godot_bone_node

{-# NOINLINE bindGLTFSkeleton_set_joints #-}

bindGLTFSkeleton_set_joints :: MethodBind
bindGLTFSkeleton_set_joints
  = unsafePerformIO $
      withCString "GLTFSkeleton" $
        \ clsNamePtr ->
          withCString "set_joints" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_joints ::
             (GLTFSkeleton :< cls, Object :< cls) =>
             cls -> PoolIntArray -> IO ()
set_joints cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkeleton_set_joints (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkeleton "set_joints" '[PoolIntArray]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFSkeleton.set_joints

{-# NOINLINE bindGLTFSkeleton_set_roots #-}

bindGLTFSkeleton_set_roots :: MethodBind
bindGLTFSkeleton_set_roots
  = unsafePerformIO $
      withCString "GLTFSkeleton" $
        \ clsNamePtr ->
          withCString "set_roots" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_roots ::
            (GLTFSkeleton :< cls, Object :< cls) =>
            cls -> PoolIntArray -> IO ()
set_roots cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkeleton_set_roots (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkeleton "set_roots" '[PoolIntArray]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFSkeleton.set_roots

{-# NOINLINE bindGLTFSkeleton_set_unique_names #-}

bindGLTFSkeleton_set_unique_names :: MethodBind
bindGLTFSkeleton_set_unique_names
  = unsafePerformIO $
      withCString "GLTFSkeleton" $
        \ clsNamePtr ->
          withCString "set_unique_names" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_unique_names ::
                   (GLTFSkeleton :< cls, Object :< cls) => cls -> Array -> IO ()
set_unique_names cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkeleton_set_unique_names
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkeleton "set_unique_names" '[Array]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFSkeleton.set_unique_names