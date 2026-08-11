{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GLTFState
       (Godot.Core.GLTFState.add_used_extension,
        Godot.Core.GLTFState.get_accessors,
        Godot.Core.GLTFState.get_additional_data,
        Godot.Core.GLTFState.get_animation_player,
        Godot.Core.GLTFState.get_animation_players_count,
        Godot.Core.GLTFState.get_animations,
        Godot.Core.GLTFState.get_buffer_views,
        Godot.Core.GLTFState.get_buffers, Godot.Core.GLTFState.get_cameras,
        Godot.Core.GLTFState.get_create_animations,
        Godot.Core.GLTFState.get_glb_data, Godot.Core.GLTFState.get_images,
        Godot.Core.GLTFState.get_json, Godot.Core.GLTFState.get_lights,
        Godot.Core.GLTFState.get_major_version,
        Godot.Core.GLTFState.get_materials,
        Godot.Core.GLTFState.get_meshes,
        Godot.Core.GLTFState.get_minor_version,
        Godot.Core.GLTFState.get_nodes,
        Godot.Core.GLTFState.get_root_nodes,
        Godot.Core.GLTFState.get_scene_name,
        Godot.Core.GLTFState.get_scene_node,
        Godot.Core.GLTFState.get_skeleton_to_node,
        Godot.Core.GLTFState.get_skeletons, Godot.Core.GLTFState.get_skins,
        Godot.Core.GLTFState.get_texture_samplers,
        Godot.Core.GLTFState.get_textures,
        Godot.Core.GLTFState.get_unique_animation_names,
        Godot.Core.GLTFState.get_unique_names,
        Godot.Core.GLTFState.get_use_named_skin_binds,
        Godot.Core.GLTFState.set_accessors,
        Godot.Core.GLTFState.set_additional_data,
        Godot.Core.GLTFState.set_animations,
        Godot.Core.GLTFState.set_buffer_views,
        Godot.Core.GLTFState.set_buffers, Godot.Core.GLTFState.set_cameras,
        Godot.Core.GLTFState.set_create_animations,
        Godot.Core.GLTFState.set_glb_data, Godot.Core.GLTFState.set_images,
        Godot.Core.GLTFState.set_json, Godot.Core.GLTFState.set_lights,
        Godot.Core.GLTFState.set_major_version,
        Godot.Core.GLTFState.set_materials,
        Godot.Core.GLTFState.set_meshes,
        Godot.Core.GLTFState.set_minor_version,
        Godot.Core.GLTFState.set_nodes,
        Godot.Core.GLTFState.set_root_nodes,
        Godot.Core.GLTFState.set_scene_name,
        Godot.Core.GLTFState.set_skeleton_to_node,
        Godot.Core.GLTFState.set_skeletons, Godot.Core.GLTFState.set_skins,
        Godot.Core.GLTFState.set_texture_samplers,
        Godot.Core.GLTFState.set_textures,
        Godot.Core.GLTFState.set_unique_animation_names,
        Godot.Core.GLTFState.set_unique_names,
        Godot.Core.GLTFState.set_use_named_skin_binds)
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

instance NodeProperty GLTFState "accessors" Array 'False where
        nodeProperty
          = (get_accessors, wrapDroppingSetter set_accessors, Nothing)

instance NodeProperty GLTFState "animations" Array 'False where
        nodeProperty
          = (get_animations, wrapDroppingSetter set_animations, Nothing)

instance NodeProperty GLTFState "buffer_views" Array 'False where
        nodeProperty
          = (get_buffer_views, wrapDroppingSetter set_buffer_views, Nothing)

instance NodeProperty GLTFState "buffers" Array 'False where
        nodeProperty
          = (get_buffers, wrapDroppingSetter set_buffers, Nothing)

instance NodeProperty GLTFState "cameras" Array 'False where
        nodeProperty
          = (get_cameras, wrapDroppingSetter set_cameras, Nothing)

instance NodeProperty GLTFState "create_animations" Bool 'False
         where
        nodeProperty
          = (get_create_animations, wrapDroppingSetter set_create_animations,
             Nothing)

instance NodeProperty GLTFState "glb_data" PoolByteArray 'False
         where
        nodeProperty
          = (get_glb_data, wrapDroppingSetter set_glb_data, Nothing)

instance NodeProperty GLTFState "images" Array 'False where
        nodeProperty = (get_images, wrapDroppingSetter set_images, Nothing)

instance NodeProperty GLTFState "json" Dictionary 'False where
        nodeProperty = (get_json, wrapDroppingSetter set_json, Nothing)

instance NodeProperty GLTFState "lights" Array 'False where
        nodeProperty = (get_lights, wrapDroppingSetter set_lights, Nothing)

instance NodeProperty GLTFState "major_version" Int 'False where
        nodeProperty
          = (get_major_version, wrapDroppingSetter set_major_version,
             Nothing)

instance NodeProperty GLTFState "materials" Array 'False where
        nodeProperty
          = (get_materials, wrapDroppingSetter set_materials, Nothing)

instance NodeProperty GLTFState "meshes" Array 'False where
        nodeProperty = (get_meshes, wrapDroppingSetter set_meshes, Nothing)

instance NodeProperty GLTFState "minor_version" Int 'False where
        nodeProperty
          = (get_minor_version, wrapDroppingSetter set_minor_version,
             Nothing)

instance NodeProperty GLTFState "nodes" Array 'False where
        nodeProperty = (get_nodes, wrapDroppingSetter set_nodes, Nothing)

instance NodeProperty GLTFState "root_nodes" PoolIntArray 'False
         where
        nodeProperty
          = (get_root_nodes, wrapDroppingSetter set_root_nodes, Nothing)

instance NodeProperty GLTFState "scene_name" GodotString 'False
         where
        nodeProperty
          = (get_scene_name, wrapDroppingSetter set_scene_name, Nothing)

instance NodeProperty GLTFState "skeleton_to_node" Dictionary
           'False
         where
        nodeProperty
          = (get_skeleton_to_node, wrapDroppingSetter set_skeleton_to_node,
             Nothing)

instance NodeProperty GLTFState "skeletons" Array 'False where
        nodeProperty
          = (get_skeletons, wrapDroppingSetter set_skeletons, Nothing)

instance NodeProperty GLTFState "skins" Array 'False where
        nodeProperty = (get_skins, wrapDroppingSetter set_skins, Nothing)

instance NodeProperty GLTFState "texture_samplers" Array 'False
         where
        nodeProperty
          = (get_texture_samplers, wrapDroppingSetter set_texture_samplers,
             Nothing)

instance NodeProperty GLTFState "textures" Array 'False where
        nodeProperty
          = (get_textures, wrapDroppingSetter set_textures, Nothing)

instance NodeProperty GLTFState "unique_animation_names" Array
           'False
         where
        nodeProperty
          = (get_unique_animation_names,
             wrapDroppingSetter set_unique_animation_names, Nothing)

instance NodeProperty GLTFState "unique_names" Array 'False where
        nodeProperty
          = (get_unique_names, wrapDroppingSetter set_unique_names, Nothing)

instance NodeProperty GLTFState "use_named_skin_binds" Bool 'False
         where
        nodeProperty
          = (get_use_named_skin_binds,
             wrapDroppingSetter set_use_named_skin_binds, Nothing)

{-# NOINLINE bindGLTFState_add_used_extension #-}

bindGLTFState_add_used_extension :: MethodBind
bindGLTFState_add_used_extension
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "add_used_extension" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_used_extension ::
                     (GLTFState :< cls, Object :< cls) =>
                     cls -> GodotString -> Bool -> IO ()
add_used_extension cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_add_used_extension
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "add_used_extension"
           '[GodotString, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.add_used_extension

{-# NOINLINE bindGLTFState_get_accessors #-}

bindGLTFState_get_accessors :: MethodBind
bindGLTFState_get_accessors
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_accessors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_accessors ::
                (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_accessors cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_accessors (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_accessors" '[] (IO Array) where
        nodeMethod = Godot.Core.GLTFState.get_accessors

{-# NOINLINE bindGLTFState_get_additional_data #-}

bindGLTFState_get_additional_data :: MethodBind
bindGLTFState_get_additional_data
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_additional_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_additional_data ::
                      (GLTFState :< cls, Object :< cls) =>
                      cls -> GodotString -> IO GodotVariant
get_additional_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_additional_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> return var)

instance NodeMethod GLTFState "get_additional_data" '[GodotString]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.GLTFState.get_additional_data

{-# NOINLINE bindGLTFState_get_animation_player #-}

bindGLTFState_get_animation_player :: MethodBind
bindGLTFState_get_animation_player
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_animation_player" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_animation_player ::
                       (GLTFState :< cls, Object :< cls) =>
                       cls -> Int -> IO AnimationPlayer
get_animation_player cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_animation_player
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod GLTFState "get_animation_player" '[Int]
           (IO AnimationPlayer)
         where
        nodeMethod = Godot.Core.GLTFState.get_animation_player

{-# NOINLINE bindGLTFState_get_animation_players_count #-}

bindGLTFState_get_animation_players_count :: MethodBind
bindGLTFState_get_animation_players_count
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_animation_players_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_animation_players_count ::
                              (GLTFState :< cls, Object :< cls) => cls -> Int -> IO Int
get_animation_players_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_animation_players_count
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_animation_players_count" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.GLTFState.get_animation_players_count

{-# NOINLINE bindGLTFState_get_animations #-}

bindGLTFState_get_animations :: MethodBind
bindGLTFState_get_animations
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_animations" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_animations ::
                 (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_animations cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_animations (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_animations" '[] (IO Array) where
        nodeMethod = Godot.Core.GLTFState.get_animations

{-# NOINLINE bindGLTFState_get_buffer_views #-}

bindGLTFState_get_buffer_views :: MethodBind
bindGLTFState_get_buffer_views
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_buffer_views" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_buffer_views ::
                   (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_buffer_views cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_buffer_views (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_buffer_views" '[] (IO Array)
         where
        nodeMethod = Godot.Core.GLTFState.get_buffer_views

{-# NOINLINE bindGLTFState_get_buffers #-}

bindGLTFState_get_buffers :: MethodBind
bindGLTFState_get_buffers
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_buffers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_buffers :: (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_buffers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_buffers (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_buffers" '[] (IO Array) where
        nodeMethod = Godot.Core.GLTFState.get_buffers

{-# NOINLINE bindGLTFState_get_cameras #-}

bindGLTFState_get_cameras :: MethodBind
bindGLTFState_get_cameras
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_cameras" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cameras :: (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_cameras cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_cameras (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_cameras" '[] (IO Array) where
        nodeMethod = Godot.Core.GLTFState.get_cameras

{-# NOINLINE bindGLTFState_get_create_animations #-}

bindGLTFState_get_create_animations :: MethodBind
bindGLTFState_get_create_animations
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_create_animations" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_create_animations ::
                        (GLTFState :< cls, Object :< cls) => cls -> IO Bool
get_create_animations cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_create_animations
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_create_animations" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.GLTFState.get_create_animations

{-# NOINLINE bindGLTFState_get_glb_data #-}

bindGLTFState_get_glb_data :: MethodBind
bindGLTFState_get_glb_data
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_glb_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_glb_data ::
               (GLTFState :< cls, Object :< cls) => cls -> IO PoolByteArray
get_glb_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_glb_data (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_glb_data" '[] (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.GLTFState.get_glb_data

{-# NOINLINE bindGLTFState_get_images #-}

bindGLTFState_get_images :: MethodBind
bindGLTFState_get_images
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_images" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_images :: (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_images cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_images (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_images" '[] (IO Array) where
        nodeMethod = Godot.Core.GLTFState.get_images

{-# NOINLINE bindGLTFState_get_json #-}

bindGLTFState_get_json :: MethodBind
bindGLTFState_get_json
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_json" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_json ::
           (GLTFState :< cls, Object :< cls) => cls -> IO Dictionary
get_json cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_json (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_json" '[] (IO Dictionary) where
        nodeMethod = Godot.Core.GLTFState.get_json

{-# NOINLINE bindGLTFState_get_lights #-}

bindGLTFState_get_lights :: MethodBind
bindGLTFState_get_lights
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_lights" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_lights :: (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_lights cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_lights (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_lights" '[] (IO Array) where
        nodeMethod = Godot.Core.GLTFState.get_lights

{-# NOINLINE bindGLTFState_get_major_version #-}

bindGLTFState_get_major_version :: MethodBind
bindGLTFState_get_major_version
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_major_version" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_major_version ::
                    (GLTFState :< cls, Object :< cls) => cls -> IO Int
get_major_version cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_major_version (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_major_version" '[] (IO Int)
         where
        nodeMethod = Godot.Core.GLTFState.get_major_version

{-# NOINLINE bindGLTFState_get_materials #-}

bindGLTFState_get_materials :: MethodBind
bindGLTFState_get_materials
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_materials" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_materials ::
                (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_materials cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_materials (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_materials" '[] (IO Array) where
        nodeMethod = Godot.Core.GLTFState.get_materials

{-# NOINLINE bindGLTFState_get_meshes #-}

bindGLTFState_get_meshes :: MethodBind
bindGLTFState_get_meshes
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_meshes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_meshes :: (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_meshes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_meshes (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_meshes" '[] (IO Array) where
        nodeMethod = Godot.Core.GLTFState.get_meshes

{-# NOINLINE bindGLTFState_get_minor_version #-}

bindGLTFState_get_minor_version :: MethodBind
bindGLTFState_get_minor_version
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_minor_version" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_minor_version ::
                    (GLTFState :< cls, Object :< cls) => cls -> IO Int
get_minor_version cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_minor_version (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_minor_version" '[] (IO Int)
         where
        nodeMethod = Godot.Core.GLTFState.get_minor_version

{-# NOINLINE bindGLTFState_get_nodes #-}

bindGLTFState_get_nodes :: MethodBind
bindGLTFState_get_nodes
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_nodes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_nodes :: (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_nodes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_nodes (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_nodes" '[] (IO Array) where
        nodeMethod = Godot.Core.GLTFState.get_nodes

{-# NOINLINE bindGLTFState_get_root_nodes #-}

bindGLTFState_get_root_nodes :: MethodBind
bindGLTFState_get_root_nodes
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_root_nodes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_root_nodes ::
                 (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_root_nodes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_root_nodes (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_root_nodes" '[] (IO Array) where
        nodeMethod = Godot.Core.GLTFState.get_root_nodes

{-# NOINLINE bindGLTFState_get_scene_name #-}

bindGLTFState_get_scene_name :: MethodBind
bindGLTFState_get_scene_name
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_scene_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_scene_name ::
                 (GLTFState :< cls, Object :< cls) => cls -> IO GodotString
get_scene_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_scene_name (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_scene_name" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.GLTFState.get_scene_name

{-# NOINLINE bindGLTFState_get_scene_node #-}

bindGLTFState_get_scene_node :: MethodBind
bindGLTFState_get_scene_node
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_scene_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_scene_node ::
                 (GLTFState :< cls, Object :< cls) => cls -> Int -> IO Node
get_scene_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_scene_node (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod GLTFState "get_scene_node" '[Int] (IO Node)
         where
        nodeMethod = Godot.Core.GLTFState.get_scene_node

{-# NOINLINE bindGLTFState_get_skeleton_to_node #-}

bindGLTFState_get_skeleton_to_node :: MethodBind
bindGLTFState_get_skeleton_to_node
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_skeleton_to_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_skeleton_to_node ::
                       (GLTFState :< cls, Object :< cls) => cls -> IO Dictionary
get_skeleton_to_node cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_skeleton_to_node
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_skeleton_to_node" '[]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.GLTFState.get_skeleton_to_node

{-# NOINLINE bindGLTFState_get_skeletons #-}

bindGLTFState_get_skeletons :: MethodBind
bindGLTFState_get_skeletons
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_skeletons" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_skeletons ::
                (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_skeletons cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_skeletons (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_skeletons" '[] (IO Array) where
        nodeMethod = Godot.Core.GLTFState.get_skeletons

{-# NOINLINE bindGLTFState_get_skins #-}

bindGLTFState_get_skins :: MethodBind
bindGLTFState_get_skins
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_skins" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_skins :: (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_skins cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_skins (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_skins" '[] (IO Array) where
        nodeMethod = Godot.Core.GLTFState.get_skins

{-# NOINLINE bindGLTFState_get_texture_samplers #-}

bindGLTFState_get_texture_samplers :: MethodBind
bindGLTFState_get_texture_samplers
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_texture_samplers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_texture_samplers ::
                       (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_texture_samplers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_texture_samplers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_texture_samplers" '[] (IO Array)
         where
        nodeMethod = Godot.Core.GLTFState.get_texture_samplers

{-# NOINLINE bindGLTFState_get_textures #-}

bindGLTFState_get_textures :: MethodBind
bindGLTFState_get_textures
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_textures" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_textures ::
               (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_textures cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_textures (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_textures" '[] (IO Array) where
        nodeMethod = Godot.Core.GLTFState.get_textures

{-# NOINLINE bindGLTFState_get_unique_animation_names #-}

bindGLTFState_get_unique_animation_names :: MethodBind
bindGLTFState_get_unique_animation_names
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_unique_animation_names" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_unique_animation_names ::
                             (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_unique_animation_names cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_unique_animation_names
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_unique_animation_names" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.GLTFState.get_unique_animation_names

{-# NOINLINE bindGLTFState_get_unique_names #-}

bindGLTFState_get_unique_names :: MethodBind
bindGLTFState_get_unique_names
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_unique_names" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_unique_names ::
                   (GLTFState :< cls, Object :< cls) => cls -> IO Array
get_unique_names cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_unique_names (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_unique_names" '[] (IO Array)
         where
        nodeMethod = Godot.Core.GLTFState.get_unique_names

{-# NOINLINE bindGLTFState_get_use_named_skin_binds #-}

bindGLTFState_get_use_named_skin_binds :: MethodBind
bindGLTFState_get_use_named_skin_binds
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "get_use_named_skin_binds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_use_named_skin_binds ::
                           (GLTFState :< cls, Object :< cls) => cls -> IO Bool
get_use_named_skin_binds cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_get_use_named_skin_binds
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "get_use_named_skin_binds" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.GLTFState.get_use_named_skin_binds

{-# NOINLINE bindGLTFState_set_accessors #-}

bindGLTFState_set_accessors :: MethodBind
bindGLTFState_set_accessors
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_accessors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_accessors ::
                (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_accessors cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_accessors (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_accessors" '[Array] (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_accessors

{-# NOINLINE bindGLTFState_set_additional_data #-}

bindGLTFState_set_additional_data :: MethodBind
bindGLTFState_set_additional_data
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_additional_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_additional_data ::
                      (GLTFState :< cls, Object :< cls) =>
                      cls -> GodotString -> GodotVariant -> IO ()
set_additional_data cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_additional_data
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_additional_data"
           '[GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_additional_data

{-# NOINLINE bindGLTFState_set_animations #-}

bindGLTFState_set_animations :: MethodBind
bindGLTFState_set_animations
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_animations" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_animations ::
                 (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_animations cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_animations (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_animations" '[Array] (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_animations

{-# NOINLINE bindGLTFState_set_buffer_views #-}

bindGLTFState_set_buffer_views :: MethodBind
bindGLTFState_set_buffer_views
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_buffer_views" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_buffer_views ::
                   (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_buffer_views cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_buffer_views (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_buffer_views" '[Array] (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_buffer_views

{-# NOINLINE bindGLTFState_set_buffers #-}

bindGLTFState_set_buffers :: MethodBind
bindGLTFState_set_buffers
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_buffers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_buffers ::
              (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_buffers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_buffers (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_buffers" '[Array] (IO ()) where
        nodeMethod = Godot.Core.GLTFState.set_buffers

{-# NOINLINE bindGLTFState_set_cameras #-}

bindGLTFState_set_cameras :: MethodBind
bindGLTFState_set_cameras
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_cameras" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cameras ::
              (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_cameras cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_cameras (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_cameras" '[Array] (IO ()) where
        nodeMethod = Godot.Core.GLTFState.set_cameras

{-# NOINLINE bindGLTFState_set_create_animations #-}

bindGLTFState_set_create_animations :: MethodBind
bindGLTFState_set_create_animations
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_create_animations" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_create_animations ::
                        (GLTFState :< cls, Object :< cls) => cls -> Bool -> IO ()
set_create_animations cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_create_animations
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_create_animations" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_create_animations

{-# NOINLINE bindGLTFState_set_glb_data #-}

bindGLTFState_set_glb_data :: MethodBind
bindGLTFState_set_glb_data
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_glb_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_glb_data ::
               (GLTFState :< cls, Object :< cls) => cls -> PoolByteArray -> IO ()
set_glb_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_glb_data (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_glb_data" '[PoolByteArray]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_glb_data

{-# NOINLINE bindGLTFState_set_images #-}

bindGLTFState_set_images :: MethodBind
bindGLTFState_set_images
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_images" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_images ::
             (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_images cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_images (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_images" '[Array] (IO ()) where
        nodeMethod = Godot.Core.GLTFState.set_images

{-# NOINLINE bindGLTFState_set_json #-}

bindGLTFState_set_json :: MethodBind
bindGLTFState_set_json
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_json" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_json ::
           (GLTFState :< cls, Object :< cls) => cls -> Dictionary -> IO ()
set_json cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_json (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_json" '[Dictionary] (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_json

{-# NOINLINE bindGLTFState_set_lights #-}

bindGLTFState_set_lights :: MethodBind
bindGLTFState_set_lights
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_lights" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_lights ::
             (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_lights cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_lights (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_lights" '[Array] (IO ()) where
        nodeMethod = Godot.Core.GLTFState.set_lights

{-# NOINLINE bindGLTFState_set_major_version #-}

bindGLTFState_set_major_version :: MethodBind
bindGLTFState_set_major_version
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_major_version" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_major_version ::
                    (GLTFState :< cls, Object :< cls) => cls -> Int -> IO ()
set_major_version cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_major_version (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_major_version" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_major_version

{-# NOINLINE bindGLTFState_set_materials #-}

bindGLTFState_set_materials :: MethodBind
bindGLTFState_set_materials
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_materials" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_materials ::
                (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_materials cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_materials (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_materials" '[Array] (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_materials

{-# NOINLINE bindGLTFState_set_meshes #-}

bindGLTFState_set_meshes :: MethodBind
bindGLTFState_set_meshes
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_meshes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_meshes ::
             (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_meshes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_meshes (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_meshes" '[Array] (IO ()) where
        nodeMethod = Godot.Core.GLTFState.set_meshes

{-# NOINLINE bindGLTFState_set_minor_version #-}

bindGLTFState_set_minor_version :: MethodBind
bindGLTFState_set_minor_version
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_minor_version" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_minor_version ::
                    (GLTFState :< cls, Object :< cls) => cls -> Int -> IO ()
set_minor_version cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_minor_version (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_minor_version" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_minor_version

{-# NOINLINE bindGLTFState_set_nodes #-}

bindGLTFState_set_nodes :: MethodBind
bindGLTFState_set_nodes
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_nodes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_nodes ::
            (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_nodes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_nodes (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_nodes" '[Array] (IO ()) where
        nodeMethod = Godot.Core.GLTFState.set_nodes

{-# NOINLINE bindGLTFState_set_root_nodes #-}

bindGLTFState_set_root_nodes :: MethodBind
bindGLTFState_set_root_nodes
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_root_nodes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_root_nodes ::
                 (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_root_nodes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_root_nodes (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_root_nodes" '[Array] (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_root_nodes

{-# NOINLINE bindGLTFState_set_scene_name #-}

bindGLTFState_set_scene_name :: MethodBind
bindGLTFState_set_scene_name
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_scene_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_scene_name ::
                 (GLTFState :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_scene_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_scene_name (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_scene_name" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_scene_name

{-# NOINLINE bindGLTFState_set_skeleton_to_node #-}

bindGLTFState_set_skeleton_to_node :: MethodBind
bindGLTFState_set_skeleton_to_node
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_skeleton_to_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_skeleton_to_node ::
                       (GLTFState :< cls, Object :< cls) => cls -> Dictionary -> IO ()
set_skeleton_to_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_skeleton_to_node
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_skeleton_to_node" '[Dictionary]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_skeleton_to_node

{-# NOINLINE bindGLTFState_set_skeletons #-}

bindGLTFState_set_skeletons :: MethodBind
bindGLTFState_set_skeletons
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_skeletons" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_skeletons ::
                (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_skeletons cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_skeletons (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_skeletons" '[Array] (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_skeletons

{-# NOINLINE bindGLTFState_set_skins #-}

bindGLTFState_set_skins :: MethodBind
bindGLTFState_set_skins
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_skins" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_skins ::
            (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_skins cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_skins (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_skins" '[Array] (IO ()) where
        nodeMethod = Godot.Core.GLTFState.set_skins

{-# NOINLINE bindGLTFState_set_texture_samplers #-}

bindGLTFState_set_texture_samplers :: MethodBind
bindGLTFState_set_texture_samplers
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_texture_samplers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_texture_samplers ::
                       (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_texture_samplers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_texture_samplers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_texture_samplers" '[Array]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_texture_samplers

{-# NOINLINE bindGLTFState_set_textures #-}

bindGLTFState_set_textures :: MethodBind
bindGLTFState_set_textures
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_textures" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_textures ::
               (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_textures cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_textures (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_textures" '[Array] (IO ()) where
        nodeMethod = Godot.Core.GLTFState.set_textures

{-# NOINLINE bindGLTFState_set_unique_animation_names #-}

bindGLTFState_set_unique_animation_names :: MethodBind
bindGLTFState_set_unique_animation_names
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_unique_animation_names" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_unique_animation_names ::
                             (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_unique_animation_names cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_unique_animation_names
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_unique_animation_names" '[Array]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_unique_animation_names

{-# NOINLINE bindGLTFState_set_unique_names #-}

bindGLTFState_set_unique_names :: MethodBind
bindGLTFState_set_unique_names
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_unique_names" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_unique_names ::
                   (GLTFState :< cls, Object :< cls) => cls -> Array -> IO ()
set_unique_names cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_unique_names (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_unique_names" '[Array] (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_unique_names

{-# NOINLINE bindGLTFState_set_use_named_skin_binds #-}

bindGLTFState_set_use_named_skin_binds :: MethodBind
bindGLTFState_set_use_named_skin_binds
  = unsafePerformIO $
      withCString "GLTFState" $
        \ clsNamePtr ->
          withCString "set_use_named_skin_binds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_use_named_skin_binds ::
                           (GLTFState :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_named_skin_binds cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFState_set_use_named_skin_binds
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFState "set_use_named_skin_binds" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFState.set_use_named_skin_binds