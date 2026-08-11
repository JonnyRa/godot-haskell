{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NavigationAgent
       (Godot.Core.NavigationAgent.sig_navigation_finished,
        Godot.Core.NavigationAgent.sig_path_changed,
        Godot.Core.NavigationAgent.sig_target_reached,
        Godot.Core.NavigationAgent.sig_velocity_computed,
        Godot.Core.NavigationAgent._avoidance_done,
        Godot.Core.NavigationAgent.distance_to_target,
        Godot.Core.NavigationAgent.get_agent_height_offset,
        Godot.Core.NavigationAgent.get_avoidance_enabled,
        Godot.Core.NavigationAgent.get_final_location,
        Godot.Core.NavigationAgent.get_ignore_y,
        Godot.Core.NavigationAgent.get_max_neighbors,
        Godot.Core.NavigationAgent.get_max_speed,
        Godot.Core.NavigationAgent.get_nav_path,
        Godot.Core.NavigationAgent.get_nav_path_index,
        Godot.Core.NavigationAgent.get_navigation,
        Godot.Core.NavigationAgent.get_navigation_layers,
        Godot.Core.NavigationAgent.get_navigation_map,
        Godot.Core.NavigationAgent.get_neighbor_dist,
        Godot.Core.NavigationAgent.get_next_location,
        Godot.Core.NavigationAgent.get_path_desired_distance,
        Godot.Core.NavigationAgent.get_path_max_distance,
        Godot.Core.NavigationAgent.get_radius,
        Godot.Core.NavigationAgent.get_rid,
        Godot.Core.NavigationAgent.get_target_desired_distance,
        Godot.Core.NavigationAgent.get_target_location,
        Godot.Core.NavigationAgent.get_time_horizon,
        Godot.Core.NavigationAgent.is_navigation_finished,
        Godot.Core.NavigationAgent.is_target_reachable,
        Godot.Core.NavigationAgent.is_target_reached,
        Godot.Core.NavigationAgent.set_agent_height_offset,
        Godot.Core.NavigationAgent.set_avoidance_enabled,
        Godot.Core.NavigationAgent.set_ignore_y,
        Godot.Core.NavigationAgent.set_max_neighbors,
        Godot.Core.NavigationAgent.set_max_speed,
        Godot.Core.NavigationAgent.set_navigation,
        Godot.Core.NavigationAgent.set_navigation_layers,
        Godot.Core.NavigationAgent.set_navigation_map,
        Godot.Core.NavigationAgent.set_neighbor_dist,
        Godot.Core.NavigationAgent.set_path_desired_distance,
        Godot.Core.NavigationAgent.set_path_max_distance,
        Godot.Core.NavigationAgent.set_radius,
        Godot.Core.NavigationAgent.set_target_desired_distance,
        Godot.Core.NavigationAgent.set_target_location,
        Godot.Core.NavigationAgent.set_time_horizon,
        Godot.Core.NavigationAgent.set_velocity)
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
                        Godot.Internal.Dispatch.Signal NavigationAgent
sig_navigation_finished
  = Godot.Internal.Dispatch.Signal "navigation_finished"

instance NodeSignal NavigationAgent "navigation_finished" '[]

-- | Notifies when the navigation path changes. This can be triggered by the navigation system or by the user changing the path.
sig_path_changed :: Godot.Internal.Dispatch.Signal NavigationAgent
sig_path_changed = Godot.Internal.Dispatch.Signal "path_changed"

instance NodeSignal NavigationAgent "path_changed" '[]

-- | Notifies when the player-defined @target_location@ is reached.
sig_target_reached ::
                   Godot.Internal.Dispatch.Signal NavigationAgent
sig_target_reached
  = Godot.Internal.Dispatch.Signal "target_reached"

instance NodeSignal NavigationAgent "target_reached" '[]

-- | Notifies when the collision avoidance velocity is calculated after a call to @method set_velocity@. Only emitted when @avoidance_enabled@ is true.
sig_velocity_computed ::
                      Godot.Internal.Dispatch.Signal NavigationAgent
sig_velocity_computed
  = Godot.Internal.Dispatch.Signal "velocity_computed"

instance NodeSignal NavigationAgent "velocity_computed" '[Vector3]

instance NodeProperty NavigationAgent "agent_height_offset" Float
           'False
         where
        nodeProperty
          = (get_agent_height_offset,
             wrapDroppingSetter set_agent_height_offset, Nothing)

instance NodeProperty NavigationAgent "avoidance_enabled" Bool
           'False
         where
        nodeProperty
          = (get_avoidance_enabled, wrapDroppingSetter set_avoidance_enabled,
             Nothing)

instance NodeProperty NavigationAgent "ignore_y" Bool 'False where
        nodeProperty
          = (get_ignore_y, wrapDroppingSetter set_ignore_y, Nothing)

instance NodeProperty NavigationAgent "max_neighbors" Int 'False
         where
        nodeProperty
          = (get_max_neighbors, wrapDroppingSetter set_max_neighbors,
             Nothing)

instance NodeProperty NavigationAgent "max_speed" Float 'False
         where
        nodeProperty
          = (get_max_speed, wrapDroppingSetter set_max_speed, Nothing)

instance NodeProperty NavigationAgent "navigation_layers" Int
           'False
         where
        nodeProperty
          = (get_navigation_layers, wrapDroppingSetter set_navigation_layers,
             Nothing)

instance NodeProperty NavigationAgent "neighbor_dist" Float 'False
         where
        nodeProperty
          = (get_neighbor_dist, wrapDroppingSetter set_neighbor_dist,
             Nothing)

instance NodeProperty NavigationAgent "path_desired_distance" Float
           'False
         where
        nodeProperty
          = (get_path_desired_distance,
             wrapDroppingSetter set_path_desired_distance, Nothing)

instance NodeProperty NavigationAgent "path_max_distance" Float
           'False
         where
        nodeProperty
          = (get_path_max_distance, wrapDroppingSetter set_path_max_distance,
             Nothing)

instance NodeProperty NavigationAgent "radius" Float 'False where
        nodeProperty = (get_radius, wrapDroppingSetter set_radius, Nothing)

instance NodeProperty NavigationAgent "target_desired_distance"
           Float
           'False
         where
        nodeProperty
          = (get_target_desired_distance,
             wrapDroppingSetter set_target_desired_distance, Nothing)

instance NodeProperty NavigationAgent "target_location" Vector3
           'False
         where
        nodeProperty
          = (get_target_location, wrapDroppingSetter set_target_location,
             Nothing)

instance NodeProperty NavigationAgent "time_horizon" Float 'False
         where
        nodeProperty
          = (get_time_horizon, wrapDroppingSetter set_time_horizon, Nothing)

{-# NOINLINE bindNavigationAgent__avoidance_done #-}

bindNavigationAgent__avoidance_done :: MethodBind
bindNavigationAgent__avoidance_done
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "_avoidance_done" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_avoidance_done ::
                  (NavigationAgent :< cls, Object :< cls) => cls -> Vector3 -> IO ()
_avoidance_done cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent__avoidance_done
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "_avoidance_done" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent._avoidance_done

{-# NOINLINE bindNavigationAgent_distance_to_target #-}

-- | Returns the distance to the target location, using the agent's global position. The user must set @target_location@ in order for this to be accurate.
bindNavigationAgent_distance_to_target :: MethodBind
bindNavigationAgent_distance_to_target
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "distance_to_target" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the distance to the target location, using the agent's global position. The user must set @target_location@ in order for this to be accurate.
distance_to_target ::
                     (NavigationAgent :< cls, Object :< cls) => cls -> IO Float
distance_to_target cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_distance_to_target
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "distance_to_target" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationAgent.distance_to_target

{-# NOINLINE bindNavigationAgent_get_agent_height_offset #-}

-- | The NavigationAgent height offset is subtracted from the y-axis value of any vector path position for this NavigationAgent. The NavigationAgent height offset does not change or influence the navigation mesh or pathfinding query result. Additional navigation maps that use regions with navigation meshes that the developer baked with appropriate agent radius or height values are required to support different-sized agents.
bindNavigationAgent_get_agent_height_offset :: MethodBind
bindNavigationAgent_get_agent_height_offset
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_agent_height_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The NavigationAgent height offset is subtracted from the y-axis value of any vector path position for this NavigationAgent. The NavigationAgent height offset does not change or influence the navigation mesh or pathfinding query result. Additional navigation maps that use regions with navigation meshes that the developer baked with appropriate agent radius or height values are required to support different-sized agents.
get_agent_height_offset ::
                          (NavigationAgent :< cls, Object :< cls) => cls -> IO Float
get_agent_height_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_agent_height_offset
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_agent_height_offset" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_agent_height_offset

{-# NOINLINE bindNavigationAgent_get_avoidance_enabled #-}

-- | If @true@ the agent is registered for an RVO avoidance callback on the @NavigationServer@. When @method set_velocity@ is used and the processing is completed a @safe_velocity@ Vector3 is received with a signal connection to @signal velocity_computed@. Avoidance processing with many registered agents has a significant performance cost and should only be enabled on agents that currently require it.
bindNavigationAgent_get_avoidance_enabled :: MethodBind
bindNavigationAgent_get_avoidance_enabled
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_avoidance_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@ the agent is registered for an RVO avoidance callback on the @NavigationServer@. When @method set_velocity@ is used and the processing is completed a @safe_velocity@ Vector3 is received with a signal connection to @signal velocity_computed@. Avoidance processing with many registered agents has a significant performance cost and should only be enabled on agents that currently require it.
get_avoidance_enabled ::
                        (NavigationAgent :< cls, Object :< cls) => cls -> IO Bool
get_avoidance_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_avoidance_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_avoidance_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_avoidance_enabled

{-# NOINLINE bindNavigationAgent_get_final_location #-}

-- | Returns the reachable final location in global coordinates. This can change if the navigation path is altered in any way. Because of this, it would be best to check this each frame.
bindNavigationAgent_get_final_location :: MethodBind
bindNavigationAgent_get_final_location
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_final_location" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the reachable final location in global coordinates. This can change if the navigation path is altered in any way. Because of this, it would be best to check this each frame.
get_final_location ::
                     (NavigationAgent :< cls, Object :< cls) => cls -> IO Vector3
get_final_location cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_final_location
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_final_location" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_final_location

{-# NOINLINE bindNavigationAgent_get_ignore_y #-}

-- | Ignores collisions on the Y axis. Must be @true@ to move on a horizontal plane.
bindNavigationAgent_get_ignore_y :: MethodBind
bindNavigationAgent_get_ignore_y
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_ignore_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Ignores collisions on the Y axis. Must be @true@ to move on a horizontal plane.
get_ignore_y ::
               (NavigationAgent :< cls, Object :< cls) => cls -> IO Bool
get_ignore_y cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_ignore_y
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_ignore_y" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_ignore_y

{-# NOINLINE bindNavigationAgent_get_max_neighbors #-}

-- | The maximum number of neighbors for the agent to consider.
bindNavigationAgent_get_max_neighbors :: MethodBind
bindNavigationAgent_get_max_neighbors
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_max_neighbors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum number of neighbors for the agent to consider.
get_max_neighbors ::
                    (NavigationAgent :< cls, Object :< cls) => cls -> IO Int
get_max_neighbors cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_max_neighbors
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_max_neighbors" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_max_neighbors

{-# NOINLINE bindNavigationAgent_get_max_speed #-}

-- | The maximum speed that an agent can move.
bindNavigationAgent_get_max_speed :: MethodBind
bindNavigationAgent_get_max_speed
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_max_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum speed that an agent can move.
get_max_speed ::
                (NavigationAgent :< cls, Object :< cls) => cls -> IO Float
get_max_speed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_max_speed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_max_speed" '[] (IO Float)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_max_speed

{-# NOINLINE bindNavigationAgent_get_nav_path #-}

-- | Returns this agent's current path from start to finish in global coordinates. The path only updates when the target location is changed or the agent requires a repath. The path array is not intended to be used in direct path movement as the agent has its own internal path logic that would get corrupted by changing the path array manually. Use the intended @method get_next_location@ once every physics frame to receive the next path point for the agents movement as this function also updates the internal path logic.
bindNavigationAgent_get_nav_path :: MethodBind
bindNavigationAgent_get_nav_path
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_nav_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns this agent's current path from start to finish in global coordinates. The path only updates when the target location is changed or the agent requires a repath. The path array is not intended to be used in direct path movement as the agent has its own internal path logic that would get corrupted by changing the path array manually. Use the intended @method get_next_location@ once every physics frame to receive the next path point for the agents movement as this function also updates the internal path logic.
get_nav_path ::
               (NavigationAgent :< cls, Object :< cls) =>
               cls -> IO PoolVector3Array
get_nav_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_nav_path
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_nav_path" '[]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_nav_path

{-# NOINLINE bindNavigationAgent_get_nav_path_index #-}

-- | Returns which index the agent is currently on in the navigation path's @PoolVector3Array@.
bindNavigationAgent_get_nav_path_index :: MethodBind
bindNavigationAgent_get_nav_path_index
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_nav_path_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns which index the agent is currently on in the navigation path's @PoolVector3Array@.
get_nav_path_index ::
                     (NavigationAgent :< cls, Object :< cls) => cls -> IO Int
get_nav_path_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_nav_path_index
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_nav_path_index" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_nav_path_index

{-# NOINLINE bindNavigationAgent_get_navigation #-}

-- | Returns the @Navigation@ node that the agent is using for its navigation system.
bindNavigationAgent_get_navigation :: MethodBind
bindNavigationAgent_get_navigation
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_navigation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Navigation@ node that the agent is using for its navigation system.
get_navigation ::
                 (NavigationAgent :< cls, Object :< cls) => cls -> IO Node
get_navigation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_navigation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod NavigationAgent "get_navigation" '[] (IO Node)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_navigation

{-# NOINLINE bindNavigationAgent_get_navigation_layers #-}

-- | A bitfield determining all navigation map layers the @NavigationAgent@ belongs to. On path requests the agent will ignore navmeshes without at least one matching layer.
bindNavigationAgent_get_navigation_layers :: MethodBind
bindNavigationAgent_get_navigation_layers
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_navigation_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A bitfield determining all navigation map layers the @NavigationAgent@ belongs to. On path requests the agent will ignore navmeshes without at least one matching layer.
get_navigation_layers ::
                        (NavigationAgent :< cls, Object :< cls) => cls -> IO Int
get_navigation_layers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_navigation_layers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_navigation_layers" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_navigation_layers

{-# NOINLINE bindNavigationAgent_get_navigation_map #-}

-- | Returns the @RID@ of the navigation map for this NavigationAgent node. This function returns always the map set on the NavigationAgent node and not the map of the abstract agent on the NavigationServer. If the agent map is changed directly with the NavigationServer API the NavigationAgent node will not be aware of the map change. Use @method set_navigation_map@ to change the navigation map for the NavigationAgent and also update the agent on the NavigationServer.
bindNavigationAgent_get_navigation_map :: MethodBind
bindNavigationAgent_get_navigation_map
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_navigation_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of the navigation map for this NavigationAgent node. This function returns always the map set on the NavigationAgent node and not the map of the abstract agent on the NavigationServer. If the agent map is changed directly with the NavigationServer API the NavigationAgent node will not be aware of the map change. Use @method set_navigation_map@ to change the navigation map for the NavigationAgent and also update the agent on the NavigationServer.
get_navigation_map ::
                     (NavigationAgent :< cls, Object :< cls) => cls -> IO Rid
get_navigation_map cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_navigation_map
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_navigation_map" '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_navigation_map

{-# NOINLINE bindNavigationAgent_get_neighbor_dist #-}

-- | The distance to search for other agents.
bindNavigationAgent_get_neighbor_dist :: MethodBind
bindNavigationAgent_get_neighbor_dist
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_neighbor_dist" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance to search for other agents.
get_neighbor_dist ::
                    (NavigationAgent :< cls, Object :< cls) => cls -> IO Float
get_neighbor_dist cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_neighbor_dist
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_neighbor_dist" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_neighbor_dist

{-# NOINLINE bindNavigationAgent_get_next_location #-}

-- | Returns the next location in global coordinates that can be moved to, making sure that there are no static objects in the way. If the agent does not have a navigation path, it will return the position of the agent's parent. The use of this function once every physics frame is required to update the internal path logic of the NavigationAgent.
bindNavigationAgent_get_next_location :: MethodBind
bindNavigationAgent_get_next_location
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_next_location" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next location in global coordinates that can be moved to, making sure that there are no static objects in the way. If the agent does not have a navigation path, it will return the position of the agent's parent. The use of this function once every physics frame is required to update the internal path logic of the NavigationAgent.
get_next_location ::
                    (NavigationAgent :< cls, Object :< cls) => cls -> IO Vector3
get_next_location cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_next_location
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_next_location" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_next_location

{-# NOINLINE bindNavigationAgent_get_path_desired_distance #-}

-- | The distance threshold before a path point is considered to be reached. This will allow an agent to not have to hit a path point on the path exactly, but in the area. If this value is set to high the NavigationAgent will skip points on the path which can lead to leaving the navigation mesh. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the next point on each physics frame update.
bindNavigationAgent_get_path_desired_distance :: MethodBind
bindNavigationAgent_get_path_desired_distance
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_path_desired_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance threshold before a path point is considered to be reached. This will allow an agent to not have to hit a path point on the path exactly, but in the area. If this value is set to high the NavigationAgent will skip points on the path which can lead to leaving the navigation mesh. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the next point on each physics frame update.
get_path_desired_distance ::
                            (NavigationAgent :< cls, Object :< cls) => cls -> IO Float
get_path_desired_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationAgent_get_path_desired_distance
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_path_desired_distance" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_path_desired_distance

{-# NOINLINE bindNavigationAgent_get_path_max_distance #-}

-- | The maximum distance the agent is allowed away from the ideal path to the final location. This can happen due to trying to avoid collisions. When the maximum distance is exceeded, it recalculates the ideal path.
bindNavigationAgent_get_path_max_distance :: MethodBind
bindNavigationAgent_get_path_max_distance
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_path_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum distance the agent is allowed away from the ideal path to the final location. This can happen due to trying to avoid collisions. When the maximum distance is exceeded, it recalculates the ideal path.
get_path_max_distance ::
                        (NavigationAgent :< cls, Object :< cls) => cls -> IO Float
get_path_max_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_path_max_distance
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_path_max_distance" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_path_max_distance

{-# NOINLINE bindNavigationAgent_get_radius #-}

-- | The radius of the avoidance agent. This is the "body" of the avoidance agent and not the avoidance maneuver starting radius (which is controlled by @neighbor_dist@).
--   			Does not affect normal pathfinding. To change an actor's pathfinding radius bake @NavigationMesh@ resources with a different @NavigationMesh.agent_radius@ property and use different navigation maps for each actor size.
bindNavigationAgent_get_radius :: MethodBind
bindNavigationAgent_get_radius
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The radius of the avoidance agent. This is the "body" of the avoidance agent and not the avoidance maneuver starting radius (which is controlled by @neighbor_dist@).
--   			Does not affect normal pathfinding. To change an actor's pathfinding radius bake @NavigationMesh@ resources with a different @NavigationMesh.agent_radius@ property and use different navigation maps for each actor size.
get_radius ::
             (NavigationAgent :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_radius (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_radius" '[] (IO Float)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_radius

{-# NOINLINE bindNavigationAgent_get_rid #-}

-- | Returns the @RID@ of this agent on the @NavigationServer@.
bindNavigationAgent_get_rid :: MethodBind
bindNavigationAgent_get_rid
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of this agent on the @NavigationServer@.
get_rid :: (NavigationAgent :< cls, Object :< cls) => cls -> IO Rid
get_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_rid (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_rid" '[] (IO Rid) where
        nodeMethod = Godot.Core.NavigationAgent.get_rid

{-# NOINLINE bindNavigationAgent_get_target_desired_distance #-}

-- | The distance threshold before the final target point is considered to be reached. This will allow an agent to not have to hit the point of the final target exactly, but only the area. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the final target point on each physics frame update.
bindNavigationAgent_get_target_desired_distance :: MethodBind
bindNavigationAgent_get_target_desired_distance
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_target_desired_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance threshold before the final target point is considered to be reached. This will allow an agent to not have to hit the point of the final target exactly, but only the area. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the final target point on each physics frame update.
get_target_desired_distance ::
                              (NavigationAgent :< cls, Object :< cls) => cls -> IO Float
get_target_desired_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationAgent_get_target_desired_distance
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_target_desired_distance"
           '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_target_desired_distance

{-# NOINLINE bindNavigationAgent_get_target_location #-}

-- | The user-defined target location. Setting this property will clear the current navigation path.
bindNavigationAgent_get_target_location :: MethodBind
bindNavigationAgent_get_target_location
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_target_location" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The user-defined target location. Setting this property will clear the current navigation path.
get_target_location ::
                      (NavigationAgent :< cls, Object :< cls) => cls -> IO Vector3
get_target_location cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_target_location
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_target_location" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_target_location

{-# NOINLINE bindNavigationAgent_get_time_horizon #-}

-- | The minimal amount of time for which this agent's velocities, that are computed with the collision avoidance algorithm, are safe with respect to other agents. The larger the number, the sooner the agent will respond to other agents, but the less freedom in choosing its velocities. Must be positive.
bindNavigationAgent_get_time_horizon :: MethodBind
bindNavigationAgent_get_time_horizon
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "get_time_horizon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimal amount of time for which this agent's velocities, that are computed with the collision avoidance algorithm, are safe with respect to other agents. The larger the number, the sooner the agent will respond to other agents, but the less freedom in choosing its velocities. Must be positive.
get_time_horizon ::
                   (NavigationAgent :< cls, Object :< cls) => cls -> IO Float
get_time_horizon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_get_time_horizon
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "get_time_horizon" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationAgent.get_time_horizon

{-# NOINLINE bindNavigationAgent_is_navigation_finished #-}

-- | Returns @true@ if the navigation path's final location has been reached.
bindNavigationAgent_is_navigation_finished :: MethodBind
bindNavigationAgent_is_navigation_finished
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "is_navigation_finished" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the navigation path's final location has been reached.
is_navigation_finished ::
                         (NavigationAgent :< cls, Object :< cls) => cls -> IO Bool
is_navigation_finished cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_is_navigation_finished
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "is_navigation_finished" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationAgent.is_navigation_finished

{-# NOINLINE bindNavigationAgent_is_target_reachable #-}

-- | Returns @true@ if @target_location@ is reachable.
bindNavigationAgent_is_target_reachable :: MethodBind
bindNavigationAgent_is_target_reachable
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "is_target_reachable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if @target_location@ is reachable.
is_target_reachable ::
                      (NavigationAgent :< cls, Object :< cls) => cls -> IO Bool
is_target_reachable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_is_target_reachable
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "is_target_reachable" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationAgent.is_target_reachable

{-# NOINLINE bindNavigationAgent_is_target_reached #-}

-- | Returns @true@ if @target_location@ is reached. It may not always be possible to reach the target location. It should always be possible to reach the final location though. See @method get_final_location@.
bindNavigationAgent_is_target_reached :: MethodBind
bindNavigationAgent_is_target_reached
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "is_target_reached" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if @target_location@ is reached. It may not always be possible to reach the target location. It should always be possible to reach the final location though. See @method get_final_location@.
is_target_reached ::
                    (NavigationAgent :< cls, Object :< cls) => cls -> IO Bool
is_target_reached cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_is_target_reached
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "is_target_reached" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationAgent.is_target_reached

{-# NOINLINE bindNavigationAgent_set_agent_height_offset #-}

-- | The NavigationAgent height offset is subtracted from the y-axis value of any vector path position for this NavigationAgent. The NavigationAgent height offset does not change or influence the navigation mesh or pathfinding query result. Additional navigation maps that use regions with navigation meshes that the developer baked with appropriate agent radius or height values are required to support different-sized agents.
bindNavigationAgent_set_agent_height_offset :: MethodBind
bindNavigationAgent_set_agent_height_offset
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "set_agent_height_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The NavigationAgent height offset is subtracted from the y-axis value of any vector path position for this NavigationAgent. The NavigationAgent height offset does not change or influence the navigation mesh or pathfinding query result. Additional navigation maps that use regions with navigation meshes that the developer baked with appropriate agent radius or height values are required to support different-sized agents.
set_agent_height_offset ::
                          (NavigationAgent :< cls, Object :< cls) => cls -> Float -> IO ()
set_agent_height_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_set_agent_height_offset
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "set_agent_height_offset"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent.set_agent_height_offset

{-# NOINLINE bindNavigationAgent_set_avoidance_enabled #-}

-- | If @true@ the agent is registered for an RVO avoidance callback on the @NavigationServer@. When @method set_velocity@ is used and the processing is completed a @safe_velocity@ Vector3 is received with a signal connection to @signal velocity_computed@. Avoidance processing with many registered agents has a significant performance cost and should only be enabled on agents that currently require it.
bindNavigationAgent_set_avoidance_enabled :: MethodBind
bindNavigationAgent_set_avoidance_enabled
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "set_avoidance_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@ the agent is registered for an RVO avoidance callback on the @NavigationServer@. When @method set_velocity@ is used and the processing is completed a @safe_velocity@ Vector3 is received with a signal connection to @signal velocity_computed@. Avoidance processing with many registered agents has a significant performance cost and should only be enabled on agents that currently require it.
set_avoidance_enabled ::
                        (NavigationAgent :< cls, Object :< cls) => cls -> Bool -> IO ()
set_avoidance_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_set_avoidance_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "set_avoidance_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent.set_avoidance_enabled

{-# NOINLINE bindNavigationAgent_set_ignore_y #-}

-- | Ignores collisions on the Y axis. Must be @true@ to move on a horizontal plane.
bindNavigationAgent_set_ignore_y :: MethodBind
bindNavigationAgent_set_ignore_y
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "set_ignore_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Ignores collisions on the Y axis. Must be @true@ to move on a horizontal plane.
set_ignore_y ::
               (NavigationAgent :< cls, Object :< cls) => cls -> Bool -> IO ()
set_ignore_y cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_set_ignore_y
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "set_ignore_y" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent.set_ignore_y

{-# NOINLINE bindNavigationAgent_set_max_neighbors #-}

-- | The maximum number of neighbors for the agent to consider.
bindNavigationAgent_set_max_neighbors :: MethodBind
bindNavigationAgent_set_max_neighbors
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "set_max_neighbors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum number of neighbors for the agent to consider.
set_max_neighbors ::
                    (NavigationAgent :< cls, Object :< cls) => cls -> Int -> IO ()
set_max_neighbors cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_set_max_neighbors
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "set_max_neighbors" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent.set_max_neighbors

{-# NOINLINE bindNavigationAgent_set_max_speed #-}

-- | The maximum speed that an agent can move.
bindNavigationAgent_set_max_speed :: MethodBind
bindNavigationAgent_set_max_speed
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "set_max_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum speed that an agent can move.
set_max_speed ::
                (NavigationAgent :< cls, Object :< cls) => cls -> Float -> IO ()
set_max_speed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_set_max_speed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "set_max_speed" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent.set_max_speed

{-# NOINLINE bindNavigationAgent_set_navigation #-}

-- | Sets the @Navigation@ node used by the agent. Useful when you don't want to make the agent a child of a @Navigation@ node.
bindNavigationAgent_set_navigation :: MethodBind
bindNavigationAgent_set_navigation
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "set_navigation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Navigation@ node used by the agent. Useful when you don't want to make the agent a child of a @Navigation@ node.
set_navigation ::
                 (NavigationAgent :< cls, Object :< cls) => cls -> Node -> IO ()
set_navigation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_set_navigation
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "set_navigation" '[Node]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent.set_navigation

{-# NOINLINE bindNavigationAgent_set_navigation_layers #-}

-- | A bitfield determining all navigation map layers the @NavigationAgent@ belongs to. On path requests the agent will ignore navmeshes without at least one matching layer.
bindNavigationAgent_set_navigation_layers :: MethodBind
bindNavigationAgent_set_navigation_layers
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "set_navigation_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A bitfield determining all navigation map layers the @NavigationAgent@ belongs to. On path requests the agent will ignore navmeshes without at least one matching layer.
set_navigation_layers ::
                        (NavigationAgent :< cls, Object :< cls) => cls -> Int -> IO ()
set_navigation_layers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_set_navigation_layers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "set_navigation_layers" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent.set_navigation_layers

{-# NOINLINE bindNavigationAgent_set_navigation_map #-}

-- | Sets the @RID@ of the navigation map this NavigationAgent node should use and also updates the @agent@ on the NavigationServer.
bindNavigationAgent_set_navigation_map :: MethodBind
bindNavigationAgent_set_navigation_map
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "set_navigation_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @RID@ of the navigation map this NavigationAgent node should use and also updates the @agent@ on the NavigationServer.
set_navigation_map ::
                     (NavigationAgent :< cls, Object :< cls) => cls -> Rid -> IO ()
set_navigation_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_set_navigation_map
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "set_navigation_map" '[Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent.set_navigation_map

{-# NOINLINE bindNavigationAgent_set_neighbor_dist #-}

-- | The distance to search for other agents.
bindNavigationAgent_set_neighbor_dist :: MethodBind
bindNavigationAgent_set_neighbor_dist
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "set_neighbor_dist" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance to search for other agents.
set_neighbor_dist ::
                    (NavigationAgent :< cls, Object :< cls) => cls -> Float -> IO ()
set_neighbor_dist cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_set_neighbor_dist
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "set_neighbor_dist" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent.set_neighbor_dist

{-# NOINLINE bindNavigationAgent_set_path_desired_distance #-}

-- | The distance threshold before a path point is considered to be reached. This will allow an agent to not have to hit a path point on the path exactly, but in the area. If this value is set to high the NavigationAgent will skip points on the path which can lead to leaving the navigation mesh. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the next point on each physics frame update.
bindNavigationAgent_set_path_desired_distance :: MethodBind
bindNavigationAgent_set_path_desired_distance
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "set_path_desired_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance threshold before a path point is considered to be reached. This will allow an agent to not have to hit a path point on the path exactly, but in the area. If this value is set to high the NavigationAgent will skip points on the path which can lead to leaving the navigation mesh. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the next point on each physics frame update.
set_path_desired_distance ::
                            (NavigationAgent :< cls, Object :< cls) => cls -> Float -> IO ()
set_path_desired_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationAgent_set_path_desired_distance
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "set_path_desired_distance"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent.set_path_desired_distance

{-# NOINLINE bindNavigationAgent_set_path_max_distance #-}

-- | The maximum distance the agent is allowed away from the ideal path to the final location. This can happen due to trying to avoid collisions. When the maximum distance is exceeded, it recalculates the ideal path.
bindNavigationAgent_set_path_max_distance :: MethodBind
bindNavigationAgent_set_path_max_distance
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "set_path_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum distance the agent is allowed away from the ideal path to the final location. This can happen due to trying to avoid collisions. When the maximum distance is exceeded, it recalculates the ideal path.
set_path_max_distance ::
                        (NavigationAgent :< cls, Object :< cls) => cls -> Float -> IO ()
set_path_max_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_set_path_max_distance
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "set_path_max_distance"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent.set_path_max_distance

{-# NOINLINE bindNavigationAgent_set_radius #-}

-- | The radius of the avoidance agent. This is the "body" of the avoidance agent and not the avoidance maneuver starting radius (which is controlled by @neighbor_dist@).
--   			Does not affect normal pathfinding. To change an actor's pathfinding radius bake @NavigationMesh@ resources with a different @NavigationMesh.agent_radius@ property and use different navigation maps for each actor size.
bindNavigationAgent_set_radius :: MethodBind
bindNavigationAgent_set_radius
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The radius of the avoidance agent. This is the "body" of the avoidance agent and not the avoidance maneuver starting radius (which is controlled by @neighbor_dist@).
--   			Does not affect normal pathfinding. To change an actor's pathfinding radius bake @NavigationMesh@ resources with a different @NavigationMesh.agent_radius@ property and use different navigation maps for each actor size.
set_radius ::
             (NavigationAgent :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_set_radius (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "set_radius" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent.set_radius

{-# NOINLINE bindNavigationAgent_set_target_desired_distance #-}

-- | The distance threshold before the final target point is considered to be reached. This will allow an agent to not have to hit the point of the final target exactly, but only the area. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the final target point on each physics frame update.
bindNavigationAgent_set_target_desired_distance :: MethodBind
bindNavigationAgent_set_target_desired_distance
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "set_target_desired_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance threshold before the final target point is considered to be reached. This will allow an agent to not have to hit the point of the final target exactly, but only the area. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the final target point on each physics frame update.
set_target_desired_distance ::
                              (NavigationAgent :< cls, Object :< cls) => cls -> Float -> IO ()
set_target_desired_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationAgent_set_target_desired_distance
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "set_target_desired_distance"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent.set_target_desired_distance

{-# NOINLINE bindNavigationAgent_set_target_location #-}

-- | The user-defined target location. Setting this property will clear the current navigation path.
bindNavigationAgent_set_target_location :: MethodBind
bindNavigationAgent_set_target_location
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "set_target_location" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The user-defined target location. Setting this property will clear the current navigation path.
set_target_location ::
                      (NavigationAgent :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_target_location cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_set_target_location
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "set_target_location"
           '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent.set_target_location

{-# NOINLINE bindNavigationAgent_set_time_horizon #-}

-- | The minimal amount of time for which this agent's velocities, that are computed with the collision avoidance algorithm, are safe with respect to other agents. The larger the number, the sooner the agent will respond to other agents, but the less freedom in choosing its velocities. Must be positive.
bindNavigationAgent_set_time_horizon :: MethodBind
bindNavigationAgent_set_time_horizon
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "set_time_horizon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimal amount of time for which this agent's velocities, that are computed with the collision avoidance algorithm, are safe with respect to other agents. The larger the number, the sooner the agent will respond to other agents, but the less freedom in choosing its velocities. Must be positive.
set_time_horizon ::
                   (NavigationAgent :< cls, Object :< cls) => cls -> Float -> IO ()
set_time_horizon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_set_time_horizon
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "set_time_horizon" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent.set_time_horizon

{-# NOINLINE bindNavigationAgent_set_velocity #-}

-- | Sends the passed in velocity to the collision avoidance algorithm. It will adjust the velocity to avoid collisions. Once the adjustment to the velocity is complete, it will emit the @signal velocity_computed@ signal.
bindNavigationAgent_set_velocity :: MethodBind
bindNavigationAgent_set_velocity
  = unsafePerformIO $
      withCString "NavigationAgent" $
        \ clsNamePtr ->
          withCString "set_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends the passed in velocity to the collision avoidance algorithm. It will adjust the velocity to avoid collisions. Once the adjustment to the velocity is complete, it will emit the @signal velocity_computed@ signal.
set_velocity ::
               (NavigationAgent :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationAgent_set_velocity
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationAgent "set_velocity" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationAgent.set_velocity