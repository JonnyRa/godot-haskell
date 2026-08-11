{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NavigationServer
       (Godot.Core.NavigationServer.sig_map_changed,
        Godot.Core.NavigationServer.agent_create,
        Godot.Core.NavigationServer.agent_get_map,
        Godot.Core.NavigationServer.agent_is_map_changed,
        Godot.Core.NavigationServer.agent_set_callback,
        Godot.Core.NavigationServer.agent_set_map,
        Godot.Core.NavigationServer.agent_set_max_neighbors,
        Godot.Core.NavigationServer.agent_set_max_speed,
        Godot.Core.NavigationServer.agent_set_neighbor_dist,
        Godot.Core.NavigationServer.agent_set_position,
        Godot.Core.NavigationServer.agent_set_radius,
        Godot.Core.NavigationServer.agent_set_target_velocity,
        Godot.Core.NavigationServer.agent_set_time_horizon,
        Godot.Core.NavigationServer.agent_set_velocity,
        Godot.Core.NavigationServer.free_rid,
        Godot.Core.NavigationServer.get_maps,
        Godot.Core.NavigationServer.map_create,
        Godot.Core.NavigationServer.map_force_update,
        Godot.Core.NavigationServer.map_get_agents,
        Godot.Core.NavigationServer.map_get_cell_height,
        Godot.Core.NavigationServer.map_get_cell_size,
        Godot.Core.NavigationServer.map_get_closest_point,
        Godot.Core.NavigationServer.map_get_closest_point_normal,
        Godot.Core.NavigationServer.map_get_closest_point_owner,
        Godot.Core.NavigationServer.map_get_closest_point_to_segment,
        Godot.Core.NavigationServer.map_get_edge_connection_margin,
        Godot.Core.NavigationServer.map_get_path,
        Godot.Core.NavigationServer.map_get_regions,
        Godot.Core.NavigationServer.map_get_up,
        Godot.Core.NavigationServer.map_is_active,
        Godot.Core.NavigationServer.map_set_active,
        Godot.Core.NavigationServer.map_set_cell_height,
        Godot.Core.NavigationServer.map_set_cell_size,
        Godot.Core.NavigationServer.map_set_edge_connection_margin,
        Godot.Core.NavigationServer.map_set_up,
        Godot.Core.NavigationServer.process,
        Godot.Core.NavigationServer.region_bake_navmesh,
        Godot.Core.NavigationServer.region_create,
        Godot.Core.NavigationServer.region_get_connection_pathway_end,
        Godot.Core.NavigationServer.region_get_connection_pathway_start,
        Godot.Core.NavigationServer.region_get_connections_count,
        Godot.Core.NavigationServer.region_get_enter_cost,
        Godot.Core.NavigationServer.region_get_map,
        Godot.Core.NavigationServer.region_get_navigation_layers,
        Godot.Core.NavigationServer.region_get_travel_cost,
        Godot.Core.NavigationServer.region_owns_point,
        Godot.Core.NavigationServer.region_set_enter_cost,
        Godot.Core.NavigationServer.region_set_map,
        Godot.Core.NavigationServer.region_set_navigation_layers,
        Godot.Core.NavigationServer.region_set_navmesh,
        Godot.Core.NavigationServer.region_set_transform,
        Godot.Core.NavigationServer.region_set_travel_cost,
        Godot.Core.NavigationServer.set_active)
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

-- | Emitted when a navigation map is updated, when a region moves or is modified.
sig_map_changed :: Godot.Internal.Dispatch.Signal NavigationServer
sig_map_changed = Godot.Internal.Dispatch.Signal "map_changed"

instance NodeSignal NavigationServer "map_changed" '[Rid]

{-# NOINLINE bindNavigationServer_agent_create #-}

-- | Creates the agent.
bindNavigationServer_agent_create :: MethodBind
bindNavigationServer_agent_create
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "agent_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates the agent.
agent_create ::
               (NavigationServer :< cls, Object :< cls) => cls -> IO Rid
agent_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_agent_create
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "agent_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.NavigationServer.agent_create

{-# NOINLINE bindNavigationServer_agent_get_map #-}

-- | Returns the navigation map @RID@ the requested @agent@ is currently assigned to.
bindNavigationServer_agent_get_map :: MethodBind
bindNavigationServer_agent_get_map
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "agent_get_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the navigation map @RID@ the requested @agent@ is currently assigned to.
agent_get_map ::
                (NavigationServer :< cls, Object :< cls) => cls -> Rid -> IO Rid
agent_get_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_agent_get_map
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "agent_get_map" '[Rid]
           (IO Rid)
         where
        nodeMethod = Godot.Core.NavigationServer.agent_get_map

{-# NOINLINE bindNavigationServer_agent_is_map_changed #-}

-- | Returns @true@ if the map got changed the previous frame.
bindNavigationServer_agent_is_map_changed :: MethodBind
bindNavigationServer_agent_is_map_changed
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "agent_is_map_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the map got changed the previous frame.
agent_is_map_changed ::
                       (NavigationServer :< cls, Object :< cls) => cls -> Rid -> IO Bool
agent_is_map_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_agent_is_map_changed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "agent_is_map_changed" '[Rid]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationServer.agent_is_map_changed

{-# NOINLINE bindNavigationServer_agent_set_callback #-}

-- | Sets the callback @object_id@ and @method@ that gets called after each avoidance processing step for the @agent@. The calculated @safe_velocity@ will be dispatched with a signal to the object just before the physics calculations.
--   				__Note:__ Created callbacks are always processed independently of the SceneTree state as long as the agent is on a navigation map and not freed. To disable the dispatch of a callback from an agent use @method agent_set_callback@ again with a @0@ ObjectID as the @object_id@.
bindNavigationServer_agent_set_callback :: MethodBind
bindNavigationServer_agent_set_callback
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "agent_set_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the callback @object_id@ and @method@ that gets called after each avoidance processing step for the @agent@. The calculated @safe_velocity@ will be dispatched with a signal to the object just before the physics calculations.
--   				__Note:__ Created callbacks are always processed independently of the SceneTree state as long as the agent is on a navigation map and not freed. To disable the dispatch of a callback from an agent use @method agent_set_callback@ again with a @0@ ObjectID as the @object_id@.
agent_set_callback ::
                     (NavigationServer :< cls, Object :< cls) =>
                     cls -> Rid -> Int -> GodotString -> Maybe GodotVariant -> IO ()
agent_set_callback cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe VariantNil toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_agent_set_callback
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "agent_set_callback"
           '[Rid, Int, GodotString, Maybe GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.agent_set_callback

{-# NOINLINE bindNavigationServer_agent_set_map #-}

-- | Puts the agent in the map.
bindNavigationServer_agent_set_map :: MethodBind
bindNavigationServer_agent_set_map
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "agent_set_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Puts the agent in the map.
agent_set_map ::
                (NavigationServer :< cls, Object :< cls) =>
                cls -> Rid -> Rid -> IO ()
agent_set_map cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_agent_set_map
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "agent_set_map" '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.agent_set_map

{-# NOINLINE bindNavigationServer_agent_set_max_neighbors #-}

-- | Sets the maximum number of other agents the agent takes into account in the navigation. The larger this number, the longer the running time of the simulation. If the number is too low, the simulation will not be safe.
bindNavigationServer_agent_set_max_neighbors :: MethodBind
bindNavigationServer_agent_set_max_neighbors
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "agent_set_max_neighbors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the maximum number of other agents the agent takes into account in the navigation. The larger this number, the longer the running time of the simulation. If the number is too low, the simulation will not be safe.
agent_set_max_neighbors ::
                          (NavigationServer :< cls, Object :< cls) =>
                          cls -> Rid -> Int -> IO ()
agent_set_max_neighbors cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_agent_set_max_neighbors
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "agent_set_max_neighbors"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.agent_set_max_neighbors

{-# NOINLINE bindNavigationServer_agent_set_max_speed #-}

-- | Sets the maximum speed of the agent. Must be positive.
bindNavigationServer_agent_set_max_speed :: MethodBind
bindNavigationServer_agent_set_max_speed
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "agent_set_max_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the maximum speed of the agent. Must be positive.
agent_set_max_speed ::
                      (NavigationServer :< cls, Object :< cls) =>
                      cls -> Rid -> Float -> IO ()
agent_set_max_speed cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_agent_set_max_speed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "agent_set_max_speed"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.agent_set_max_speed

{-# NOINLINE bindNavigationServer_agent_set_neighbor_dist #-}

-- | Sets the maximum distance to other agents this agent takes into account in the navigation. The larger this number, the longer the running time of the simulation. If the number is too low, the simulation will not be safe.
bindNavigationServer_agent_set_neighbor_dist :: MethodBind
bindNavigationServer_agent_set_neighbor_dist
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "agent_set_neighbor_dist" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the maximum distance to other agents this agent takes into account in the navigation. The larger this number, the longer the running time of the simulation. If the number is too low, the simulation will not be safe.
agent_set_neighbor_dist ::
                          (NavigationServer :< cls, Object :< cls) =>
                          cls -> Rid -> Float -> IO ()
agent_set_neighbor_dist cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_agent_set_neighbor_dist
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "agent_set_neighbor_dist"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.agent_set_neighbor_dist

{-# NOINLINE bindNavigationServer_agent_set_position #-}

-- | Sets the position of the agent in world space.
bindNavigationServer_agent_set_position :: MethodBind
bindNavigationServer_agent_set_position
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "agent_set_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position of the agent in world space.
agent_set_position ::
                     (NavigationServer :< cls, Object :< cls) =>
                     cls -> Rid -> Vector3 -> IO ()
agent_set_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_agent_set_position
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "agent_set_position"
           '[Rid, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.agent_set_position

{-# NOINLINE bindNavigationServer_agent_set_radius #-}

-- | Sets the radius of the agent.
bindNavigationServer_agent_set_radius :: MethodBind
bindNavigationServer_agent_set_radius
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "agent_set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the radius of the agent.
agent_set_radius ::
                   (NavigationServer :< cls, Object :< cls) =>
                   cls -> Rid -> Float -> IO ()
agent_set_radius cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_agent_set_radius
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "agent_set_radius"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.agent_set_radius

{-# NOINLINE bindNavigationServer_agent_set_target_velocity #-}

-- | Sets the new target velocity.
bindNavigationServer_agent_set_target_velocity :: MethodBind
bindNavigationServer_agent_set_target_velocity
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "agent_set_target_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the new target velocity.
agent_set_target_velocity ::
                            (NavigationServer :< cls, Object :< cls) =>
                            cls -> Rid -> Vector3 -> IO ()
agent_set_target_velocity cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationServer_agent_set_target_velocity
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "agent_set_target_velocity"
           '[Rid, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.agent_set_target_velocity

{-# NOINLINE bindNavigationServer_agent_set_time_horizon #-}

-- | The minimal amount of time for which the agent's velocities that are computed by the simulation are safe with respect to other agents. The larger this number, the sooner this agent will respond to the presence of other agents, but the less freedom this agent has in choosing its velocities. Must be positive.
bindNavigationServer_agent_set_time_horizon :: MethodBind
bindNavigationServer_agent_set_time_horizon
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "agent_set_time_horizon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimal amount of time for which the agent's velocities that are computed by the simulation are safe with respect to other agents. The larger this number, the sooner this agent will respond to the presence of other agents, but the less freedom this agent has in choosing its velocities. Must be positive.
agent_set_time_horizon ::
                         (NavigationServer :< cls, Object :< cls) =>
                         cls -> Rid -> Float -> IO ()
agent_set_time_horizon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_agent_set_time_horizon
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "agent_set_time_horizon"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.agent_set_time_horizon

{-# NOINLINE bindNavigationServer_agent_set_velocity #-}

-- | Sets the current velocity of the agent.
bindNavigationServer_agent_set_velocity :: MethodBind
bindNavigationServer_agent_set_velocity
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "agent_set_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the current velocity of the agent.
agent_set_velocity ::
                     (NavigationServer :< cls, Object :< cls) =>
                     cls -> Rid -> Vector3 -> IO ()
agent_set_velocity cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_agent_set_velocity
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "agent_set_velocity"
           '[Rid, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.agent_set_velocity

{-# NOINLINE bindNavigationServer_free_rid #-}

-- | Destroys an object created by the NavigationServer.
--   				__Note:__ See @method VisualServer.free_rid@ for details on how to handle RIDs for freed objects.
bindNavigationServer_free_rid :: MethodBind
bindNavigationServer_free_rid
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "free_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Destroys an object created by the NavigationServer.
--   				__Note:__ See @method VisualServer.free_rid@ for details on how to handle RIDs for freed objects.
free_rid ::
           (NavigationServer :< cls, Object :< cls) => cls -> Rid -> IO ()
free_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_free_rid (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "free_rid" '[Rid] (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.free_rid

{-# NOINLINE bindNavigationServer_get_maps #-}

-- | Returns all created navigation map @RID@s on the NavigationServer. This returns both 2D and 3D created navigation maps as there is technically no distinction between them.
bindNavigationServer_get_maps :: MethodBind
bindNavigationServer_get_maps
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "get_maps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all created navigation map @RID@s on the NavigationServer. This returns both 2D and 3D created navigation maps as there is technically no distinction between them.
get_maps ::
           (NavigationServer :< cls, Object :< cls) => cls -> IO Array
get_maps cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_get_maps (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "get_maps" '[] (IO Array)
         where
        nodeMethod = Godot.Core.NavigationServer.get_maps

{-# NOINLINE bindNavigationServer_map_create #-}

-- | Create a new map.
bindNavigationServer_map_create :: MethodBind
bindNavigationServer_map_create
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Create a new map.
map_create ::
             (NavigationServer :< cls, Object :< cls) => cls -> IO Rid
map_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_map_create (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "map_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.NavigationServer.map_create

{-# NOINLINE bindNavigationServer_map_force_update #-}

-- | This function immediately forces synchronization of the specified navigation @map@ @RID@. By default navigation maps are only synchronized at the end of each physics frame. This function can be used to immediately (re)calculate all the navigation meshes and region connections of the navigation map. This makes it possible to query a navigation path for a changed map immediately and in the same frame (multiple times if needed).
--   				Due to technical restrictions the current NavigationServer command queue will be flushed. This means all already queued update commands for this physics frame will be executed, even those intended for other maps, regions and agents not part of the specified map. The expensive computation of the navigation meshes and region connections of a map will only be done for the specified map. Other maps will receive the normal synchronization at the end of the physics frame. Should the specified map receive changes after the forced update it will update again as well when the other maps receive their update.
--   				Avoidance processing and dispatch of the @safe_velocity@ signals is untouched by this function and continues to happen for all maps and agents at the end of the physics frame.
--   				__Note:__ With great power comes great responsibility. This function should only be used by users that really know what they are doing and have a good reason for it. Forcing an immediate update of a navigation map requires locking the NavigationServer and flushing the entire NavigationServer command queue. Not only can this severely impact the performance of a game but it can also introduce bugs if used inappropriately without much foresight.
bindNavigationServer_map_force_update :: MethodBind
bindNavigationServer_map_force_update
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_force_update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This function immediately forces synchronization of the specified navigation @map@ @RID@. By default navigation maps are only synchronized at the end of each physics frame. This function can be used to immediately (re)calculate all the navigation meshes and region connections of the navigation map. This makes it possible to query a navigation path for a changed map immediately and in the same frame (multiple times if needed).
--   				Due to technical restrictions the current NavigationServer command queue will be flushed. This means all already queued update commands for this physics frame will be executed, even those intended for other maps, regions and agents not part of the specified map. The expensive computation of the navigation meshes and region connections of a map will only be done for the specified map. Other maps will receive the normal synchronization at the end of the physics frame. Should the specified map receive changes after the forced update it will update again as well when the other maps receive their update.
--   				Avoidance processing and dispatch of the @safe_velocity@ signals is untouched by this function and continues to happen for all maps and agents at the end of the physics frame.
--   				__Note:__ With great power comes great responsibility. This function should only be used by users that really know what they are doing and have a good reason for it. Forcing an immediate update of a navigation map requires locking the NavigationServer and flushing the entire NavigationServer command queue. Not only can this severely impact the performance of a game but it can also introduce bugs if used inappropriately without much foresight.
map_force_update ::
                   (NavigationServer :< cls, Object :< cls) => cls -> Rid -> IO ()
map_force_update cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_map_force_update
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "map_force_update" '[Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.map_force_update

{-# NOINLINE bindNavigationServer_map_get_agents #-}

-- | Returns all navigation agents @RID@s that are currently assigned to the requested navigation @map@.
bindNavigationServer_map_get_agents :: MethodBind
bindNavigationServer_map_get_agents
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_get_agents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all navigation agents @RID@s that are currently assigned to the requested navigation @map@.
map_get_agents ::
                 (NavigationServer :< cls, Object :< cls) => cls -> Rid -> IO Array
map_get_agents cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_map_get_agents
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "map_get_agents" '[Rid]
           (IO Array)
         where
        nodeMethod = Godot.Core.NavigationServer.map_get_agents

{-# NOINLINE bindNavigationServer_map_get_cell_height #-}

-- | Returns the map cell height.
bindNavigationServer_map_get_cell_height :: MethodBind
bindNavigationServer_map_get_cell_height
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_get_cell_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the map cell height.
map_get_cell_height ::
                      (NavigationServer :< cls, Object :< cls) => cls -> Rid -> IO Float
map_get_cell_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_map_get_cell_height
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "map_get_cell_height" '[Rid]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationServer.map_get_cell_height

{-# NOINLINE bindNavigationServer_map_get_cell_size #-}

-- | Returns the map cell size.
bindNavigationServer_map_get_cell_size :: MethodBind
bindNavigationServer_map_get_cell_size
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_get_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the map cell size.
map_get_cell_size ::
                    (NavigationServer :< cls, Object :< cls) => cls -> Rid -> IO Float
map_get_cell_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_map_get_cell_size
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "map_get_cell_size" '[Rid]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationServer.map_get_cell_size

{-# NOINLINE bindNavigationServer_map_get_closest_point #-}

-- | Returns the point closest to the provided @to_point@ on the navigation mesh surface.
bindNavigationServer_map_get_closest_point :: MethodBind
bindNavigationServer_map_get_closest_point
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_get_closest_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the point closest to the provided @to_point@ on the navigation mesh surface.
map_get_closest_point ::
                        (NavigationServer :< cls, Object :< cls) =>
                        cls -> Rid -> Vector3 -> IO Vector3
map_get_closest_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_map_get_closest_point
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "map_get_closest_point"
           '[Rid, Vector3]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.NavigationServer.map_get_closest_point

{-# NOINLINE bindNavigationServer_map_get_closest_point_normal #-}

-- | Returns the normal for the point returned by @method map_get_closest_point@.
bindNavigationServer_map_get_closest_point_normal :: MethodBind
bindNavigationServer_map_get_closest_point_normal
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_get_closest_point_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the normal for the point returned by @method map_get_closest_point@.
map_get_closest_point_normal ::
                               (NavigationServer :< cls, Object :< cls) =>
                               cls -> Rid -> Vector3 -> IO Vector3
map_get_closest_point_normal cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationServer_map_get_closest_point_normal
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "map_get_closest_point_normal"
           '[Rid, Vector3]
           (IO Vector3)
         where
        nodeMethod
          = Godot.Core.NavigationServer.map_get_closest_point_normal

{-# NOINLINE bindNavigationServer_map_get_closest_point_owner #-}

-- | Returns the owner region RID for the point returned by @method map_get_closest_point@.
bindNavigationServer_map_get_closest_point_owner :: MethodBind
bindNavigationServer_map_get_closest_point_owner
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_get_closest_point_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the owner region RID for the point returned by @method map_get_closest_point@.
map_get_closest_point_owner ::
                              (NavigationServer :< cls, Object :< cls) =>
                              cls -> Rid -> Vector3 -> IO Rid
map_get_closest_point_owner cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationServer_map_get_closest_point_owner
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "map_get_closest_point_owner"
           '[Rid, Vector3]
           (IO Rid)
         where
        nodeMethod
          = Godot.Core.NavigationServer.map_get_closest_point_owner

{-# NOINLINE bindNavigationServer_map_get_closest_point_to_segment
             #-}

-- | Returns the closest point between the navigation surface and the segment.
bindNavigationServer_map_get_closest_point_to_segment :: MethodBind
bindNavigationServer_map_get_closest_point_to_segment
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_get_closest_point_to_segment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the closest point between the navigation surface and the segment.
map_get_closest_point_to_segment ::
                                   (NavigationServer :< cls, Object :< cls) =>
                                   cls -> Rid -> Vector3 -> Vector3 -> Maybe Bool -> IO Vector3
map_get_closest_point_to_segment cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantBool False) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationServer_map_get_closest_point_to_segment
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer
           "map_get_closest_point_to_segment"
           '[Rid, Vector3, Vector3, Maybe Bool]
           (IO Vector3)
         where
        nodeMethod
          = Godot.Core.NavigationServer.map_get_closest_point_to_segment

{-# NOINLINE bindNavigationServer_map_get_edge_connection_margin
             #-}

-- | Returns the edge connection margin of the map. This distance is the minimum vertex distance needed to connect two edges from different regions.
bindNavigationServer_map_get_edge_connection_margin :: MethodBind
bindNavigationServer_map_get_edge_connection_margin
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_get_edge_connection_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the edge connection margin of the map. This distance is the minimum vertex distance needed to connect two edges from different regions.
map_get_edge_connection_margin ::
                                 (NavigationServer :< cls, Object :< cls) => cls -> Rid -> IO Float
map_get_edge_connection_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationServer_map_get_edge_connection_margin
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer
           "map_get_edge_connection_margin"
           '[Rid]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.NavigationServer.map_get_edge_connection_margin

{-# NOINLINE bindNavigationServer_map_get_path #-}

-- | Returns the navigation path to reach the destination from the origin. @navigation_layers@ is a bitmask of all region layers that are allowed to be in the path.
bindNavigationServer_map_get_path :: MethodBind
bindNavigationServer_map_get_path
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_get_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the navigation path to reach the destination from the origin. @navigation_layers@ is a bitmask of all region layers that are allowed to be in the path.
map_get_path ::
               (NavigationServer :< cls, Object :< cls) =>
               cls ->
                 Rid ->
                   Vector3 -> Vector3 -> Bool -> Maybe Int -> IO PoolVector3Array
map_get_path cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       maybe (VariantInt (1)) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_map_get_path
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "map_get_path"
           '[Rid, Vector3, Vector3, Bool, Maybe Int]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.NavigationServer.map_get_path

{-# NOINLINE bindNavigationServer_map_get_regions #-}

-- | Returns all navigation regions @RID@s that are currently assigned to the requested navigation @map@.
bindNavigationServer_map_get_regions :: MethodBind
bindNavigationServer_map_get_regions
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_get_regions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all navigation regions @RID@s that are currently assigned to the requested navigation @map@.
map_get_regions ::
                  (NavigationServer :< cls, Object :< cls) => cls -> Rid -> IO Array
map_get_regions cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_map_get_regions
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "map_get_regions" '[Rid]
           (IO Array)
         where
        nodeMethod = Godot.Core.NavigationServer.map_get_regions

{-# NOINLINE bindNavigationServer_map_get_up #-}

-- | Returns the map's up direction.
bindNavigationServer_map_get_up :: MethodBind
bindNavigationServer_map_get_up
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_get_up" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the map's up direction.
map_get_up ::
             (NavigationServer :< cls, Object :< cls) =>
             cls -> Rid -> IO Vector3
map_get_up cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_map_get_up (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "map_get_up" '[Rid]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.NavigationServer.map_get_up

{-# NOINLINE bindNavigationServer_map_is_active #-}

-- | Returns @true@ if the map is active.
bindNavigationServer_map_is_active :: MethodBind
bindNavigationServer_map_is_active
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the map is active.
map_is_active ::
                (NavigationServer :< cls, Object :< cls) => cls -> Rid -> IO Bool
map_is_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_map_is_active
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "map_is_active" '[Rid]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationServer.map_is_active

{-# NOINLINE bindNavigationServer_map_set_active #-}

-- | Sets the map active.
bindNavigationServer_map_set_active :: MethodBind
bindNavigationServer_map_set_active
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the map active.
map_set_active ::
                 (NavigationServer :< cls, Object :< cls) =>
                 cls -> Rid -> Bool -> IO ()
map_set_active cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_map_set_active
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "map_set_active" '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.map_set_active

{-# NOINLINE bindNavigationServer_map_set_cell_height #-}

-- | Set the map cell height used to weld the navigation mesh polygons.
bindNavigationServer_map_set_cell_height :: MethodBind
bindNavigationServer_map_set_cell_height
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_set_cell_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the map cell height used to weld the navigation mesh polygons.
map_set_cell_height ::
                      (NavigationServer :< cls, Object :< cls) =>
                      cls -> Rid -> Float -> IO ()
map_set_cell_height cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_map_set_cell_height
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "map_set_cell_height"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.map_set_cell_height

{-# NOINLINE bindNavigationServer_map_set_cell_size #-}

-- | Set the map cell size used to weld the navigation mesh polygons.
bindNavigationServer_map_set_cell_size :: MethodBind
bindNavigationServer_map_set_cell_size
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_set_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the map cell size used to weld the navigation mesh polygons.
map_set_cell_size ::
                    (NavigationServer :< cls, Object :< cls) =>
                    cls -> Rid -> Float -> IO ()
map_set_cell_size cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_map_set_cell_size
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "map_set_cell_size"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.map_set_cell_size

{-# NOINLINE bindNavigationServer_map_set_edge_connection_margin
             #-}

-- | Set the map edge connection margin used to weld the compatible region edges.
bindNavigationServer_map_set_edge_connection_margin :: MethodBind
bindNavigationServer_map_set_edge_connection_margin
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_set_edge_connection_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the map edge connection margin used to weld the compatible region edges.
map_set_edge_connection_margin ::
                                 (NavigationServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Float -> IO ()
map_set_edge_connection_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationServer_map_set_edge_connection_margin
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer
           "map_set_edge_connection_margin"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.NavigationServer.map_set_edge_connection_margin

{-# NOINLINE bindNavigationServer_map_set_up #-}

-- | Sets the map up direction.
bindNavigationServer_map_set_up :: MethodBind
bindNavigationServer_map_set_up
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "map_set_up" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the map up direction.
map_set_up ::
             (NavigationServer :< cls, Object :< cls) =>
             cls -> Rid -> Vector3 -> IO ()
map_set_up cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_map_set_up (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "map_set_up" '[Rid, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.map_set_up

{-# NOINLINE bindNavigationServer_process #-}

-- | Process the collision avoidance agents.
--   				The result of this process is needed by the physics server, so this must be called in the main thread.
--   				__Note:__ This function is not thread safe.
bindNavigationServer_process :: MethodBind
bindNavigationServer_process
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "process" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Process the collision avoidance agents.
--   				The result of this process is needed by the physics server, so this must be called in the main thread.
--   				__Note:__ This function is not thread safe.
process ::
          (NavigationServer :< cls, Object :< cls) => cls -> Float -> IO ()
process cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_process (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "process" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.process

{-# NOINLINE bindNavigationServer_region_bake_navmesh #-}

-- | Bakes the navigation mesh.
bindNavigationServer_region_bake_navmesh :: MethodBind
bindNavigationServer_region_bake_navmesh
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "region_bake_navmesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bakes the navigation mesh.
region_bake_navmesh ::
                      (NavigationServer :< cls, Object :< cls) =>
                      cls -> NavigationMesh -> Node -> IO ()
region_bake_navmesh cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_region_bake_navmesh
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "region_bake_navmesh"
           '[NavigationMesh, Node]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.region_bake_navmesh

{-# NOINLINE bindNavigationServer_region_create #-}

-- | Creates a new region.
bindNavigationServer_region_create :: MethodBind
bindNavigationServer_region_create
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "region_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new region.
region_create ::
                (NavigationServer :< cls, Object :< cls) => cls -> IO Rid
region_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_region_create
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "region_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.NavigationServer.region_create

{-# NOINLINE bindNavigationServer_region_get_connection_pathway_end
             #-}

-- | Returns the ending point of a connection door. @connection@ is an index between 0 and the return value of @method region_get_connections_count@.
bindNavigationServer_region_get_connection_pathway_end ::
                                                       MethodBind
bindNavigationServer_region_get_connection_pathway_end
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "region_get_connection_pathway_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the ending point of a connection door. @connection@ is an index between 0 and the return value of @method region_get_connections_count@.
region_get_connection_pathway_end ::
                                    (NavigationServer :< cls, Object :< cls) =>
                                    cls -> Rid -> Int -> IO Vector3
region_get_connection_pathway_end cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationServer_region_get_connection_pathway_end
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer
           "region_get_connection_pathway_end"
           '[Rid, Int]
           (IO Vector3)
         where
        nodeMethod
          = Godot.Core.NavigationServer.region_get_connection_pathway_end

{-# NOINLINE bindNavigationServer_region_get_connection_pathway_start
             #-}

-- | Returns the starting point of a connection door. @connection@ is an index between 0 and the return value of @method region_get_connections_count@.
bindNavigationServer_region_get_connection_pathway_start ::
                                                         MethodBind
bindNavigationServer_region_get_connection_pathway_start
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "region_get_connection_pathway_start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the starting point of a connection door. @connection@ is an index between 0 and the return value of @method region_get_connections_count@.
region_get_connection_pathway_start ::
                                      (NavigationServer :< cls, Object :< cls) =>
                                      cls -> Rid -> Int -> IO Vector3
region_get_connection_pathway_start cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationServer_region_get_connection_pathway_start
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer
           "region_get_connection_pathway_start"
           '[Rid, Int]
           (IO Vector3)
         where
        nodeMethod
          = Godot.Core.NavigationServer.region_get_connection_pathway_start

{-# NOINLINE bindNavigationServer_region_get_connections_count #-}

-- | Returns how many connections this @region@ has with other regions in the map.
bindNavigationServer_region_get_connections_count :: MethodBind
bindNavigationServer_region_get_connections_count
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "region_get_connections_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns how many connections this @region@ has with other regions in the map.
region_get_connections_count ::
                               (NavigationServer :< cls, Object :< cls) => cls -> Rid -> IO Int
region_get_connections_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationServer_region_get_connections_count
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "region_get_connections_count"
           '[Rid]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.NavigationServer.region_get_connections_count

{-# NOINLINE bindNavigationServer_region_get_enter_cost #-}

-- | Returns the @enter_cost@ of this @region@.
bindNavigationServer_region_get_enter_cost :: MethodBind
bindNavigationServer_region_get_enter_cost
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "region_get_enter_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @enter_cost@ of this @region@.
region_get_enter_cost ::
                        (NavigationServer :< cls, Object :< cls) => cls -> Rid -> IO Float
region_get_enter_cost cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_region_get_enter_cost
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "region_get_enter_cost" '[Rid]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationServer.region_get_enter_cost

{-# NOINLINE bindNavigationServer_region_get_map #-}

-- | Returns the navigation map @RID@ the requested @region@ is currently assigned to.
bindNavigationServer_region_get_map :: MethodBind
bindNavigationServer_region_get_map
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "region_get_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the navigation map @RID@ the requested @region@ is currently assigned to.
region_get_map ::
                 (NavigationServer :< cls, Object :< cls) => cls -> Rid -> IO Rid
region_get_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_region_get_map
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "region_get_map" '[Rid]
           (IO Rid)
         where
        nodeMethod = Godot.Core.NavigationServer.region_get_map

{-# NOINLINE bindNavigationServer_region_get_navigation_layers #-}

-- | Returns the region's navigation layers.
bindNavigationServer_region_get_navigation_layers :: MethodBind
bindNavigationServer_region_get_navigation_layers
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "region_get_navigation_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the region's navigation layers.
region_get_navigation_layers ::
                               (NavigationServer :< cls, Object :< cls) => cls -> Rid -> IO Int
region_get_navigation_layers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationServer_region_get_navigation_layers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "region_get_navigation_layers"
           '[Rid]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.NavigationServer.region_get_navigation_layers

{-# NOINLINE bindNavigationServer_region_get_travel_cost #-}

-- | Returns the @travel_cost@ of this @region@.
bindNavigationServer_region_get_travel_cost :: MethodBind
bindNavigationServer_region_get_travel_cost
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "region_get_travel_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @travel_cost@ of this @region@.
region_get_travel_cost ::
                         (NavigationServer :< cls, Object :< cls) => cls -> Rid -> IO Float
region_get_travel_cost cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_region_get_travel_cost
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "region_get_travel_cost"
           '[Rid]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationServer.region_get_travel_cost

{-# NOINLINE bindNavigationServer_region_owns_point #-}

-- | Returns @true@ if the provided @point@ in world space is currently owned by the provided navigation @region@. Owned in this context means that one of the region's navigation mesh polygon faces has a possible position at the closest distance to this point compared to all other navigation meshes from other navigation regions that are also registered on the navigation map of the provided region.
--   				If multiple navigation meshes have positions at equal distance the navigation region whose polygons are processed first wins the ownership. Polygons are processed in the same order that navigation regions were registered on the NavigationServer.
--   				__Note:__ If navigation meshes from different navigation regions overlap (which should be avoided in general) the result might not be what is expected.
bindNavigationServer_region_owns_point :: MethodBind
bindNavigationServer_region_owns_point
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "region_owns_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the provided @point@ in world space is currently owned by the provided navigation @region@. Owned in this context means that one of the region's navigation mesh polygon faces has a possible position at the closest distance to this point compared to all other navigation meshes from other navigation regions that are also registered on the navigation map of the provided region.
--   				If multiple navigation meshes have positions at equal distance the navigation region whose polygons are processed first wins the ownership. Polygons are processed in the same order that navigation regions were registered on the NavigationServer.
--   				__Note:__ If navigation meshes from different navigation regions overlap (which should be avoided in general) the result might not be what is expected.
region_owns_point ::
                    (NavigationServer :< cls, Object :< cls) =>
                    cls -> Rid -> Vector3 -> IO Bool
region_owns_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_region_owns_point
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "region_owns_point"
           '[Rid, Vector3]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationServer.region_owns_point

{-# NOINLINE bindNavigationServer_region_set_enter_cost #-}

-- | Sets the @enter_cost@ for this @region@.
bindNavigationServer_region_set_enter_cost :: MethodBind
bindNavigationServer_region_set_enter_cost
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "region_set_enter_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @enter_cost@ for this @region@.
region_set_enter_cost ::
                        (NavigationServer :< cls, Object :< cls) =>
                        cls -> Rid -> Float -> IO ()
region_set_enter_cost cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_region_set_enter_cost
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "region_set_enter_cost"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.region_set_enter_cost

{-# NOINLINE bindNavigationServer_region_set_map #-}

-- | Sets the map for the region.
bindNavigationServer_region_set_map :: MethodBind
bindNavigationServer_region_set_map
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "region_set_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the map for the region.
region_set_map ::
                 (NavigationServer :< cls, Object :< cls) =>
                 cls -> Rid -> Rid -> IO ()
region_set_map cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_region_set_map
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "region_set_map" '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.region_set_map

{-# NOINLINE bindNavigationServer_region_set_navigation_layers #-}

-- | Set the region's navigation layers. This allows selecting regions from a path request (when using @method NavigationServer.map_get_path@).
bindNavigationServer_region_set_navigation_layers :: MethodBind
bindNavigationServer_region_set_navigation_layers
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "region_set_navigation_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the region's navigation layers. This allows selecting regions from a path request (when using @method NavigationServer.map_get_path@).
region_set_navigation_layers ::
                               (NavigationServer :< cls, Object :< cls) =>
                               cls -> Rid -> Int -> IO ()
region_set_navigation_layers cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationServer_region_set_navigation_layers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "region_set_navigation_layers"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.NavigationServer.region_set_navigation_layers

{-# NOINLINE bindNavigationServer_region_set_navmesh #-}

-- | Sets the navigation mesh for the region.
bindNavigationServer_region_set_navmesh :: MethodBind
bindNavigationServer_region_set_navmesh
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "region_set_navmesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the navigation mesh for the region.
region_set_navmesh ::
                     (NavigationServer :< cls, Object :< cls) =>
                     cls -> Rid -> NavigationMesh -> IO ()
region_set_navmesh cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_region_set_navmesh
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "region_set_navmesh"
           '[Rid, NavigationMesh]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.region_set_navmesh

{-# NOINLINE bindNavigationServer_region_set_transform #-}

-- | Sets the global transformation for the region.
bindNavigationServer_region_set_transform :: MethodBind
bindNavigationServer_region_set_transform
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "region_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the global transformation for the region.
region_set_transform ::
                       (NavigationServer :< cls, Object :< cls) =>
                       cls -> Rid -> Transform -> IO ()
region_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_region_set_transform
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "region_set_transform"
           '[Rid, Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.region_set_transform

{-# NOINLINE bindNavigationServer_region_set_travel_cost #-}

-- | Sets the @travel_cost@ for this @region@.
bindNavigationServer_region_set_travel_cost :: MethodBind
bindNavigationServer_region_set_travel_cost
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "region_set_travel_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @travel_cost@ for this @region@.
region_set_travel_cost ::
                         (NavigationServer :< cls, Object :< cls) =>
                         cls -> Rid -> Float -> IO ()
region_set_travel_cost cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_region_set_travel_cost
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "region_set_travel_cost"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.region_set_travel_cost

{-# NOINLINE bindNavigationServer_set_active #-}

-- | Control activation of this server.
bindNavigationServer_set_active :: MethodBind
bindNavigationServer_set_active
  = unsafePerformIO $
      withCString "NavigationServer" $
        \ clsNamePtr ->
          withCString "set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Control activation of this server.
set_active ::
             (NavigationServer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationServer_set_active (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationServer "set_active" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.NavigationServer.set_active