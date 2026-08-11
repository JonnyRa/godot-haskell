{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NavigationMeshGenerator
       (Godot.Core.NavigationMeshGenerator.bake,
        Godot.Core.NavigationMeshGenerator.clear)
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
import Godot.Core.Object()

{-# NOINLINE bindNavigationMeshGenerator_bake #-}

-- | Bakes navigation data to the provided @nav_mesh@ by parsing child nodes under the provided @root_node@ or a specific group of nodes for potential source geometry. The parse behavior can be controlled with the @NavigationMesh.geometry_parsed_geometry_type@ and @NavigationMesh.geometry_source_geometry_mode@ properties on the @NavigationMesh@ resource.
bindNavigationMeshGenerator_bake :: MethodBind
bindNavigationMeshGenerator_bake
  = unsafePerformIO $
      withCString "NavigationMeshGenerator" $
        \ clsNamePtr ->
          withCString "bake" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bakes navigation data to the provided @nav_mesh@ by parsing child nodes under the provided @root_node@ or a specific group of nodes for potential source geometry. The parse behavior can be controlled with the @NavigationMesh.geometry_parsed_geometry_type@ and @NavigationMesh.geometry_source_geometry_mode@ properties on the @NavigationMesh@ resource.
bake ::
       (NavigationMeshGenerator :< cls, Object :< cls) =>
       cls -> NavigationMesh -> Node -> IO ()
bake cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMeshGenerator_bake
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationMeshGenerator "bake"
           '[NavigationMesh, Node]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMeshGenerator.bake

{-# NOINLINE bindNavigationMeshGenerator_clear #-}

-- | Removes all polygons and vertices from the provided @nav_mesh@ resource.
bindNavigationMeshGenerator_clear :: MethodBind
bindNavigationMeshGenerator_clear
  = unsafePerformIO $
      withCString "NavigationMeshGenerator" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all polygons and vertices from the provided @nav_mesh@ resource.
clear ::
        (NavigationMeshGenerator :< cls, Object :< cls) =>
        cls -> NavigationMesh -> IO ()
clear cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMeshGenerator_clear
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationMeshGenerator "clear"
           '[NavigationMesh]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMeshGenerator.clear