{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.GLTFMesh
       (Godot.Tools.GLTFMesh.get_blend_weights,
        Godot.Tools.GLTFMesh.get_mesh,
        Godot.Tools.GLTFMesh.set_blend_weights,
        Godot.Tools.GLTFMesh.set_mesh)
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

instance NodeProperty GLTFMesh "blend_weights" PoolRealArray 'False
         where
        nodeProperty
          = (get_blend_weights, wrapDroppingSetter set_blend_weights,
             Nothing)

instance NodeProperty GLTFMesh "mesh" ArrayMesh 'False where
        nodeProperty = (get_mesh, wrapDroppingSetter set_mesh, Nothing)

{-# NOINLINE bindGLTFMesh_get_blend_weights #-}

bindGLTFMesh_get_blend_weights :: MethodBind
bindGLTFMesh_get_blend_weights
  = unsafePerformIO $
      withCString "GLTFMesh" $
        \ clsNamePtr ->
          withCString "get_blend_weights" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_blend_weights ::
                    (GLTFMesh :< cls, Object :< cls) => cls -> IO PoolRealArray
get_blend_weights cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFMesh_get_blend_weights (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFMesh "get_blend_weights" '[]
           (IO PoolRealArray)
         where
        nodeMethod = Godot.Tools.GLTFMesh.get_blend_weights

{-# NOINLINE bindGLTFMesh_get_mesh #-}

bindGLTFMesh_get_mesh :: MethodBind
bindGLTFMesh_get_mesh
  = unsafePerformIO $
      withCString "GLTFMesh" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mesh :: (GLTFMesh :< cls, Object :< cls) => cls -> IO ArrayMesh
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFMesh_get_mesh (upcast cls) arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod GLTFMesh "get_mesh" '[] (IO ArrayMesh) where
        nodeMethod = Godot.Tools.GLTFMesh.get_mesh

{-# NOINLINE bindGLTFMesh_set_blend_weights #-}

bindGLTFMesh_set_blend_weights :: MethodBind
bindGLTFMesh_set_blend_weights
  = unsafePerformIO $
      withCString "GLTFMesh" $
        \ clsNamePtr ->
          withCString "set_blend_weights" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_blend_weights ::
                    (GLTFMesh :< cls, Object :< cls) => cls -> PoolRealArray -> IO ()
set_blend_weights cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFMesh_set_blend_weights (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFMesh "set_blend_weights" '[PoolRealArray]
           (IO ())
         where
        nodeMethod = Godot.Tools.GLTFMesh.set_blend_weights

{-# NOINLINE bindGLTFMesh_set_mesh #-}

bindGLTFMesh_set_mesh :: MethodBind
bindGLTFMesh_set_mesh
  = unsafePerformIO $
      withCString "GLTFMesh" $
        \ clsNamePtr ->
          withCString "set_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_mesh ::
           (GLTFMesh :< cls, Object :< cls) => cls -> ArrayMesh -> IO ()
set_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFMesh_set_mesh (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFMesh "set_mesh" '[ArrayMesh] (IO ()) where
        nodeMethod = Godot.Tools.GLTFMesh.set_mesh