{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NavigationAgent2D
       (Godot.Core.NavigationAgent2D.sig_navigation_finished,
        Godot.Core.NavigationAgent2D.sig_path_changed,
        Godot.Core.NavigationAgent2D.sig_target_reached,
        Godot.Core.NavigationAgent2D.sig_velocity_computed,
        Godot.Core.NavigationAgent2D._avoidance_done,
        Godot.Core.NavigationAgent2D.distance_to_target,
        Godot.Core.NavigationAgent2D.get_avoidance_enabled,
        Godot.Core.NavigationAgent2D.get_final_location,
        Godot.Core.NavigationAgent2D.get_max_neighbors,
        Godot.Core.NavigationAgent2D.get_max_speed,
        Godot.Core.NavigationAgent2D.get_nav_path,
        Godot.Core.NavigationAgent2D.get_nav_path_index,
        Godot.Core.NavigationAgent2D.get_navigation,
        Godot.Core.NavigationAgent2D.get_navigation_layers,
        Godot.Core.NavigationAgent2D.get_navigation_map,
        Godot.Core.NavigationAgent2D.get_neighbor_dist,
        Godot.Core.NavigationAgent2D.get_next_location,
        Godot.Core.NavigationAgent2D.get_path_desired_distance,
        Godot.Core.NavigationAgent2D.get_path_max_distance,
        Godot.Core.NavigationAgent2D.get_radius,
        Godot.Core.NavigationAgent2D.get_rid,
        Godot.Core.NavigationAgent2D.get_target_desired_distance,
        Godot.Core.NavigationAgent2D.get_target_location,
        Godot.Core.NavigationAgent2D.get_time_horizon,
        Godot.Core.NavigationAgent2D.is_navigation_finished,
        Godot.Core.NavigationAgent2D.is_target_reachable,
        Godot.Core.NavigationAgent2D.is_target_reached,
        Godot.Core.NavigationAgent2D.set_avoidance_enabled,
        Godot.Core.NavigationAgent2D.set_max_neighbors,
        Godot.Core.NavigationAgent2D.set_max_speed,
        Godot.Core.NavigationAgent2D.set_navigation,
        Godot.Core.NavigationAgent2D.set_navigation_layers,
        Godot.Core.NavigationAgent2D.set_navigation_map,
        Godot.Core.NavigationAgent2D.set_neighbor_dist,
        Godot.Core.NavigationAgent2D.set_path_desired_distance,
        Godot.Core.NavigationAgent2D.set_path_max_distance,
        Godot.Core.NavigationAgent2D.set_radius,
        Godot.Core.NavigationAgent2D.set_target_desired_distance,
        Godot.Core.NavigationAgent2D.set_target_location,
        Godot.Core.NavigationAgent2D.set_time_horizon,
        Godot.Core.NavigationAgent2D.set_velocity)
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
import Godot.Core.Node()

-- | Notifies when the final location is reached.
sig_navigation_finished ::
                        Godot.Internal.Dispatch.Signal NavigationAgent2D
sig_navigation_finished
  = Godot.Internal.Dispatch.Signal "navigation_finished"

instance NodeSignal NavigationAgent2D "navigation_finished" '[]

-- | Notifies when the navigation path changes. This can be triggered by the navigation system or by the user changing the path.
sig_path_changed ::
                 Godot.Internal.Dispatch.Signal NavigationAgent2D
sig_path_changed = Godot.Internal.Dispatch.Signal "path_changed"

instance NodeSignal NavigationAgent2D "path_changed" '[]

-- | Notifies when the player-defined @target_location@ is reached.
sig_target_reached ::
                   Godot.Internal.Dispatch.Signal NavigationAgent2D
sig_target_reached
  = Godot.Internal.Dispatch.Signal "target_reached"

instance NodeSignal NavigationAgent2D "target_reached" '[]

-- | Notifies when the collision avoidance velocity is calculated after a call to @method set_velocity@. Only emitted when @avoidance_enabled@ is true.
sig_velocity_computed ::
                      Godot.Internal.Dispatch.Signal NavigationAgent2D
sig_velocity_computed
  = Godot.Internal.Dispatch.Signal "velocity_computed"

instance NodeSignal NavigationAgent2D "velocity_computed"
           '[Vector2]

instance NodeProperty NavigationAgent2D "avoidance_enabled" Bool
           'False
         where
        nodeProperty
          = (get_avoidance_enabled, wrapDroppingSetter set_avoidance_enabled,
             Nothing)

instance NodeProperty NavigationAgent2D "max_neighbors" Int 'False
         where
        nodeProperty
          = (get_max_neighbors, wrapDroppingSetter set_max_neighbors,
             Nothing)

instance NodeProperty NavigationAgent2D "max_speed" Float 'False
         where
        nodeProperty
          = (get_max_speed, wrapDroppingSetter set_max_speed, Nothing)

instance NodeProperty NavigationAgent2D "navigation_layers" Int
           'False
         where
        nodeProperty
          = (get_navigation_layers, wrapDroppingSetter set_navigation_layers,
             Nothing)

instance NodeProperty NavigationAgent2D "neighbor_dist" Float
           'False
         where
        nodeProperty
          = (get_neighbor_dist, wrapDroppingSetter set_neighbor_dist,
             Nothing)

instance NodeProperty NavigationAgent2D "path_desired_distance"
           Float
           'False
         where
        nodeProperty
          = (get_path_desired_distance,
             wrapDroppingSetter set_path_desired_distance, Nothing)

instance NodeProperty NavigationAgent2D "path_max_distance" Float
           'False
         where
        nodeProperty
          = (get_path_max_distance, wrapDroppingSetter set_path_max_distance,
             Nothing)

instance NodeProperty NavigationAgent2D "radius" Float 'False where
        nodeProperty = (get_radius, wrapDroppingSetter set_radius, Nothing)

instance NodeProperty NavigationAgent2D "target_desired_distance"
           Float
           'False
         where
        nodeProperty
          = (get_target_desired_distance,
             wrapDroppingSetter set_target_desired_distance, Nothing)

instance NodeProperty NavigationAgent2D "target_location" Vector2
           'False
         where
        nodeProperty
          = (get_target_location, wrapDroppingSetter set_target_location,
             Nothing)

instance NodeProperty NavigationAgent2D "time_horizon" Float 'False
         where
        nodeProperty
          = (get_time_horizon, wrapDroppingSetter set_time_horizon, Nothing)

{-# NOINLINE bindNavigationAgent2D__avoidance_done #-}

bindNavigationAgent2D__avoidance_done :: MethodBind
bindNavigationAgent2D__avoidance_done
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "_avoidance_done" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_avoidance_done ::
                  (NavigationAgent2D :< cls, Object :< cls) =>
                  cls -> Vector3 -> IO ()
_avoidance_done cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D__avoidance_done
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "_avoidance_done" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent2D._avoidance_done

{-# NOINLINE bindNavigationAgent2D_distance_to_target #-}

-- | Returns the distance to the target location, using the agent's global position. The user must set @target_location@ in order for this to be accurate.
bindNavigationAgent2D_distance_to_target :: MethodBind
bindNavigationAgent2D_distance_to_target
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "distance_to_target" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the distance to the target location, using the agent's global position. The user must set @target_location@ in order for this to be accurate.
distance_to_target ::
                     (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Float
distance_to_target cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_distance_to_target
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "distance_to_target" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.distance_to_target

{-# NOINLINE bindNavigationAgent2D_get_avoidance_enabled #-}

-- | If @true@ the agent is registered for an RVO avoidance callback on the @Navigation2DServer@. When @method set_velocity@ is used and the processing is completed a @safe_velocity@ Vector2 is received with a signal connection to @signal velocity_computed@. Avoidance processing with many registered agents has a significant performance cost and should only be enabled on agents that currently require it.
bindNavigationAgent2D_get_avoidance_enabled :: MethodBind
bindNavigationAgent2D_get_avoidance_enabled
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_avoidance_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@ the agent is registered for an RVO avoidance callback on the @Navigation2DServer@. When @method set_velocity@ is used and the processing is completed a @safe_velocity@ Vector2 is received with a signal connection to @signal velocity_computed@. Avoidance processing with many registered agents has a significant performance cost and should only be enabled on agents that currently require it.
get_avoidance_enabled ::
                        (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Bool
get_avoidance_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_get_avoidance_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_avoidance_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.get_avoidance_enabled

{-# NOINLINE bindNavigationAgent2D_get_final_location #-}

-- | Returns the reachable final location in global coordinates. This can change if the navigation path is altered in any way. Because of this, it would be best to check this each frame.
bindNavigationAgent2D_get_final_location :: MethodBind
bindNavigationAgent2D_get_final_location
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_final_location" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the reachable final location in global coordinates. This can change if the navigation path is altered in any way. Because of this, it would be best to check this each frame.
get_final_location ::
                     (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Vector2
get_final_location cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_get_final_location
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_final_location" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.get_final_location

{-# NOINLINE bindNavigationAgent2D_get_max_neighbors #-}

-- | The maximum number of neighbors for the agent to consider.
bindNavigationAgent2D_get_max_neighbors :: MethodBind
bindNavigationAgent2D_get_max_neighbors
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_max_neighbors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum number of neighbors for the agent to consider.
get_max_neighbors ::
                    (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Int
get_max_neighbors cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_get_max_neighbors
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_max_neighbors" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.get_max_neighbors

{-# NOINLINE bindNavigationAgent2D_get_max_speed #-}

-- | The maximum speed that an agent can move.
bindNavigationAgent2D_get_max_speed :: MethodBind
bindNavigationAgent2D_get_max_speed
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_max_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum speed that an agent can move.
get_max_speed ::
                (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Float
get_max_speed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_get_max_speed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_max_speed" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.get_max_speed

{-# NOINLINE bindNavigationAgent2D_get_nav_path #-}

-- | Returns this agent's current path from start to finish in global coordinates. The path only updates when the target location is changed or the agent requires a repath. The path array is not intended to be used in direct path movement as the agent has its own internal path logic that would get corrupted by changing the path array manually. Use the intended @method get_next_location@ once every physics frame to receive the next path point for the agents movement as this function also updates the internal path logic.
bindNavigationAgent2D_get_nav_path :: MethodBind
bindNavigationAgent2D_get_nav_path
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_nav_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns this agent's current path from start to finish in global coordinates. The path only updates when the target location is changed or the agent requires a repath. The path array is not intended to be used in direct path movement as the agent has its own internal path logic that would get corrupted by changing the path array manually. Use the intended @method get_next_location@ once every physics frame to receive the next path point for the agents movement as this function also updates the internal path logic.
get_nav_path ::
               (NavigationAgent2D :< cls, Object :< cls) =>
               cls -> IO PoolVector2Array
get_nav_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_get_nav_path
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_nav_path" '[]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.get_nav_path

{-# NOINLINE bindNavigationAgent2D_get_nav_path_index #-}

-- | Returns which index the agent is currently on in the navigation path's @PoolVector2Array@.
bindNavigationAgent2D_get_nav_path_index :: MethodBind
bindNavigationAgent2D_get_nav_path_index
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_nav_path_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns which index the agent is currently on in the navigation path's @PoolVector2Array@.
get_nav_path_index ::
                     (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Int
get_nav_path_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_get_nav_path_index
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_nav_path_index" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.get_nav_path_index

{-# NOINLINE bindNavigationAgent2D_get_navigation #-}

-- | Returns the @Navigation2D@ node that the agent is using for its navigation system.
bindNavigationAgent2D_get_navigation :: MethodBind
bindNavigationAgent2D_get_navigation
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_navigation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Navigation2D@ node that the agent is using for its navigation system.
get_navigation ::
                 (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Node
get_navigation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_get_navigation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod NavigationAgent2D "get_navigation" '[]
           (IO Node)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.get_navigation

{-# NOINLINE bindNavigationAgent2D_get_navigation_layers #-}

-- | A bitfield determining all navigation map layers the @NavigationAgent2D@ belongs to. On path requests the agent will ignore navmeshes without at least one matching layer.
bindNavigationAgent2D_get_navigation_layers :: MethodBind
bindNavigationAgent2D_get_navigation_layers
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_navigation_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A bitfield determining all navigation map layers the @NavigationAgent2D@ belongs to. On path requests the agent will ignore navmeshes without at least one matching layer.
get_navigation_layers ::
                        (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Int
get_navigation_layers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_get_navigation_layers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_navigation_layers" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.get_navigation_layers

{-# NOINLINE bindNavigationAgent2D_get_navigation_map #-}

-- | Returns the @RID@ of the navigation map for this NavigationAgent node. This function returns always the map set on the NavigationAgent node and not the map of the abstract agent on the NavigationServer. If the agent map is changed directly with the NavigationServer API the NavigationAgent node will not be aware of the map change. Use @method set_navigation_map@ to change the navigation map for the NavigationAgent and also update the agent on the NavigationServer.
bindNavigationAgent2D_get_navigation_map :: MethodBind
bindNavigationAgent2D_get_navigation_map
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_navigation_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of the navigation map for this NavigationAgent node. This function returns always the map set on the NavigationAgent node and not the map of the abstract agent on the NavigationServer. If the agent map is changed directly with the NavigationServer API the NavigationAgent node will not be aware of the map change. Use @method set_navigation_map@ to change the navigation map for the NavigationAgent and also update the agent on the NavigationServer.
get_navigation_map ::
                     (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Rid
get_navigation_map cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_get_navigation_map
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_navigation_map" '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.get_navigation_map

{-# NOINLINE bindNavigationAgent2D_get_neighbor_dist #-}

-- | The distance to search for other agents.
bindNavigationAgent2D_get_neighbor_dist :: MethodBind
bindNavigationAgent2D_get_neighbor_dist
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_neighbor_dist" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance to search for other agents.
get_neighbor_dist ::
                    (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Float
get_neighbor_dist cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_get_neighbor_dist
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_neighbor_dist" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.get_neighbor_dist

{-# NOINLINE bindNavigationAgent2D_get_next_location #-}

-- | Returns the next location in global coordinates that can be moved to, making sure that there are no static objects in the way. If the agent does not have a navigation path, it will return the position of the agent's parent. The use of this function once every physics frame is required to update the internal path logic of the NavigationAgent.
bindNavigationAgent2D_get_next_location :: MethodBind
bindNavigationAgent2D_get_next_location
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_next_location" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next location in global coordinates that can be moved to, making sure that there are no static objects in the way. If the agent does not have a navigation path, it will return the position of the agent's parent. The use of this function once every physics frame is required to update the internal path logic of the NavigationAgent.
get_next_location ::
                    (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Vector2
get_next_location cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_get_next_location
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_next_location" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.get_next_location

{-# NOINLINE bindNavigationAgent2D_get_path_desired_distance #-}

-- | The distance threshold before a path point is considered to be reached. This will allow an agent to not have to hit a path point on the path exactly, but in the area. If this value is set to high the NavigationAgent will skip points on the path which can lead to leaving the navigation mesh. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the next point on each physics frame update.
bindNavigationAgent2D_get_path_desired_distance :: MethodBind
bindNavigationAgent2D_get_path_desired_distance
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_path_desired_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance threshold before a path point is considered to be reached. This will allow an agent to not have to hit a path point on the path exactly, but in the area. If this value is set to high the NavigationAgent will skip points on the path which can lead to leaving the navigation mesh. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the next point on each physics frame update.
get_path_desired_distance ::
                            (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Float
get_path_desired_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationAgent2D_get_path_desired_distance
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_path_desired_distance"
           '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.get_path_desired_distance

{-# NOINLINE bindNavigationAgent2D_get_path_max_distance #-}

-- | The maximum distance the agent is allowed away from the ideal path to the final location. This can happen due to trying to avoid collisions. When the maximum distance is exceeded, it recalculates the ideal path.
bindNavigationAgent2D_get_path_max_distance :: MethodBind
bindNavigationAgent2D_get_path_max_distance
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_path_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum distance the agent is allowed away from the ideal path to the final location. This can happen due to trying to avoid collisions. When the maximum distance is exceeded, it recalculates the ideal path.
get_path_max_distance ::
                        (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Float
get_path_max_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_get_path_max_distance
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_path_max_distance" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.get_path_max_distance

{-# NOINLINE bindNavigationAgent2D_get_radius #-}

-- | The radius of the avoidance agent. This is the "body" of the avoidance agent and not the avoidance maneuver starting radius (which is controlled by @neighbor_dist@).
--   			Does not affect normal pathfinding.
bindNavigationAgent2D_get_radius :: MethodBind
bindNavigationAgent2D_get_radius
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The radius of the avoidance agent. This is the "body" of the avoidance agent and not the avoidance maneuver starting radius (which is controlled by @neighbor_dist@).
--   			Does not affect normal pathfinding.
get_radius ::
             (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_get_radius
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_radius" '[] (IO Float)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.get_radius

{-# NOINLINE bindNavigationAgent2D_get_rid #-}

-- | Returns the @RID@ of this agent on the @Navigation2DServer@.
bindNavigationAgent2D_get_rid :: MethodBind
bindNavigationAgent2D_get_rid
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of this agent on the @Navigation2DServer@.
get_rid ::
          (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Rid
get_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_get_rid (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_rid" '[] (IO Rid) where
        nodeMethod = Godot.Core.NavigationAgent2D.get_rid

{-# NOINLINE bindNavigationAgent2D_get_target_desired_distance #-}

-- | The distance threshold before the final target point is considered to be reached. This will allow an agent to not have to hit the point of the final target exactly, but only the area. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the final target point on each physics frame update.
bindNavigationAgent2D_get_target_desired_distance :: MethodBind
bindNavigationAgent2D_get_target_desired_distance
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_target_desired_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance threshold before the final target point is considered to be reached. This will allow an agent to not have to hit the point of the final target exactly, but only the area. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the final target point on each physics frame update.
get_target_desired_distance ::
                              (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Float
get_target_desired_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationAgent2D_get_target_desired_distance
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_target_desired_distance"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.NavigationAgent2D.get_target_desired_distance

{-# NOINLINE bindNavigationAgent2D_get_target_location #-}

-- | The user-defined target location. Setting this property will clear the current navigation path.
bindNavigationAgent2D_get_target_location :: MethodBind
bindNavigationAgent2D_get_target_location
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_target_location" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The user-defined target location. Setting this property will clear the current navigation path.
get_target_location ::
                      (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Vector2
get_target_location cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_get_target_location
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_target_location" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.get_target_location

{-# NOINLINE bindNavigationAgent2D_get_time_horizon #-}

-- | The minimal amount of time for which this agent's velocities, that are computed with the collision avoidance algorithm, are safe with respect to other agents. The larger the number, the sooner the agent will respond to other agents, but the less freedom in choosing its velocities. Must be positive.
bindNavigationAgent2D_get_time_horizon :: MethodBind
bindNavigationAgent2D_get_time_horizon
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "get_time_horizon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimal amount of time for which this agent's velocities, that are computed with the collision avoidance algorithm, are safe with respect to other agents. The larger the number, the sooner the agent will respond to other agents, but the less freedom in choosing its velocities. Must be positive.
get_time_horizon ::
                   (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Float
get_time_horizon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_get_time_horizon
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "get_time_horizon" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.get_time_horizon

{-# NOINLINE bindNavigationAgent2D_is_navigation_finished #-}

-- | Returns @true@ if the navigation path's final location has been reached.
bindNavigationAgent2D_is_navigation_finished :: MethodBind
bindNavigationAgent2D_is_navigation_finished
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "is_navigation_finished" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the navigation path's final location has been reached.
is_navigation_finished ::
                         (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Bool
is_navigation_finished cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_is_navigation_finished
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "is_navigation_finished" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.is_navigation_finished

{-# NOINLINE bindNavigationAgent2D_is_target_reachable #-}

-- | Returns @true@ if @target_location@ is reachable.
bindNavigationAgent2D_is_target_reachable :: MethodBind
bindNavigationAgent2D_is_target_reachable
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "is_target_reachable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if @target_location@ is reachable.
is_target_reachable ::
                      (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Bool
is_target_reachable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_is_target_reachable
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "is_target_reachable" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.is_target_reachable

{-# NOINLINE bindNavigationAgent2D_is_target_reached #-}

-- | Returns @true@ if @target_location@ is reached. It may not always be possible to reach the target location. It should always be possible to reach the final location though. See @method get_final_location@.
bindNavigationAgent2D_is_target_reached :: MethodBind
bindNavigationAgent2D_is_target_reached
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "is_target_reached" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if @target_location@ is reached. It may not always be possible to reach the target location. It should always be possible to reach the final location though. See @method get_final_location@.
is_target_reached ::
                    (NavigationAgent2D :< cls, Object :< cls) => cls -> IO Bool
is_target_reached cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_is_target_reached
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "is_target_reached" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationAgent2D.is_target_reached

{-# NOINLINE bindNavigationAgent2D_set_avoidance_enabled #-}

-- | If @true@ the agent is registered for an RVO avoidance callback on the @Navigation2DServer@. When @method set_velocity@ is used and the processing is completed a @safe_velocity@ Vector2 is received with a signal connection to @signal velocity_computed@. Avoidance processing with many registered agents has a significant performance cost and should only be enabled on agents that currently require it.
bindNavigationAgent2D_set_avoidance_enabled :: MethodBind
bindNavigationAgent2D_set_avoidance_enabled
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "set_avoidance_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@ the agent is registered for an RVO avoidance callback on the @Navigation2DServer@. When @method set_velocity@ is used and the processing is completed a @safe_velocity@ Vector2 is received with a signal connection to @signal velocity_computed@. Avoidance processing with many registered agents has a significant performance cost and should only be enabled on agents that currently require it.
set_avoidance_enabled ::
                        (NavigationAgent2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_avoidance_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_set_avoidance_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "set_avoidance_enabled"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent2D.set_avoidance_enabled

{-# NOINLINE bindNavigationAgent2D_set_max_neighbors #-}

-- | The maximum number of neighbors for the agent to consider.
bindNavigationAgent2D_set_max_neighbors :: MethodBind
bindNavigationAgent2D_set_max_neighbors
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "set_max_neighbors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum number of neighbors for the agent to consider.
set_max_neighbors ::
                    (NavigationAgent2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_max_neighbors cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_set_max_neighbors
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "set_max_neighbors" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent2D.set_max_neighbors

{-# NOINLINE bindNavigationAgent2D_set_max_speed #-}

-- | The maximum speed that an agent can move.
bindNavigationAgent2D_set_max_speed :: MethodBind
bindNavigationAgent2D_set_max_speed
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "set_max_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum speed that an agent can move.
set_max_speed ::
                (NavigationAgent2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_max_speed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_set_max_speed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "set_max_speed" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent2D.set_max_speed

{-# NOINLINE bindNavigationAgent2D_set_navigation #-}

-- | Sets the @Navigation2D@ node used by the agent. Useful when you don't want to make the agent a child of a @Navigation2D@ node.
bindNavigationAgent2D_set_navigation :: MethodBind
bindNavigationAgent2D_set_navigation
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "set_navigation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Navigation2D@ node used by the agent. Useful when you don't want to make the agent a child of a @Navigation2D@ node.
set_navigation ::
                 (NavigationAgent2D :< cls, Object :< cls) => cls -> Node -> IO ()
set_navigation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_set_navigation
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "set_navigation" '[Node]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent2D.set_navigation

{-# NOINLINE bindNavigationAgent2D_set_navigation_layers #-}

-- | A bitfield determining all navigation map layers the @NavigationAgent2D@ belongs to. On path requests the agent will ignore navmeshes without at least one matching layer.
bindNavigationAgent2D_set_navigation_layers :: MethodBind
bindNavigationAgent2D_set_navigation_layers
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "set_navigation_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A bitfield determining all navigation map layers the @NavigationAgent2D@ belongs to. On path requests the agent will ignore navmeshes without at least one matching layer.
set_navigation_layers ::
                        (NavigationAgent2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_navigation_layers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_set_navigation_layers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "set_navigation_layers"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent2D.set_navigation_layers

{-# NOINLINE bindNavigationAgent2D_set_navigation_map #-}

-- | Sets the @RID@ of the navigation map this NavigationAgent node should use and also updates the @agent@ on the NavigationServer.
bindNavigationAgent2D_set_navigation_map :: MethodBind
bindNavigationAgent2D_set_navigation_map
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "set_navigation_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @RID@ of the navigation map this NavigationAgent node should use and also updates the @agent@ on the NavigationServer.
set_navigation_map ::
                     (NavigationAgent2D :< cls, Object :< cls) => cls -> Rid -> IO ()
set_navigation_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_set_navigation_map
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "set_navigation_map" '[Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent2D.set_navigation_map

{-# NOINLINE bindNavigationAgent2D_set_neighbor_dist #-}

-- | The distance to search for other agents.
bindNavigationAgent2D_set_neighbor_dist :: MethodBind
bindNavigationAgent2D_set_neighbor_dist
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "set_neighbor_dist" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance to search for other agents.
set_neighbor_dist ::
                    (NavigationAgent2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_neighbor_dist cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_set_neighbor_dist
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "set_neighbor_dist" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent2D.set_neighbor_dist

{-# NOINLINE bindNavigationAgent2D_set_path_desired_distance #-}

-- | The distance threshold before a path point is considered to be reached. This will allow an agent to not have to hit a path point on the path exactly, but in the area. If this value is set to high the NavigationAgent will skip points on the path which can lead to leaving the navigation mesh. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the next point on each physics frame update.
bindNavigationAgent2D_set_path_desired_distance :: MethodBind
bindNavigationAgent2D_set_path_desired_distance
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "set_path_desired_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance threshold before a path point is considered to be reached. This will allow an agent to not have to hit a path point on the path exactly, but in the area. If this value is set to high the NavigationAgent will skip points on the path which can lead to leaving the navigation mesh. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the next point on each physics frame update.
set_path_desired_distance ::
                            (NavigationAgent2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_path_desired_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationAgent2D_set_path_desired_distance
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "set_path_desired_distance"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent2D.set_path_desired_distance

{-# NOINLINE bindNavigationAgent2D_set_path_max_distance #-}

-- | The maximum distance the agent is allowed away from the ideal path to the final location. This can happen due to trying to avoid collisions. When the maximum distance is exceeded, it recalculates the ideal path.
bindNavigationAgent2D_set_path_max_distance :: MethodBind
bindNavigationAgent2D_set_path_max_distance
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "set_path_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum distance the agent is allowed away from the ideal path to the final location. This can happen due to trying to avoid collisions. When the maximum distance is exceeded, it recalculates the ideal path.
set_path_max_distance ::
                        (NavigationAgent2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_path_max_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_set_path_max_distance
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "set_path_max_distance"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent2D.set_path_max_distance

{-# NOINLINE bindNavigationAgent2D_set_radius #-}

-- | The radius of the avoidance agent. This is the "body" of the avoidance agent and not the avoidance maneuver starting radius (which is controlled by @neighbor_dist@).
--   			Does not affect normal pathfinding.
bindNavigationAgent2D_set_radius :: MethodBind
bindNavigationAgent2D_set_radius
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The radius of the avoidance agent. This is the "body" of the avoidance agent and not the avoidance maneuver starting radius (which is controlled by @neighbor_dist@).
--   			Does not affect normal pathfinding.
set_radius ::
             (NavigationAgent2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_set_radius
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "set_radius" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent2D.set_radius

{-# NOINLINE bindNavigationAgent2D_set_target_desired_distance #-}

-- | The distance threshold before the final target point is considered to be reached. This will allow an agent to not have to hit the point of the final target exactly, but only the area. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the final target point on each physics frame update.
bindNavigationAgent2D_set_target_desired_distance :: MethodBind
bindNavigationAgent2D_set_target_desired_distance
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "set_target_desired_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance threshold before the final target point is considered to be reached. This will allow an agent to not have to hit the point of the final target exactly, but only the area. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the final target point on each physics frame update.
set_target_desired_distance ::
                              (NavigationAgent2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_target_desired_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationAgent2D_set_target_desired_distance
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "set_target_desired_distance"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.NavigationAgent2D.set_target_desired_distance

{-# NOINLINE bindNavigationAgent2D_set_target_location #-}

-- | The user-defined target location. Setting this property will clear the current navigation path.
bindNavigationAgent2D_set_target_location :: MethodBind
bindNavigationAgent2D_set_target_location
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "set_target_location" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The user-defined target location. Setting this property will clear the current navigation path.
set_target_location ::
                      (NavigationAgent2D :< cls, Object :< cls) =>
                      cls -> Vector2 -> IO ()
set_target_location cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_set_target_location
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "set_target_location"
           '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent2D.set_target_location

{-# NOINLINE bindNavigationAgent2D_set_time_horizon #-}

-- | The minimal amount of time for which this agent's velocities, that are computed with the collision avoidance algorithm, are safe with respect to other agents. The larger the number, the sooner the agent will respond to other agents, but the less freedom in choosing its velocities. Must be positive.
bindNavigationAgent2D_set_time_horizon :: MethodBind
bindNavigationAgent2D_set_time_horizon
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "set_time_horizon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimal amount of time for which this agent's velocities, that are computed with the collision avoidance algorithm, are safe with respect to other agents. The larger the number, the sooner the agent will respond to other agents, but the less freedom in choosing its velocities. Must be positive.
set_time_horizon ::
                   (NavigationAgent2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_time_horizon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_set_time_horizon
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "set_time_horizon" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent2D.set_time_horizon

{-# NOINLINE bindNavigationAgent2D_set_velocity #-}

-- | Sends the passed in velocity to the collision avoidance algorithm. It will adjust the velocity to avoid collisions. Once the adjustment to the velocity is complete, it will emit the @signal velocity_computed@ signal.
bindNavigationAgent2D_set_velocity :: MethodBind
bindNavigationAgent2D_set_velocity
  = unsafePerformIO $
      withCString "NavigationAgent2D" $
        \ clsNamePtr ->
          withCString "set_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends the passed in velocity to the collision avoidance algorithm. It will adjust the velocity to avoid collisions. Once the adjustment to the velocity is complete, it will emit the @signal velocity_computed@ signal.
set_velocity ::
               (NavigationAgent2D :< cls, Object :< cls) =>
               cls -> Vector2 -> IO ()
set_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent2D_set_velocity
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent2D "set_velocity" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent2D.set_velocity