{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PackedSceneGLTF
       (Godot.Core.PackedSceneGLTF.export_gltf,
        Godot.Core.PackedSceneGLTF.import_gltf_scene,
        Godot.Core.PackedSceneGLTF.pack_gltf)
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
import Godot.Core.PackedScene()

{-# NOINLINE bindPackedSceneGLTF_export_gltf #-}

bindPackedSceneGLTF_export_gltf :: MethodBind
bindPackedSceneGLTF_export_gltf
  = unsafePerformIO $
      withCString "PackedSceneGLTF" $
        \ clsNamePtr ->
          withCString "export_gltf" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

export_gltf ::
              (PackedSceneGLTF :< cls, Object :< cls) =>
              cls -> Node -> GodotString -> Maybe Int -> Maybe Float -> IO Int
export_gltf cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (0)) toVariant arg3,
       maybe (VariantReal (1000)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedSceneGLTF_export_gltf (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PackedSceneGLTF "export_gltf"
           '[Node, GodotString, Maybe Int, Maybe Float]
           (IO Int)
         where
        nodeMethod = Godot.Core.PackedSceneGLTF.export_gltf

{-# NOINLINE bindPackedSceneGLTF_import_gltf_scene #-}

bindPackedSceneGLTF_import_gltf_scene :: MethodBind
bindPackedSceneGLTF_import_gltf_scene
  = unsafePerformIO $
      withCString "PackedSceneGLTF" $
        \ clsNamePtr ->
          withCString "import_gltf_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

import_gltf_scene ::
                    (PackedSceneGLTF :< cls, Object :< cls) =>
                    cls ->
                      GodotString ->
                        Maybe Int -> Maybe Float -> Maybe Int -> Maybe GLTFState -> IO Node
import_gltf_scene cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (0)) toVariant arg2,
       maybe (VariantReal (1000)) toVariant arg3,
       maybe (VariantInt (2194432)) toVariant arg4,
       maybe VariantNil toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedSceneGLTF_import_gltf_scene
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod PackedSceneGLTF "import_gltf_scene"
           '[GodotString, Maybe Int, Maybe Float, Maybe Int, Maybe GLTFState]
           (IO Node)
         where
        nodeMethod = Godot.Core.PackedSceneGLTF.import_gltf_scene

{-# NOINLINE bindPackedSceneGLTF_pack_gltf #-}

bindPackedSceneGLTF_pack_gltf :: MethodBind
bindPackedSceneGLTF_pack_gltf
  = unsafePerformIO $
      withCString "PackedSceneGLTF" $
        \ clsNamePtr ->
          withCString "pack_gltf" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

pack_gltf ::
            (PackedSceneGLTF :< cls, Object :< cls) =>
            cls ->
              GodotString ->
                Maybe Int -> Maybe Float -> Maybe Int -> Maybe GLTFState -> IO ()
pack_gltf cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (0)) toVariant arg2,
       maybe (VariantReal (1000)) toVariant arg3,
       maybe (VariantInt (2194432)) toVariant arg4,
       maybe VariantNil toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedSceneGLTF_pack_gltf (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PackedSceneGLTF "pack_gltf"
           '[GodotString, Maybe Int, Maybe Float, Maybe Int, Maybe GLTFState]
           (IO ())
         where
        nodeMethod = Godot.Core.PackedSceneGLTF.pack_gltf