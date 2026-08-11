{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NavigationMeshInstance
       (Godot.Core.NavigationMeshInstance.sig_bake_finished,
        Godot.Core.NavigationMeshInstance.sig_navigation_mesh_changed,
        Godot.Core.NavigationMeshInstance._bake_finished,
        Godot.Core.NavigationMeshInstance.bake_navigation_mesh,
        Godot.Core.NavigationMeshInstance.get_enter_cost,
        Godot.Core.NavigationMeshInstance.get_navigation_layers,
        Godot.Core.NavigationMeshInstance.get_navigation_mesh,
        Godot.Core.NavigationMeshInstance.get_region_rid,
        Godot.Core.NavigationMeshInstance.get_travel_cost,
        Godot.Core.NavigationMeshInstance.is_enabled,
        Godot.Core.NavigationMeshInstance.set_enabled,
        Godot.Core.NavigationMeshInstance.set_enter_cost,
        Godot.Core.NavigationMeshInstance.set_navigation_layers,
        Godot.Core.NavigationMeshInstance.set_navigation_mesh,
        Godot.Core.NavigationMeshInstance.set_travel_cost)
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
import Godot.Core.Spatial()

-- | Notifies when the navigation mesh bake operation is completed.
sig_bake_finished ::
                  Godot.Internal.Dispatch.Signal NavigationMeshInstance
sig_bake_finished = Godot.Internal.Dispatch.Signal "bake_finished"

instance NodeSignal NavigationMeshInstance "bake_finished" '[]

-- | Notifies when the @NavigationMesh@ has changed.
sig_navigation_mesh_changed ::
                            Godot.Internal.Dispatch.Signal NavigationMeshInstance
sig_navigation_mesh_changed
  = Godot.Internal.Dispatch.Signal "navigation_mesh_changed"

instance NodeSignal NavigationMeshInstance
           "navigation_mesh_changed"
           '[]

instance NodeProperty NavigationMeshInstance "enabled" Bool 'False
         where
        nodeProperty
          = (is_enabled, wrapDroppingSetter set_enabled, Nothing)

instance NodeProperty NavigationMeshInstance "enter_cost" Float
           'False
         where
        nodeProperty
          = (get_enter_cost, wrapDroppingSetter set_enter_cost, Nothing)

instance NodeProperty NavigationMeshInstance "navigation_layers"
           Int
           'False
         where
        nodeProperty
          = (get_navigation_layers, wrapDroppingSetter set_navigation_layers,
             Nothing)

instance NodeProperty NavigationMeshInstance "navmesh"
           NavigationMesh
           'False
         where
        nodeProperty
          = (get_navigation_mesh, wrapDroppingSetter set_navigation_mesh,
             Nothing)

instance NodeProperty NavigationMeshInstance "travel_cost" Float
           'False
         where
        nodeProperty
          = (get_travel_cost, wrapDroppingSetter set_travel_cost, Nothing)

{-# NOINLINE bindNavigationMeshInstance__bake_finished #-}

bindNavigationMeshInstance__bake_finished :: MethodBind
bindNavigationMeshInstance__bake_finished
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "_bake_finished" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_bake_finished ::
                 (NavigationMeshInstance :< cls, Object :< cls) =>
                 cls -> NavigationMesh -> IO ()
_bake_finished cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMeshInstance__bake_finished
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationMeshInstance "_bake_finished"
           '[NavigationMesh]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMeshInstance._bake_finished

{-# NOINLINE bindNavigationMeshInstance_bake_navigation_mesh #-}

-- | Bakes the @NavigationMesh@. If @on_thread@ is set to @true@ (default), the baking is done on a separate thread. Baking on separate thread is useful because navigation baking is not a cheap operation. When it is completed, it automatically sets the new @NavigationMesh@. Please note that baking on separate thread may be very slow if geometry is parsed from meshes as async access to each mesh involves heavy synchronization. Also, please note that baking on a separate thread is automatically disabled on operating systems that cannot use threads (such as HTML5 with threads disabled).
bindNavigationMeshInstance_bake_navigation_mesh :: MethodBind
bindNavigationMeshInstance_bake_navigation_mesh
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "bake_navigation_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bakes the @NavigationMesh@. If @on_thread@ is set to @true@ (default), the baking is done on a separate thread. Baking on separate thread is useful because navigation baking is not a cheap operation. When it is completed, it automatically sets the new @NavigationMesh@. Please note that baking on separate thread may be very slow if geometry is parsed from meshes as async access to each mesh involves heavy synchronization. Also, please note that baking on a separate thread is automatically disabled on operating systems that cannot use threads (such as HTML5 with threads disabled).
bake_navigation_mesh ::
                       (NavigationMeshInstance :< cls, Object :< cls) =>
                       cls -> Maybe Bool -> IO ()
bake_navigation_mesh cls arg1
  = withVariantArray [maybe (VariantBool True) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationMeshInstance_bake_navigation_mesh
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationMeshInstance "bake_navigation_mesh"
           '[Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMeshInstance.bake_navigation_mesh

{-# NOINLINE bindNavigationMeshInstance_get_enter_cost #-}

-- | When pathfinding enters this region's navmesh from another regions navmesh the @enter_cost@ value is added to the path distance for determining the shortest path.
bindNavigationMeshInstance_get_enter_cost :: MethodBind
bindNavigationMeshInstance_get_enter_cost
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "get_enter_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When pathfinding enters this region's navmesh from another regions navmesh the @enter_cost@ value is added to the path distance for determining the shortest path.
get_enter_cost ::
                 (NavigationMeshInstance :< cls, Object :< cls) => cls -> IO Float
get_enter_cost cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMeshInstance_get_enter_cost
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationMeshInstance "get_enter_cost" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationMeshInstance.get_enter_cost

{-# NOINLINE bindNavigationMeshInstance_get_navigation_layers #-}

-- | A bitfield determining all navigation map layers the @NavigationMesh@ belongs to. On path requests with @method NavigationServer.map_get_path@ navmeshes without matching layers will be ignored and the navigation map will only proximity merge different navmeshes with matching layers.
bindNavigationMeshInstance_get_navigation_layers :: MethodBind
bindNavigationMeshInstance_get_navigation_layers
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "get_navigation_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A bitfield determining all navigation map layers the @NavigationMesh@ belongs to. On path requests with @method NavigationServer.map_get_path@ navmeshes without matching layers will be ignored and the navigation map will only proximity merge different navmeshes with matching layers.
get_navigation_layers ::
                        (NavigationMeshInstance :< cls, Object :< cls) => cls -> IO Int
get_navigation_layers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationMeshInstance_get_navigation_layers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationMeshInstance "get_navigation_layers"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.NavigationMeshInstance.get_navigation_layers

{-# NOINLINE bindNavigationMeshInstance_get_navigation_mesh #-}

-- | The @NavigationMesh@ resource to use.
bindNavigationMeshInstance_get_navigation_mesh :: MethodBind
bindNavigationMeshInstance_get_navigation_mesh
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "get_navigation_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @NavigationMesh@ resource to use.
get_navigation_mesh ::
                      (NavigationMeshInstance :< cls, Object :< cls) =>
                      cls -> IO NavigationMesh
get_navigation_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationMeshInstance_get_navigation_mesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod NavigationMeshInstance "get_navigation_mesh"
           '[]
           (IO NavigationMesh)
         where
        nodeMethod = Godot.Core.NavigationMeshInstance.get_navigation_mesh

{-# NOINLINE bindNavigationMeshInstance_get_region_rid #-}

-- | Returns the @RID@ of this region on the @NavigationServer@. Combined with @method NavigationServer.map_get_closest_point_owner@ can be used to identify the @NavigationMeshInstance@ closest to a point on the merged navigation map.
bindNavigationMeshInstance_get_region_rid :: MethodBind
bindNavigationMeshInstance_get_region_rid
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "get_region_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of this region on the @NavigationServer@. Combined with @method NavigationServer.map_get_closest_point_owner@ can be used to identify the @NavigationMeshInstance@ closest to a point on the merged navigation map.
get_region_rid ::
                 (NavigationMeshInstance :< cls, Object :< cls) => cls -> IO Rid
get_region_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMeshInstance_get_region_rid
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationMeshInstance "get_region_rid" '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.NavigationMeshInstance.get_region_rid

{-# NOINLINE bindNavigationMeshInstance_get_travel_cost #-}

-- | When pathfinding moves inside this region's navmesh the traveled distances are multiplied with @travel_cost@ for determining the shortest path.
bindNavigationMeshInstance_get_travel_cost :: MethodBind
bindNavigationMeshInstance_get_travel_cost
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "get_travel_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When pathfinding moves inside this region's navmesh the traveled distances are multiplied with @travel_cost@ for determining the shortest path.
get_travel_cost ::
                  (NavigationMeshInstance :< cls, Object :< cls) => cls -> IO Float
get_travel_cost cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMeshInstance_get_travel_cost
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationMeshInstance "get_travel_cost" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationMeshInstance.get_travel_cost

{-# NOINLINE bindNavigationMeshInstance_is_enabled #-}

-- | Determines if the @NavigationMeshInstance@ is enabled or disabled.
bindNavigationMeshInstance_is_enabled :: MethodBind
bindNavigationMeshInstance_is_enabled
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "is_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines if the @NavigationMeshInstance@ is enabled or disabled.
is_enabled ::
             (NavigationMeshInstance :< cls, Object :< cls) => cls -> IO Bool
is_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMeshInstance_is_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationMeshInstance "is_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationMeshInstance.is_enabled

{-# NOINLINE bindNavigationMeshInstance_set_enabled #-}

-- | Determines if the @NavigationMeshInstance@ is enabled or disabled.
bindNavigationMeshInstance_set_enabled :: MethodBind
bindNavigationMeshInstance_set_enabled
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "set_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines if the @NavigationMeshInstance@ is enabled or disabled.
set_enabled ::
              (NavigationMeshInstance :< cls, Object :< cls) =>
              cls -> Bool -> IO ()
set_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMeshInstance_set_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationMeshInstance "set_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMeshInstance.set_enabled

{-# NOINLINE bindNavigationMeshInstance_set_enter_cost #-}

-- | When pathfinding enters this region's navmesh from another regions navmesh the @enter_cost@ value is added to the path distance for determining the shortest path.
bindNavigationMeshInstance_set_enter_cost :: MethodBind
bindNavigationMeshInstance_set_enter_cost
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "set_enter_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When pathfinding enters this region's navmesh from another regions navmesh the @enter_cost@ value is added to the path distance for determining the shortest path.
set_enter_cost ::
                 (NavigationMeshInstance :< cls, Object :< cls) =>
                 cls -> Float -> IO ()
set_enter_cost cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMeshInstance_set_enter_cost
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationMeshInstance "set_enter_cost"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMeshInstance.set_enter_cost

{-# NOINLINE bindNavigationMeshInstance_set_navigation_layers #-}

-- | A bitfield determining all navigation map layers the @NavigationMesh@ belongs to. On path requests with @method NavigationServer.map_get_path@ navmeshes without matching layers will be ignored and the navigation map will only proximity merge different navmeshes with matching layers.
bindNavigationMeshInstance_set_navigation_layers :: MethodBind
bindNavigationMeshInstance_set_navigation_layers
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "set_navigation_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A bitfield determining all navigation map layers the @NavigationMesh@ belongs to. On path requests with @method NavigationServer.map_get_path@ navmeshes without matching layers will be ignored and the navigation map will only proximity merge different navmeshes with matching layers.
set_navigation_layers ::
                        (NavigationMeshInstance :< cls, Object :< cls) =>
                        cls -> Int -> IO ()
set_navigation_layers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationMeshInstance_set_navigation_layers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationMeshInstance "set_navigation_layers"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.NavigationMeshInstance.set_navigation_layers

{-# NOINLINE bindNavigationMeshInstance_set_navigation_mesh #-}

-- | The @NavigationMesh@ resource to use.
bindNavigationMeshInstance_set_navigation_mesh :: MethodBind
bindNavigationMeshInstance_set_navigation_mesh
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "set_navigation_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @NavigationMesh@ resource to use.
set_navigation_mesh ::
                      (NavigationMeshInstance :< cls, Object :< cls) =>
                      cls -> NavigationMesh -> IO ()
set_navigation_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationMeshInstance_set_navigation_mesh
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationMeshInstance "set_navigation_mesh"
           '[NavigationMesh]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMeshInstance.set_navigation_mesh

{-# NOINLINE bindNavigationMeshInstance_set_travel_cost #-}

-- | When pathfinding moves inside this region's navmesh the traveled distances are multiplied with @travel_cost@ for determining the shortest path.
bindNavigationMeshInstance_set_travel_cost :: MethodBind
bindNavigationMeshInstance_set_travel_cost
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "set_travel_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When pathfinding moves inside this region's navmesh the traveled distances are multiplied with @travel_cost@ for determining the shortest path.
set_travel_cost ::
                  (NavigationMeshInstance :< cls, Object :< cls) =>
                  cls -> Float -> IO ()
set_travel_cost cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMeshInstance_set_travel_cost
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationMeshInstance "set_travel_cost"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMeshInstance.set_travel_cost