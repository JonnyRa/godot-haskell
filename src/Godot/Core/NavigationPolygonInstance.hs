{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NavigationPolygonInstance
       (Godot.Core.NavigationPolygonInstance._map_changed,
        Godot.Core.NavigationPolygonInstance._navpoly_changed,
        Godot.Core.NavigationPolygonInstance.get_enter_cost,
        Godot.Core.NavigationPolygonInstance.get_navigation_layers,
        Godot.Core.NavigationPolygonInstance.get_navigation_polygon,
        Godot.Core.NavigationPolygonInstance.get_region_rid,
        Godot.Core.NavigationPolygonInstance.get_travel_cost,
        Godot.Core.NavigationPolygonInstance.is_enabled,
        Godot.Core.NavigationPolygonInstance.set_enabled,
        Godot.Core.NavigationPolygonInstance.set_enter_cost,
        Godot.Core.NavigationPolygonInstance.set_navigation_layers,
        Godot.Core.NavigationPolygonInstance.set_navigation_polygon,
        Godot.Core.NavigationPolygonInstance.set_travel_cost)
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
import Godot.Core.Node2D()

instance NodeProperty NavigationPolygonInstance "enabled" Bool
           'False
         where
        nodeProperty
          = (is_enabled, wrapDroppingSetter set_enabled, Nothing)

instance NodeProperty NavigationPolygonInstance "enter_cost" Float
           'False
         where
        nodeProperty
          = (get_enter_cost, wrapDroppingSetter set_enter_cost, Nothing)

instance NodeProperty NavigationPolygonInstance "navigation_layers"
           Int
           'False
         where
        nodeProperty
          = (get_navigation_layers, wrapDroppingSetter set_navigation_layers,
             Nothing)

instance NodeProperty NavigationPolygonInstance "navpoly"
           NavigationPolygon
           'False
         where
        nodeProperty
          = (get_navigation_polygon,
             wrapDroppingSetter set_navigation_polygon, Nothing)

instance NodeProperty NavigationPolygonInstance "travel_cost" Float
           'False
         where
        nodeProperty
          = (get_travel_cost, wrapDroppingSetter set_travel_cost, Nothing)

{-# NOINLINE bindNavigationPolygonInstance__map_changed #-}

bindNavigationPolygonInstance__map_changed :: MethodBind
bindNavigationPolygonInstance__map_changed
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "_map_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_map_changed ::
               (NavigationPolygonInstance :< cls, Object :< cls) =>
               cls -> Rid -> IO ()
_map_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygonInstance__map_changed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationPolygonInstance "_map_changed" '[Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationPolygonInstance._map_changed

{-# NOINLINE bindNavigationPolygonInstance__navpoly_changed #-}

bindNavigationPolygonInstance__navpoly_changed :: MethodBind
bindNavigationPolygonInstance__navpoly_changed
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "_navpoly_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_navpoly_changed ::
                   (NavigationPolygonInstance :< cls, Object :< cls) => cls -> IO ()
_navpoly_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationPolygonInstance__navpoly_changed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationPolygonInstance "_navpoly_changed"
           '[]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationPolygonInstance._navpoly_changed

{-# NOINLINE bindNavigationPolygonInstance_get_enter_cost #-}

-- | When pathfinding enters this region's navmesh from another regions navmesh the @enter_cost@ value is added to the path distance for determining the shortest path.
bindNavigationPolygonInstance_get_enter_cost :: MethodBind
bindNavigationPolygonInstance_get_enter_cost
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "get_enter_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When pathfinding enters this region's navmesh from another regions navmesh the @enter_cost@ value is added to the path distance for determining the shortest path.
get_enter_cost ::
                 (NavigationPolygonInstance :< cls, Object :< cls) =>
                 cls -> IO Float
get_enter_cost cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygonInstance_get_enter_cost
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationPolygonInstance "get_enter_cost" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationPolygonInstance.get_enter_cost

{-# NOINLINE bindNavigationPolygonInstance_get_navigation_layers
             #-}

-- | A bitfield determining all navigation map layers the @NavigationPolygon@ belongs to. On path requests with @method Navigation2DServer.map_get_path@ navmeshes without matching layers will be ignored and the navigation map will only proximity merge different navmeshes with matching layers.
bindNavigationPolygonInstance_get_navigation_layers :: MethodBind
bindNavigationPolygonInstance_get_navigation_layers
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "get_navigation_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A bitfield determining all navigation map layers the @NavigationPolygon@ belongs to. On path requests with @method Navigation2DServer.map_get_path@ navmeshes without matching layers will be ignored and the navigation map will only proximity merge different navmeshes with matching layers.
get_navigation_layers ::
                        (NavigationPolygonInstance :< cls, Object :< cls) => cls -> IO Int
get_navigation_layers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationPolygonInstance_get_navigation_layers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationPolygonInstance
           "get_navigation_layers"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.NavigationPolygonInstance.get_navigation_layers

{-# NOINLINE bindNavigationPolygonInstance_get_navigation_polygon
             #-}

-- | The @NavigationPolygon@ resource to use.
bindNavigationPolygonInstance_get_navigation_polygon :: MethodBind
bindNavigationPolygonInstance_get_navigation_polygon
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "get_navigation_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @NavigationPolygon@ resource to use.
get_navigation_polygon ::
                         (NavigationPolygonInstance :< cls, Object :< cls) =>
                         cls -> IO NavigationPolygon
get_navigation_polygon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationPolygonInstance_get_navigation_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod NavigationPolygonInstance
           "get_navigation_polygon"
           '[]
           (IO NavigationPolygon)
         where
        nodeMethod
          = Godot.Core.NavigationPolygonInstance.get_navigation_polygon

{-# NOINLINE bindNavigationPolygonInstance_get_region_rid #-}

-- | Returns the @RID@ of this region on the @Navigation2DServer@. Combined with @method Navigation2DServer.map_get_closest_point_owner@ can be used to identify the @NavigationPolygonInstance@ closest to a point on the merged navigation map.
bindNavigationPolygonInstance_get_region_rid :: MethodBind
bindNavigationPolygonInstance_get_region_rid
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "get_region_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of this region on the @Navigation2DServer@. Combined with @method Navigation2DServer.map_get_closest_point_owner@ can be used to identify the @NavigationPolygonInstance@ closest to a point on the merged navigation map.
get_region_rid ::
                 (NavigationPolygonInstance :< cls, Object :< cls) => cls -> IO Rid
get_region_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygonInstance_get_region_rid
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationPolygonInstance "get_region_rid" '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.NavigationPolygonInstance.get_region_rid

{-# NOINLINE bindNavigationPolygonInstance_get_travel_cost #-}

-- | When pathfinding moves inside this region's navmesh the traveled distances are multiplied with @travel_cost@ for determining the shortest path.
bindNavigationPolygonInstance_get_travel_cost :: MethodBind
bindNavigationPolygonInstance_get_travel_cost
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "get_travel_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When pathfinding moves inside this region's navmesh the traveled distances are multiplied with @travel_cost@ for determining the shortest path.
get_travel_cost ::
                  (NavigationPolygonInstance :< cls, Object :< cls) =>
                  cls -> IO Float
get_travel_cost cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationPolygonInstance_get_travel_cost
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationPolygonInstance "get_travel_cost" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationPolygonInstance.get_travel_cost

{-# NOINLINE bindNavigationPolygonInstance_is_enabled #-}

-- | Determines if the @NavigationPolygonInstance@ is enabled or disabled.
bindNavigationPolygonInstance_is_enabled :: MethodBind
bindNavigationPolygonInstance_is_enabled
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "is_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines if the @NavigationPolygonInstance@ is enabled or disabled.
is_enabled ::
             (NavigationPolygonInstance :< cls, Object :< cls) => cls -> IO Bool
is_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygonInstance_is_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationPolygonInstance "is_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationPolygonInstance.is_enabled

{-# NOINLINE bindNavigationPolygonInstance_set_enabled #-}

-- | Determines if the @NavigationPolygonInstance@ is enabled or disabled.
bindNavigationPolygonInstance_set_enabled :: MethodBind
bindNavigationPolygonInstance_set_enabled
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "set_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines if the @NavigationPolygonInstance@ is enabled or disabled.
set_enabled ::
              (NavigationPolygonInstance :< cls, Object :< cls) =>
              cls -> Bool -> IO ()
set_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygonInstance_set_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationPolygonInstance "set_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationPolygonInstance.set_enabled

{-# NOINLINE bindNavigationPolygonInstance_set_enter_cost #-}

-- | When pathfinding enters this region's navmesh from another regions navmesh the @enter_cost@ value is added to the path distance for determining the shortest path.
bindNavigationPolygonInstance_set_enter_cost :: MethodBind
bindNavigationPolygonInstance_set_enter_cost
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "set_enter_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When pathfinding enters this region's navmesh from another regions navmesh the @enter_cost@ value is added to the path distance for determining the shortest path.
set_enter_cost ::
                 (NavigationPolygonInstance :< cls, Object :< cls) =>
                 cls -> Float -> IO ()
set_enter_cost cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygonInstance_set_enter_cost
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationPolygonInstance "set_enter_cost"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationPolygonInstance.set_enter_cost

{-# NOINLINE bindNavigationPolygonInstance_set_navigation_layers
             #-}

-- | A bitfield determining all navigation map layers the @NavigationPolygon@ belongs to. On path requests with @method Navigation2DServer.map_get_path@ navmeshes without matching layers will be ignored and the navigation map will only proximity merge different navmeshes with matching layers.
bindNavigationPolygonInstance_set_navigation_layers :: MethodBind
bindNavigationPolygonInstance_set_navigation_layers
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "set_navigation_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A bitfield determining all navigation map layers the @NavigationPolygon@ belongs to. On path requests with @method Navigation2DServer.map_get_path@ navmeshes without matching layers will be ignored and the navigation map will only proximity merge different navmeshes with matching layers.
set_navigation_layers ::
                        (NavigationPolygonInstance :< cls, Object :< cls) =>
                        cls -> Int -> IO ()
set_navigation_layers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationPolygonInstance_set_navigation_layers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationPolygonInstance
           "set_navigation_layers"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.NavigationPolygonInstance.set_navigation_layers

{-# NOINLINE bindNavigationPolygonInstance_set_navigation_polygon
             #-}

-- | The @NavigationPolygon@ resource to use.
bindNavigationPolygonInstance_set_navigation_polygon :: MethodBind
bindNavigationPolygonInstance_set_navigation_polygon
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "set_navigation_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @NavigationPolygon@ resource to use.
set_navigation_polygon ::
                         (NavigationPolygonInstance :< cls, Object :< cls) =>
                         cls -> NavigationPolygon -> IO ()
set_navigation_polygon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationPolygonInstance_set_navigation_polygon
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationPolygonInstance
           "set_navigation_polygon"
           '[NavigationPolygon]
           (IO ())
         where
        nodeMethod
          = Godot.Core.NavigationPolygonInstance.set_navigation_polygon

{-# NOINLINE bindNavigationPolygonInstance_set_travel_cost #-}

-- | When pathfinding moves inside this region's navmesh the traveled distances are multiplied with @travel_cost@ for determining the shortest path.
bindNavigationPolygonInstance_set_travel_cost :: MethodBind
bindNavigationPolygonInstance_set_travel_cost
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "set_travel_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When pathfinding moves inside this region's navmesh the traveled distances are multiplied with @travel_cost@ for determining the shortest path.
set_travel_cost ::
                  (NavigationPolygonInstance :< cls, Object :< cls) =>
                  cls -> Float -> IO ()
set_travel_cost cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationPolygonInstance_set_travel_cost
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationPolygonInstance "set_travel_cost"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationPolygonInstance.set_travel_cost