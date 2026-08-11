{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Navigation2DServer
       (Godot.Core.Navigation2DServer.sig_map_changed,
        Godot.Core.Navigation2DServer._emit_map_changed,
        Godot.Core.Navigation2DServer.agent_create,
        Godot.Core.Navigation2DServer.agent_get_map,
        Godot.Core.Navigation2DServer.agent_is_map_changed,
        Godot.Core.Navigation2DServer.agent_set_callback,
        Godot.Core.Navigation2DServer.agent_set_map,
        Godot.Core.Navigation2DServer.agent_set_max_neighbors,
        Godot.Core.Navigation2DServer.agent_set_max_speed,
        Godot.Core.Navigation2DServer.agent_set_neighbor_dist,
        Godot.Core.Navigation2DServer.agent_set_position,
        Godot.Core.Navigation2DServer.agent_set_radius,
        Godot.Core.Navigation2DServer.agent_set_target_velocity,
        Godot.Core.Navigation2DServer.agent_set_time_horizon,
        Godot.Core.Navigation2DServer.agent_set_velocity,
        Godot.Core.Navigation2DServer.free_rid,
        Godot.Core.Navigation2DServer.get_maps,
        Godot.Core.Navigation2DServer.map_create,
        Godot.Core.Navigation2DServer.map_force_update,
        Godot.Core.Navigation2DServer.map_get_agents,
        Godot.Core.Navigation2DServer.map_get_cell_height,
        Godot.Core.Navigation2DServer.map_get_cell_size,
        Godot.Core.Navigation2DServer.map_get_closest_point,
        Godot.Core.Navigation2DServer.map_get_closest_point_owner,
        Godot.Core.Navigation2DServer.map_get_edge_connection_margin,
        Godot.Core.Navigation2DServer.map_get_path,
        Godot.Core.Navigation2DServer.map_get_regions,
        Godot.Core.Navigation2DServer.map_is_active,
        Godot.Core.Navigation2DServer.map_set_active,
        Godot.Core.Navigation2DServer.map_set_cell_height,
        Godot.Core.Navigation2DServer.map_set_cell_size,
        Godot.Core.Navigation2DServer.map_set_edge_connection_margin,
        Godot.Core.Navigation2DServer.region_create,
        Godot.Core.Navigation2DServer.region_get_connection_pathway_end,
        Godot.Core.Navigation2DServer.region_get_connection_pathway_start,
        Godot.Core.Navigation2DServer.region_get_connections_count,
        Godot.Core.Navigation2DServer.region_get_enter_cost,
        Godot.Core.Navigation2DServer.region_get_map,
        Godot.Core.Navigation2DServer.region_get_navigation_layers,
        Godot.Core.Navigation2DServer.region_get_travel_cost,
        Godot.Core.Navigation2DServer.region_owns_point,
        Godot.Core.Navigation2DServer.region_set_enter_cost,
        Godot.Core.Navigation2DServer.region_set_map,
        Godot.Core.Navigation2DServer.region_set_navigation_layers,
        Godot.Core.Navigation2DServer.region_set_navpoly,
        Godot.Core.Navigation2DServer.region_set_transform,
        Godot.Core.Navigation2DServer.region_set_travel_cost)
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
sig_map_changed ::
                Godot.Internal.Dispatch.Signal Navigation2DServer
sig_map_changed = Godot.Internal.Dispatch.Signal "map_changed"

instance NodeSignal Navigation2DServer "map_changed" '[Rid]

{-# NOINLINE bindNavigation2DServer__emit_map_changed #-}

bindNavigation2DServer__emit_map_changed :: MethodBind
bindNavigation2DServer__emit_map_changed
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "_emit_map_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_emit_map_changed ::
                    (Navigation2DServer :< cls, Object :< cls) => cls -> Rid -> IO ()
_emit_map_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer__emit_map_changed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "_emit_map_changed" '[Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer._emit_map_changed

{-# NOINLINE bindNavigation2DServer_agent_create #-}

-- | Creates the agent.
bindNavigation2DServer_agent_create :: MethodBind
bindNavigation2DServer_agent_create
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "agent_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates the agent.
agent_create ::
               (Navigation2DServer :< cls, Object :< cls) => cls -> IO Rid
agent_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_agent_create
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "agent_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.Navigation2DServer.agent_create

{-# NOINLINE bindNavigation2DServer_agent_get_map #-}

-- | Returns the navigation map @RID@ the requested @agent@ is currently assigned to.
bindNavigation2DServer_agent_get_map :: MethodBind
bindNavigation2DServer_agent_get_map
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "agent_get_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the navigation map @RID@ the requested @agent@ is currently assigned to.
agent_get_map ::
                (Navigation2DServer :< cls, Object :< cls) => cls -> Rid -> IO Rid
agent_get_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_agent_get_map
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "agent_get_map" '[Rid]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Navigation2DServer.agent_get_map

{-# NOINLINE bindNavigation2DServer_agent_is_map_changed #-}

-- | Returns @true@ if the map got changed the previous frame.
bindNavigation2DServer_agent_is_map_changed :: MethodBind
bindNavigation2DServer_agent_is_map_changed
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "agent_is_map_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the map got changed the previous frame.
agent_is_map_changed ::
                       (Navigation2DServer :< cls, Object :< cls) => cls -> Rid -> IO Bool
agent_is_map_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_agent_is_map_changed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "agent_is_map_changed"
           '[Rid]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Navigation2DServer.agent_is_map_changed

{-# NOINLINE bindNavigation2DServer_agent_set_callback #-}

-- | Sets the callback @object_id@ and @method@ that gets called after each avoidance processing step for the @agent@. The calculated @safe_velocity@ will be dispatched with a signal to the object just before the physics calculations.
--   				__Note:__ Created callbacks are always processed independently of the SceneTree state as long as the agent is on a navigation map and not freed. To disable the dispatch of a callback from an agent use @method agent_set_callback@ again with a @0@ ObjectID as the @object_id@.
bindNavigation2DServer_agent_set_callback :: MethodBind
bindNavigation2DServer_agent_set_callback
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "agent_set_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the callback @object_id@ and @method@ that gets called after each avoidance processing step for the @agent@. The calculated @safe_velocity@ will be dispatched with a signal to the object just before the physics calculations.
--   				__Note:__ Created callbacks are always processed independently of the SceneTree state as long as the agent is on a navigation map and not freed. To disable the dispatch of a callback from an agent use @method agent_set_callback@ again with a @0@ ObjectID as the @object_id@.
agent_set_callback ::
                     (Navigation2DServer :< cls, Object :< cls) =>
                     cls -> Rid -> Int -> GodotString -> Maybe GodotVariant -> IO ()
agent_set_callback cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe VariantNil toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_agent_set_callback
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "agent_set_callback"
           '[Rid, Int, GodotString, Maybe GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.agent_set_callback

{-# NOINLINE bindNavigation2DServer_agent_set_map #-}

-- | Puts the agent in the map.
bindNavigation2DServer_agent_set_map :: MethodBind
bindNavigation2DServer_agent_set_map
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "agent_set_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Puts the agent in the map.
agent_set_map ::
                (Navigation2DServer :< cls, Object :< cls) =>
                cls -> Rid -> Rid -> IO ()
agent_set_map cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_agent_set_map
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "agent_set_map" '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.agent_set_map

{-# NOINLINE bindNavigation2DServer_agent_set_max_neighbors #-}

-- | Sets the maximum number of other agents the agent takes into account in the navigation. The larger this number, the longer the running time of the simulation. If the number is too low, the simulation will not be safe.
bindNavigation2DServer_agent_set_max_neighbors :: MethodBind
bindNavigation2DServer_agent_set_max_neighbors
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "agent_set_max_neighbors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the maximum number of other agents the agent takes into account in the navigation. The larger this number, the longer the running time of the simulation. If the number is too low, the simulation will not be safe.
agent_set_max_neighbors ::
                          (Navigation2DServer :< cls, Object :< cls) =>
                          cls -> Rid -> Int -> IO ()
agent_set_max_neighbors cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigation2DServer_agent_set_max_neighbors
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "agent_set_max_neighbors"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.agent_set_max_neighbors

{-# NOINLINE bindNavigation2DServer_agent_set_max_speed #-}

-- | Sets the maximum speed of the agent. Must be positive.
bindNavigation2DServer_agent_set_max_speed :: MethodBind
bindNavigation2DServer_agent_set_max_speed
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "agent_set_max_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the maximum speed of the agent. Must be positive.
agent_set_max_speed ::
                      (Navigation2DServer :< cls, Object :< cls) =>
                      cls -> Rid -> Float -> IO ()
agent_set_max_speed cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_agent_set_max_speed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "agent_set_max_speed"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.agent_set_max_speed

{-# NOINLINE bindNavigation2DServer_agent_set_neighbor_dist #-}

-- | Sets the maximum distance to other agents this agent takes into account in the navigation. The larger this number, the longer the running time of the simulation. If the number is too low, the simulation will not be safe.
bindNavigation2DServer_agent_set_neighbor_dist :: MethodBind
bindNavigation2DServer_agent_set_neighbor_dist
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "agent_set_neighbor_dist" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the maximum distance to other agents this agent takes into account in the navigation. The larger this number, the longer the running time of the simulation. If the number is too low, the simulation will not be safe.
agent_set_neighbor_dist ::
                          (Navigation2DServer :< cls, Object :< cls) =>
                          cls -> Rid -> Float -> IO ()
agent_set_neighbor_dist cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigation2DServer_agent_set_neighbor_dist
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "agent_set_neighbor_dist"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.agent_set_neighbor_dist

{-# NOINLINE bindNavigation2DServer_agent_set_position #-}

-- | Sets the position of the agent in world space.
bindNavigation2DServer_agent_set_position :: MethodBind
bindNavigation2DServer_agent_set_position
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "agent_set_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position of the agent in world space.
agent_set_position ::
                     (Navigation2DServer :< cls, Object :< cls) =>
                     cls -> Rid -> Vector2 -> IO ()
agent_set_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_agent_set_position
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "agent_set_position"
           '[Rid, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.agent_set_position

{-# NOINLINE bindNavigation2DServer_agent_set_radius #-}

-- | Sets the radius of the agent.
bindNavigation2DServer_agent_set_radius :: MethodBind
bindNavigation2DServer_agent_set_radius
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "agent_set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the radius of the agent.
agent_set_radius ::
                   (Navigation2DServer :< cls, Object :< cls) =>
                   cls -> Rid -> Float -> IO ()
agent_set_radius cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_agent_set_radius
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "agent_set_radius"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.agent_set_radius

{-# NOINLINE bindNavigation2DServer_agent_set_target_velocity #-}

-- | Sets the new target velocity.
bindNavigation2DServer_agent_set_target_velocity :: MethodBind
bindNavigation2DServer_agent_set_target_velocity
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "agent_set_target_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the new target velocity.
agent_set_target_velocity ::
                            (Navigation2DServer :< cls, Object :< cls) =>
                            cls -> Rid -> Vector2 -> IO ()
agent_set_target_velocity cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigation2DServer_agent_set_target_velocity
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "agent_set_target_velocity"
           '[Rid, Vector2]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Navigation2DServer.agent_set_target_velocity

{-# NOINLINE bindNavigation2DServer_agent_set_time_horizon #-}

-- | The minimal amount of time for which the agent's velocities that are computed by the simulation are safe with respect to other agents. The larger this number, the sooner this agent will respond to the presence of other agents, but the less freedom this agent has in choosing its velocities. Must be positive.
bindNavigation2DServer_agent_set_time_horizon :: MethodBind
bindNavigation2DServer_agent_set_time_horizon
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "agent_set_time_horizon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimal amount of time for which the agent's velocities that are computed by the simulation are safe with respect to other agents. The larger this number, the sooner this agent will respond to the presence of other agents, but the less freedom this agent has in choosing its velocities. Must be positive.
agent_set_time_horizon ::
                         (Navigation2DServer :< cls, Object :< cls) =>
                         cls -> Rid -> Float -> IO ()
agent_set_time_horizon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigation2DServer_agent_set_time_horizon
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "agent_set_time_horizon"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.agent_set_time_horizon

{-# NOINLINE bindNavigation2DServer_agent_set_velocity #-}

-- | Sets the current velocity of the agent.
bindNavigation2DServer_agent_set_velocity :: MethodBind
bindNavigation2DServer_agent_set_velocity
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "agent_set_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the current velocity of the agent.
agent_set_velocity ::
                     (Navigation2DServer :< cls, Object :< cls) =>
                     cls -> Rid -> Vector2 -> IO ()
agent_set_velocity cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_agent_set_velocity
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "agent_set_velocity"
           '[Rid, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.agent_set_velocity

{-# NOINLINE bindNavigation2DServer_free_rid #-}

-- | Destroys an object created by the Navigation2DServer.
--   				__Note:__ See @method VisualServer.free_rid@ for details on how to handle RIDs for freed objects.
bindNavigation2DServer_free_rid :: MethodBind
bindNavigation2DServer_free_rid
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "free_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Destroys an object created by the Navigation2DServer.
--   				__Note:__ See @method VisualServer.free_rid@ for details on how to handle RIDs for freed objects.
free_rid ::
           (Navigation2DServer :< cls, Object :< cls) => cls -> Rid -> IO ()
free_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_free_rid (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "free_rid" '[Rid] (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.free_rid

{-# NOINLINE bindNavigation2DServer_get_maps #-}

-- | Returns all created navigation map @RID@s on the NavigationServer. This returns both 2D and 3D created navigation maps as there is technically no distinction between them.
bindNavigation2DServer_get_maps :: MethodBind
bindNavigation2DServer_get_maps
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "get_maps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all created navigation map @RID@s on the NavigationServer. This returns both 2D and 3D created navigation maps as there is technically no distinction between them.
get_maps ::
           (Navigation2DServer :< cls, Object :< cls) => cls -> IO Array
get_maps cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_get_maps (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "get_maps" '[] (IO Array)
         where
        nodeMethod = Godot.Core.Navigation2DServer.get_maps

{-# NOINLINE bindNavigation2DServer_map_create #-}

-- | Create a new map.
bindNavigation2DServer_map_create :: MethodBind
bindNavigation2DServer_map_create
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "map_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Create a new map.
map_create ::
             (Navigation2DServer :< cls, Object :< cls) => cls -> IO Rid
map_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_map_create
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "map_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.Navigation2DServer.map_create

{-# NOINLINE bindNavigation2DServer_map_force_update #-}

-- | This function immediately forces synchronization of the specified navigation @map@ @RID@. By default navigation maps are only synchronized at the end of each physics frame. This function can be used to immediately (re)calculate all the navigation meshes and region connections of the navigation map. This makes it possible to query a navigation path for a changed map immediately and in the same frame (multiple times if needed).
--   				Due to technical restrictions the current NavigationServer command queue will be flushed. This means all already queued update commands for this physics frame will be executed, even those intended for other maps, regions and agents not part of the specified map. The expensive computation of the navigation meshes and region connections of a map will only be done for the specified map. Other maps will receive the normal synchronization at the end of the physics frame. Should the specified map receive changes after the forced update it will update again as well when the other maps receive their update.
--   				Avoidance processing and dispatch of the @safe_velocity@ signals is untouched by this function and continues to happen for all maps and agents at the end of the physics frame.
--   				__Note:__ With great power comes great responsibility. This function should only be used by users that really know what they are doing and have a good reason for it. Forcing an immediate update of a navigation map requires locking the NavigationServer and flushing the entire NavigationServer command queue. Not only can this severely impact the performance of a game but it can also introduce bugs if used inappropriately without much foresight.
bindNavigation2DServer_map_force_update :: MethodBind
bindNavigation2DServer_map_force_update
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "map_force_update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This function immediately forces synchronization of the specified navigation @map@ @RID@. By default navigation maps are only synchronized at the end of each physics frame. This function can be used to immediately (re)calculate all the navigation meshes and region connections of the navigation map. This makes it possible to query a navigation path for a changed map immediately and in the same frame (multiple times if needed).
--   				Due to technical restrictions the current NavigationServer command queue will be flushed. This means all already queued update commands for this physics frame will be executed, even those intended for other maps, regions and agents not part of the specified map. The expensive computation of the navigation meshes and region connections of a map will only be done for the specified map. Other maps will receive the normal synchronization at the end of the physics frame. Should the specified map receive changes after the forced update it will update again as well when the other maps receive their update.
--   				Avoidance processing and dispatch of the @safe_velocity@ signals is untouched by this function and continues to happen for all maps and agents at the end of the physics frame.
--   				__Note:__ With great power comes great responsibility. This function should only be used by users that really know what they are doing and have a good reason for it. Forcing an immediate update of a navigation map requires locking the NavigationServer and flushing the entire NavigationServer command queue. Not only can this severely impact the performance of a game but it can also introduce bugs if used inappropriately without much foresight.
map_force_update ::
                   (Navigation2DServer :< cls, Object :< cls) => cls -> Rid -> IO ()
map_force_update cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_map_force_update
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "map_force_update" '[Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.map_force_update

{-# NOINLINE bindNavigation2DServer_map_get_agents #-}

-- | Returns all navigation agents @RID@s that are currently assigned to the requested navigation @map@.
bindNavigation2DServer_map_get_agents :: MethodBind
bindNavigation2DServer_map_get_agents
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "map_get_agents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all navigation agents @RID@s that are currently assigned to the requested navigation @map@.
map_get_agents ::
                 (Navigation2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> IO Array
map_get_agents cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_map_get_agents
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "map_get_agents" '[Rid]
           (IO Array)
         where
        nodeMethod = Godot.Core.Navigation2DServer.map_get_agents

{-# NOINLINE bindNavigation2DServer_map_get_cell_height #-}

-- | Returns the map cell height. __Note:__ Currently not implemented.
bindNavigation2DServer_map_get_cell_height :: MethodBind
bindNavigation2DServer_map_get_cell_height
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "map_get_cell_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the map cell height. __Note:__ Currently not implemented.
map_get_cell_height ::
                      (Navigation2DServer :< cls, Object :< cls) =>
                      cls -> Rid -> IO Float
map_get_cell_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_map_get_cell_height
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "map_get_cell_height" '[Rid]
           (IO Float)
         where
        nodeMethod = Godot.Core.Navigation2DServer.map_get_cell_height

{-# NOINLINE bindNavigation2DServer_map_get_cell_size #-}

-- | Returns the map cell size.
bindNavigation2DServer_map_get_cell_size :: MethodBind
bindNavigation2DServer_map_get_cell_size
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "map_get_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the map cell size.
map_get_cell_size ::
                    (Navigation2DServer :< cls, Object :< cls) =>
                    cls -> Rid -> IO Float
map_get_cell_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_map_get_cell_size
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "map_get_cell_size" '[Rid]
           (IO Float)
         where
        nodeMethod = Godot.Core.Navigation2DServer.map_get_cell_size

{-# NOINLINE bindNavigation2DServer_map_get_closest_point #-}

-- | Returns the point closest to the provided @to_point@ on the navigation mesh surface.
bindNavigation2DServer_map_get_closest_point :: MethodBind
bindNavigation2DServer_map_get_closest_point
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "map_get_closest_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the point closest to the provided @to_point@ on the navigation mesh surface.
map_get_closest_point ::
                        (Navigation2DServer :< cls, Object :< cls) =>
                        cls -> Rid -> Vector2 -> IO Vector2
map_get_closest_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_map_get_closest_point
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "map_get_closest_point"
           '[Rid, Vector2]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Navigation2DServer.map_get_closest_point

{-# NOINLINE bindNavigation2DServer_map_get_closest_point_owner #-}

-- | Returns the owner region RID for the point returned by @method map_get_closest_point@.
bindNavigation2DServer_map_get_closest_point_owner :: MethodBind
bindNavigation2DServer_map_get_closest_point_owner
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "map_get_closest_point_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the owner region RID for the point returned by @method map_get_closest_point@.
map_get_closest_point_owner ::
                              (Navigation2DServer :< cls, Object :< cls) =>
                              cls -> Rid -> Vector2 -> IO Rid
map_get_closest_point_owner cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigation2DServer_map_get_closest_point_owner
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer
           "map_get_closest_point_owner"
           '[Rid, Vector2]
           (IO Rid)
         where
        nodeMethod
          = Godot.Core.Navigation2DServer.map_get_closest_point_owner

{-# NOINLINE bindNavigation2DServer_map_get_edge_connection_margin
             #-}

-- | Returns the edge connection margin of the map. The edge connection margin is a distance used to connect two regions.
bindNavigation2DServer_map_get_edge_connection_margin :: MethodBind
bindNavigation2DServer_map_get_edge_connection_margin
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "map_get_edge_connection_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the edge connection margin of the map. The edge connection margin is a distance used to connect two regions.
map_get_edge_connection_margin ::
                                 (Navigation2DServer :< cls, Object :< cls) =>
                                 cls -> Rid -> IO Float
map_get_edge_connection_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigation2DServer_map_get_edge_connection_margin
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer
           "map_get_edge_connection_margin"
           '[Rid]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.Navigation2DServer.map_get_edge_connection_margin

{-# NOINLINE bindNavigation2DServer_map_get_path #-}

-- | Returns the navigation path to reach the destination from the origin. @navigation_layers@ is a bitmask of all region layers that are allowed to be in the path.
bindNavigation2DServer_map_get_path :: MethodBind
bindNavigation2DServer_map_get_path
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "map_get_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the navigation path to reach the destination from the origin. @navigation_layers@ is a bitmask of all region layers that are allowed to be in the path.
map_get_path ::
               (Navigation2DServer :< cls, Object :< cls) =>
               cls ->
                 Rid ->
                   Vector2 -> Vector2 -> Bool -> Maybe Int -> IO PoolVector2Array
map_get_path cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       maybe (VariantInt (1)) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_map_get_path
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "map_get_path"
           '[Rid, Vector2, Vector2, Bool, Maybe Int]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.Navigation2DServer.map_get_path

{-# NOINLINE bindNavigation2DServer_map_get_regions #-}

-- | Returns all navigation regions @RID@s that are currently assigned to the requested navigation @map@.
bindNavigation2DServer_map_get_regions :: MethodBind
bindNavigation2DServer_map_get_regions
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "map_get_regions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all navigation regions @RID@s that are currently assigned to the requested navigation @map@.
map_get_regions ::
                  (Navigation2DServer :< cls, Object :< cls) =>
                  cls -> Rid -> IO Array
map_get_regions cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_map_get_regions
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "map_get_regions" '[Rid]
           (IO Array)
         where
        nodeMethod = Godot.Core.Navigation2DServer.map_get_regions

{-# NOINLINE bindNavigation2DServer_map_is_active #-}

-- | Returns @true@ if the map is active.
bindNavigation2DServer_map_is_active :: MethodBind
bindNavigation2DServer_map_is_active
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "map_is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the map is active.
map_is_active ::
                (Navigation2DServer :< cls, Object :< cls) => cls -> Rid -> IO Bool
map_is_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_map_is_active
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "map_is_active" '[Rid]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Navigation2DServer.map_is_active

{-# NOINLINE bindNavigation2DServer_map_set_active #-}

-- | Sets the map active.
bindNavigation2DServer_map_set_active :: MethodBind
bindNavigation2DServer_map_set_active
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "map_set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the map active.
map_set_active ::
                 (Navigation2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Bool -> IO ()
map_set_active cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_map_set_active
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "map_set_active"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.map_set_active

{-# NOINLINE bindNavigation2DServer_map_set_cell_height #-}

-- | Set the map cell height used to weld the navigation mesh polygons. __Note:__ Currently not implemented.
bindNavigation2DServer_map_set_cell_height :: MethodBind
bindNavigation2DServer_map_set_cell_height
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "map_set_cell_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the map cell height used to weld the navigation mesh polygons. __Note:__ Currently not implemented.
map_set_cell_height ::
                      (Navigation2DServer :< cls, Object :< cls) =>
                      cls -> Rid -> Float -> IO ()
map_set_cell_height cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_map_set_cell_height
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "map_set_cell_height"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.map_set_cell_height

{-# NOINLINE bindNavigation2DServer_map_set_cell_size #-}

-- | Set the map cell size used to weld the navigation mesh polygons.
bindNavigation2DServer_map_set_cell_size :: MethodBind
bindNavigation2DServer_map_set_cell_size
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "map_set_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the map cell size used to weld the navigation mesh polygons.
map_set_cell_size ::
                    (Navigation2DServer :< cls, Object :< cls) =>
                    cls -> Rid -> Float -> IO ()
map_set_cell_size cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_map_set_cell_size
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "map_set_cell_size"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.map_set_cell_size

{-# NOINLINE bindNavigation2DServer_map_set_edge_connection_margin
             #-}

-- | Set the map edge connection margin used to weld the compatible region edges.
bindNavigation2DServer_map_set_edge_connection_margin :: MethodBind
bindNavigation2DServer_map_set_edge_connection_margin
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "map_set_edge_connection_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the map edge connection margin used to weld the compatible region edges.
map_set_edge_connection_margin ::
                                 (Navigation2DServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Float -> IO ()
map_set_edge_connection_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigation2DServer_map_set_edge_connection_margin
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer
           "map_set_edge_connection_margin"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Navigation2DServer.map_set_edge_connection_margin

{-# NOINLINE bindNavigation2DServer_region_create #-}

-- | Creates a new region.
bindNavigation2DServer_region_create :: MethodBind
bindNavigation2DServer_region_create
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "region_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new region.
region_create ::
                (Navigation2DServer :< cls, Object :< cls) => cls -> IO Rid
region_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_region_create
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "region_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.Navigation2DServer.region_create

{-# NOINLINE bindNavigation2DServer_region_get_connection_pathway_end
             #-}

-- | Returns the ending point of a connection door. @connection@ is an index between 0 and the return value of @method region_get_connections_count@.
bindNavigation2DServer_region_get_connection_pathway_end ::
                                                         MethodBind
bindNavigation2DServer_region_get_connection_pathway_end
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "region_get_connection_pathway_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the ending point of a connection door. @connection@ is an index between 0 and the return value of @method region_get_connections_count@.
region_get_connection_pathway_end ::
                                    (Navigation2DServer :< cls, Object :< cls) =>
                                    cls -> Rid -> Int -> IO Vector2
region_get_connection_pathway_end cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigation2DServer_region_get_connection_pathway_end
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer
           "region_get_connection_pathway_end"
           '[Rid, Int]
           (IO Vector2)
         where
        nodeMethod
          = Godot.Core.Navigation2DServer.region_get_connection_pathway_end

{-# NOINLINE bindNavigation2DServer_region_get_connection_pathway_start
             #-}

-- | Returns the starting point of a connection door. @connection@ is an index between 0 and the return value of @method region_get_connections_count@.
bindNavigation2DServer_region_get_connection_pathway_start ::
                                                           MethodBind
bindNavigation2DServer_region_get_connection_pathway_start
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "region_get_connection_pathway_start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the starting point of a connection door. @connection@ is an index between 0 and the return value of @method region_get_connections_count@.
region_get_connection_pathway_start ::
                                      (Navigation2DServer :< cls, Object :< cls) =>
                                      cls -> Rid -> Int -> IO Vector2
region_get_connection_pathway_start cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigation2DServer_region_get_connection_pathway_start
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer
           "region_get_connection_pathway_start"
           '[Rid, Int]
           (IO Vector2)
         where
        nodeMethod
          = Godot.Core.Navigation2DServer.region_get_connection_pathway_start

{-# NOINLINE bindNavigation2DServer_region_get_connections_count
             #-}

-- | Returns how many connections this @region@ has with other regions in the map.
bindNavigation2DServer_region_get_connections_count :: MethodBind
bindNavigation2DServer_region_get_connections_count
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "region_get_connections_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns how many connections this @region@ has with other regions in the map.
region_get_connections_count ::
                               (Navigation2DServer :< cls, Object :< cls) => cls -> Rid -> IO Int
region_get_connections_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigation2DServer_region_get_connections_count
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer
           "region_get_connections_count"
           '[Rid]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.Navigation2DServer.region_get_connections_count

{-# NOINLINE bindNavigation2DServer_region_get_enter_cost #-}

-- | Returns the @enter_cost@ of this @region@.
bindNavigation2DServer_region_get_enter_cost :: MethodBind
bindNavigation2DServer_region_get_enter_cost
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "region_get_enter_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @enter_cost@ of this @region@.
region_get_enter_cost ::
                        (Navigation2DServer :< cls, Object :< cls) =>
                        cls -> Rid -> IO Float
region_get_enter_cost cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_region_get_enter_cost
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "region_get_enter_cost"
           '[Rid]
           (IO Float)
         where
        nodeMethod = Godot.Core.Navigation2DServer.region_get_enter_cost

{-# NOINLINE bindNavigation2DServer_region_get_map #-}

-- | Returns the navigation map @RID@ the requested @region@ is currently assigned to.
bindNavigation2DServer_region_get_map :: MethodBind
bindNavigation2DServer_region_get_map
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "region_get_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the navigation map @RID@ the requested @region@ is currently assigned to.
region_get_map ::
                 (Navigation2DServer :< cls, Object :< cls) => cls -> Rid -> IO Rid
region_get_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_region_get_map
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "region_get_map" '[Rid]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Navigation2DServer.region_get_map

{-# NOINLINE bindNavigation2DServer_region_get_navigation_layers
             #-}

-- | Returns the region's navigation layers.
bindNavigation2DServer_region_get_navigation_layers :: MethodBind
bindNavigation2DServer_region_get_navigation_layers
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "region_get_navigation_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the region's navigation layers.
region_get_navigation_layers ::
                               (Navigation2DServer :< cls, Object :< cls) => cls -> Rid -> IO Int
region_get_navigation_layers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigation2DServer_region_get_navigation_layers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer
           "region_get_navigation_layers"
           '[Rid]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.Navigation2DServer.region_get_navigation_layers

{-# NOINLINE bindNavigation2DServer_region_get_travel_cost #-}

-- | Returns the @travel_cost@ of this @region@.
bindNavigation2DServer_region_get_travel_cost :: MethodBind
bindNavigation2DServer_region_get_travel_cost
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "region_get_travel_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @travel_cost@ of this @region@.
region_get_travel_cost ::
                         (Navigation2DServer :< cls, Object :< cls) =>
                         cls -> Rid -> IO Float
region_get_travel_cost cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigation2DServer_region_get_travel_cost
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "region_get_travel_cost"
           '[Rid]
           (IO Float)
         where
        nodeMethod = Godot.Core.Navigation2DServer.region_get_travel_cost

{-# NOINLINE bindNavigation2DServer_region_owns_point #-}

-- | Returns @true@ if the provided @point@ in world space is currently owned by the provided navigation @region@. Owned in this context means that one of the region's navigation mesh polygon faces has a possible position at the closest distance to this point compared to all other navigation meshes from other navigation regions that are also registered on the navigation map of the provided region.
--   				If multiple navigation meshes have positions at equal distance the navigation region whose polygons are processed first wins the ownership. Polygons are processed in the same order that navigation regions were registered on the NavigationServer.
--   				__Note:__ If navigation meshes from different navigation regions overlap (which should be avoided in general) the result might not be what is expected.
bindNavigation2DServer_region_owns_point :: MethodBind
bindNavigation2DServer_region_owns_point
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "region_owns_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the provided @point@ in world space is currently owned by the provided navigation @region@. Owned in this context means that one of the region's navigation mesh polygon faces has a possible position at the closest distance to this point compared to all other navigation meshes from other navigation regions that are also registered on the navigation map of the provided region.
--   				If multiple navigation meshes have positions at equal distance the navigation region whose polygons are processed first wins the ownership. Polygons are processed in the same order that navigation regions were registered on the NavigationServer.
--   				__Note:__ If navigation meshes from different navigation regions overlap (which should be avoided in general) the result might not be what is expected.
region_owns_point ::
                    (Navigation2DServer :< cls, Object :< cls) =>
                    cls -> Rid -> Vector2 -> IO Bool
region_owns_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_region_owns_point
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "region_owns_point"
           '[Rid, Vector2]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Navigation2DServer.region_owns_point

{-# NOINLINE bindNavigation2DServer_region_set_enter_cost #-}

-- | Sets the @enter_cost@ for this @region@.
bindNavigation2DServer_region_set_enter_cost :: MethodBind
bindNavigation2DServer_region_set_enter_cost
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "region_set_enter_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @enter_cost@ for this @region@.
region_set_enter_cost ::
                        (Navigation2DServer :< cls, Object :< cls) =>
                        cls -> Rid -> Float -> IO ()
region_set_enter_cost cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_region_set_enter_cost
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "region_set_enter_cost"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.region_set_enter_cost

{-# NOINLINE bindNavigation2DServer_region_set_map #-}

-- | Sets the map for the region.
bindNavigation2DServer_region_set_map :: MethodBind
bindNavigation2DServer_region_set_map
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "region_set_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the map for the region.
region_set_map ::
                 (Navigation2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Rid -> IO ()
region_set_map cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_region_set_map
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "region_set_map" '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.region_set_map

{-# NOINLINE bindNavigation2DServer_region_set_navigation_layers
             #-}

-- | Set the region's navigation layers. This allows selecting regions from a path request (when using @method Navigation2DServer.map_get_path@).
bindNavigation2DServer_region_set_navigation_layers :: MethodBind
bindNavigation2DServer_region_set_navigation_layers
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "region_set_navigation_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the region's navigation layers. This allows selecting regions from a path request (when using @method Navigation2DServer.map_get_path@).
region_set_navigation_layers ::
                               (Navigation2DServer :< cls, Object :< cls) =>
                               cls -> Rid -> Int -> IO ()
region_set_navigation_layers cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigation2DServer_region_set_navigation_layers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer
           "region_set_navigation_layers"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Navigation2DServer.region_set_navigation_layers

{-# NOINLINE bindNavigation2DServer_region_set_navpoly #-}

-- | Sets the navigation mesh for the region.
bindNavigation2DServer_region_set_navpoly :: MethodBind
bindNavigation2DServer_region_set_navpoly
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "region_set_navpoly" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the navigation mesh for the region.
region_set_navpoly ::
                     (Navigation2DServer :< cls, Object :< cls) =>
                     cls -> Rid -> NavigationPolygon -> IO ()
region_set_navpoly cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_region_set_navpoly
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "region_set_navpoly"
           '[Rid, NavigationPolygon]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.region_set_navpoly

{-# NOINLINE bindNavigation2DServer_region_set_transform #-}

-- | Sets the global transformation for the region.
bindNavigation2DServer_region_set_transform :: MethodBind
bindNavigation2DServer_region_set_transform
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "region_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the global transformation for the region.
region_set_transform ::
                       (Navigation2DServer :< cls, Object :< cls) =>
                       cls -> Rid -> Transform2d -> IO ()
region_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2DServer_region_set_transform
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "region_set_transform"
           '[Rid, Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.region_set_transform

{-# NOINLINE bindNavigation2DServer_region_set_travel_cost #-}

-- | Sets the @travel_cost@ for this @region@.
bindNavigation2DServer_region_set_travel_cost :: MethodBind
bindNavigation2DServer_region_set_travel_cost
  = unsafePerformIO $
      withCString "Navigation2DServer" $
        \ clsNamePtr ->
          withCString "region_set_travel_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @travel_cost@ for this @region@.
region_set_travel_cost ::
                         (Navigation2DServer :< cls, Object :< cls) =>
                         cls -> Rid -> Float -> IO ()
region_set_travel_cost cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigation2DServer_region_set_travel_cost
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2DServer "region_set_travel_cost"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2DServer.region_set_travel_cost