{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GLTFSkin
       (Godot.Core.GLTFSkin.get_godot_skin,
        Godot.Core.GLTFSkin.get_inverse_binds,
        Godot.Core.GLTFSkin.get_joint_i_to_bone_i,
        Godot.Core.GLTFSkin.get_joint_i_to_name,
        Godot.Core.GLTFSkin.get_joints,
        Godot.Core.GLTFSkin.get_joints_original,
        Godot.Core.GLTFSkin.get_non_joints, Godot.Core.GLTFSkin.get_roots,
        Godot.Core.GLTFSkin.get_skeleton,
        Godot.Core.GLTFSkin.get_skin_root,
        Godot.Core.GLTFSkin.set_godot_skin,
        Godot.Core.GLTFSkin.set_inverse_binds,
        Godot.Core.GLTFSkin.set_joint_i_to_bone_i,
        Godot.Core.GLTFSkin.set_joint_i_to_name,
        Godot.Core.GLTFSkin.set_joints,
        Godot.Core.GLTFSkin.set_joints_original,
        Godot.Core.GLTFSkin.set_non_joints, Godot.Core.GLTFSkin.set_roots,
        Godot.Core.GLTFSkin.set_skeleton,
        Godot.Core.GLTFSkin.set_skin_root)
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

instance NodeProperty GLTFSkin "godot_skin" Skin 'False where
        nodeProperty
          = (get_godot_skin, wrapDroppingSetter set_godot_skin, Nothing)

instance NodeProperty GLTFSkin "inverse_binds" Array 'False where
        nodeProperty
          = (get_inverse_binds, wrapDroppingSetter set_inverse_binds,
             Nothing)

instance NodeProperty GLTFSkin "joint_i_to_bone_i" Dictionary
           'False
         where
        nodeProperty
          = (get_joint_i_to_bone_i, wrapDroppingSetter set_joint_i_to_bone_i,
             Nothing)

instance NodeProperty GLTFSkin "joint_i_to_name" Dictionary 'False
         where
        nodeProperty
          = (get_joint_i_to_name, wrapDroppingSetter set_joint_i_to_name,
             Nothing)

instance NodeProperty GLTFSkin "joints" PoolIntArray 'False where
        nodeProperty = (get_joints, wrapDroppingSetter set_joints, Nothing)

instance NodeProperty GLTFSkin "joints_original" PoolIntArray
           'False
         where
        nodeProperty
          = (get_joints_original, wrapDroppingSetter set_joints_original,
             Nothing)

instance NodeProperty GLTFSkin "non_joints" PoolIntArray 'False
         where
        nodeProperty
          = (get_non_joints, wrapDroppingSetter set_non_joints, Nothing)

instance NodeProperty GLTFSkin "roots" PoolIntArray 'False where
        nodeProperty = (get_roots, wrapDroppingSetter set_roots, Nothing)

instance NodeProperty GLTFSkin "skeleton" Int 'False where
        nodeProperty
          = (get_skeleton, wrapDroppingSetter set_skeleton, Nothing)

instance NodeProperty GLTFSkin "skin_root" Int 'False where
        nodeProperty
          = (get_skin_root, wrapDroppingSetter set_skin_root, Nothing)

{-# NOINLINE bindGLTFSkin_get_godot_skin #-}

bindGLTFSkin_get_godot_skin :: MethodBind
bindGLTFSkin_get_godot_skin
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "get_godot_skin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_godot_skin ::
                 (GLTFSkin :< cls, Object :< cls) => cls -> IO Skin
get_godot_skin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_get_godot_skin (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod GLTFSkin "get_godot_skin" '[] (IO Skin) where
        nodeMethod = Godot.Core.GLTFSkin.get_godot_skin

{-# NOINLINE bindGLTFSkin_get_inverse_binds #-}

bindGLTFSkin_get_inverse_binds :: MethodBind
bindGLTFSkin_get_inverse_binds
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "get_inverse_binds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_inverse_binds ::
                    (GLTFSkin :< cls, Object :< cls) => cls -> IO Array
get_inverse_binds cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_get_inverse_binds (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "get_inverse_binds" '[] (IO Array)
         where
        nodeMethod = Godot.Core.GLTFSkin.get_inverse_binds

{-# NOINLINE bindGLTFSkin_get_joint_i_to_bone_i #-}

bindGLTFSkin_get_joint_i_to_bone_i :: MethodBind
bindGLTFSkin_get_joint_i_to_bone_i
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "get_joint_i_to_bone_i" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_joint_i_to_bone_i ::
                        (GLTFSkin :< cls, Object :< cls) => cls -> IO Dictionary
get_joint_i_to_bone_i cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_get_joint_i_to_bone_i
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "get_joint_i_to_bone_i" '[]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.GLTFSkin.get_joint_i_to_bone_i

{-# NOINLINE bindGLTFSkin_get_joint_i_to_name #-}

bindGLTFSkin_get_joint_i_to_name :: MethodBind
bindGLTFSkin_get_joint_i_to_name
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "get_joint_i_to_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_joint_i_to_name ::
                      (GLTFSkin :< cls, Object :< cls) => cls -> IO Dictionary
get_joint_i_to_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_get_joint_i_to_name
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "get_joint_i_to_name" '[]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.GLTFSkin.get_joint_i_to_name

{-# NOINLINE bindGLTFSkin_get_joints #-}

bindGLTFSkin_get_joints :: MethodBind
bindGLTFSkin_get_joints
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "get_joints" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_joints ::
             (GLTFSkin :< cls, Object :< cls) => cls -> IO PoolIntArray
get_joints cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_get_joints (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "get_joints" '[] (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.GLTFSkin.get_joints

{-# NOINLINE bindGLTFSkin_get_joints_original #-}

bindGLTFSkin_get_joints_original :: MethodBind
bindGLTFSkin_get_joints_original
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "get_joints_original" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_joints_original ::
                      (GLTFSkin :< cls, Object :< cls) => cls -> IO PoolIntArray
get_joints_original cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_get_joints_original
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "get_joints_original" '[]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.GLTFSkin.get_joints_original

{-# NOINLINE bindGLTFSkin_get_non_joints #-}

bindGLTFSkin_get_non_joints :: MethodBind
bindGLTFSkin_get_non_joints
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "get_non_joints" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_non_joints ::
                 (GLTFSkin :< cls, Object :< cls) => cls -> IO PoolIntArray
get_non_joints cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_get_non_joints (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "get_non_joints" '[] (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.GLTFSkin.get_non_joints

{-# NOINLINE bindGLTFSkin_get_roots #-}

bindGLTFSkin_get_roots :: MethodBind
bindGLTFSkin_get_roots
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "get_roots" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_roots ::
            (GLTFSkin :< cls, Object :< cls) => cls -> IO PoolIntArray
get_roots cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_get_roots (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "get_roots" '[] (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.GLTFSkin.get_roots

{-# NOINLINE bindGLTFSkin_get_skeleton #-}

bindGLTFSkin_get_skeleton :: MethodBind
bindGLTFSkin_get_skeleton
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "get_skeleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_skeleton :: (GLTFSkin :< cls, Object :< cls) => cls -> IO Int
get_skeleton cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_get_skeleton (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "get_skeleton" '[] (IO Int) where
        nodeMethod = Godot.Core.GLTFSkin.get_skeleton

{-# NOINLINE bindGLTFSkin_get_skin_root #-}

bindGLTFSkin_get_skin_root :: MethodBind
bindGLTFSkin_get_skin_root
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "get_skin_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_skin_root :: (GLTFSkin :< cls, Object :< cls) => cls -> IO Int
get_skin_root cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_get_skin_root (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "get_skin_root" '[] (IO Int) where
        nodeMethod = Godot.Core.GLTFSkin.get_skin_root

{-# NOINLINE bindGLTFSkin_set_godot_skin #-}

bindGLTFSkin_set_godot_skin :: MethodBind
bindGLTFSkin_set_godot_skin
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "set_godot_skin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_godot_skin ::
                 (GLTFSkin :< cls, Object :< cls) => cls -> Skin -> IO ()
set_godot_skin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_set_godot_skin (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "set_godot_skin" '[Skin] (IO ()) where
        nodeMethod = Godot.Core.GLTFSkin.set_godot_skin

{-# NOINLINE bindGLTFSkin_set_inverse_binds #-}

bindGLTFSkin_set_inverse_binds :: MethodBind
bindGLTFSkin_set_inverse_binds
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "set_inverse_binds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_inverse_binds ::
                    (GLTFSkin :< cls, Object :< cls) => cls -> Array -> IO ()
set_inverse_binds cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_set_inverse_binds (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "set_inverse_binds" '[Array] (IO ())
         where
        nodeMethod = Godot.Core.GLTFSkin.set_inverse_binds

{-# NOINLINE bindGLTFSkin_set_joint_i_to_bone_i #-}

bindGLTFSkin_set_joint_i_to_bone_i :: MethodBind
bindGLTFSkin_set_joint_i_to_bone_i
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "set_joint_i_to_bone_i" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_joint_i_to_bone_i ::
                        (GLTFSkin :< cls, Object :< cls) => cls -> Dictionary -> IO ()
set_joint_i_to_bone_i cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_set_joint_i_to_bone_i
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "set_joint_i_to_bone_i" '[Dictionary]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFSkin.set_joint_i_to_bone_i

{-# NOINLINE bindGLTFSkin_set_joint_i_to_name #-}

bindGLTFSkin_set_joint_i_to_name :: MethodBind
bindGLTFSkin_set_joint_i_to_name
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "set_joint_i_to_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_joint_i_to_name ::
                      (GLTFSkin :< cls, Object :< cls) => cls -> Dictionary -> IO ()
set_joint_i_to_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_set_joint_i_to_name
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "set_joint_i_to_name" '[Dictionary]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFSkin.set_joint_i_to_name

{-# NOINLINE bindGLTFSkin_set_joints #-}

bindGLTFSkin_set_joints :: MethodBind
bindGLTFSkin_set_joints
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "set_joints" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_joints ::
             (GLTFSkin :< cls, Object :< cls) => cls -> PoolIntArray -> IO ()
set_joints cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_set_joints (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "set_joints" '[PoolIntArray] (IO ())
         where
        nodeMethod = Godot.Core.GLTFSkin.set_joints

{-# NOINLINE bindGLTFSkin_set_joints_original #-}

bindGLTFSkin_set_joints_original :: MethodBind
bindGLTFSkin_set_joints_original
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "set_joints_original" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_joints_original ::
                      (GLTFSkin :< cls, Object :< cls) => cls -> PoolIntArray -> IO ()
set_joints_original cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_set_joints_original
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "set_joints_original" '[PoolIntArray]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFSkin.set_joints_original

{-# NOINLINE bindGLTFSkin_set_non_joints #-}

bindGLTFSkin_set_non_joints :: MethodBind
bindGLTFSkin_set_non_joints
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "set_non_joints" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_non_joints ::
                 (GLTFSkin :< cls, Object :< cls) => cls -> PoolIntArray -> IO ()
set_non_joints cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_set_non_joints (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "set_non_joints" '[PoolIntArray]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFSkin.set_non_joints

{-# NOINLINE bindGLTFSkin_set_roots #-}

bindGLTFSkin_set_roots :: MethodBind
bindGLTFSkin_set_roots
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "set_roots" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_roots ::
            (GLTFSkin :< cls, Object :< cls) => cls -> PoolIntArray -> IO ()
set_roots cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_set_roots (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "set_roots" '[PoolIntArray] (IO ())
         where
        nodeMethod = Godot.Core.GLTFSkin.set_roots

{-# NOINLINE bindGLTFSkin_set_skeleton #-}

bindGLTFSkin_set_skeleton :: MethodBind
bindGLTFSkin_set_skeleton
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "set_skeleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_skeleton ::
               (GLTFSkin :< cls, Object :< cls) => cls -> Int -> IO ()
set_skeleton cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_set_skeleton (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "set_skeleton" '[Int] (IO ()) where
        nodeMethod = Godot.Core.GLTFSkin.set_skeleton

{-# NOINLINE bindGLTFSkin_set_skin_root #-}

bindGLTFSkin_set_skin_root :: MethodBind
bindGLTFSkin_set_skin_root
  = unsafePerformIO $
      withCString "GLTFSkin" $
        \ clsNamePtr ->
          withCString "set_skin_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_skin_root ::
                (GLTFSkin :< cls, Object :< cls) => cls -> Int -> IO ()
set_skin_root cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFSkin_set_skin_root (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFSkin "set_skin_root" '[Int] (IO ()) where
        nodeMethod = Godot.Core.GLTFSkin.set_skin_root