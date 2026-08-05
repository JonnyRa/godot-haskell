{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.RoomManager
       (Godot.Core.RoomManager._PVS_MODE_PARTIAL,
        Godot.Core.RoomManager._PVS_MODE_FULL,
        Godot.Core.RoomManager._PVS_MODE_DISABLED,
        Godot.Core.RoomManager.get_debug_sprawl,
        Godot.Core.RoomManager.get_default_portal_margin,
        Godot.Core.RoomManager.get_gameplay_monitor_enabled,
        Godot.Core.RoomManager.get_merge_meshes,
        Godot.Core.RoomManager.get_overlap_warning_threshold,
        Godot.Core.RoomManager.get_portal_depth_limit,
        Godot.Core.RoomManager.get_preview_camera_path,
        Godot.Core.RoomManager.get_pvs_mode,
        Godot.Core.RoomManager.get_room_simplify,
        Godot.Core.RoomManager.get_roomlist_path,
        Godot.Core.RoomManager.get_show_margins,
        Godot.Core.RoomManager.get_use_secondary_pvs,
        Godot.Core.RoomManager.rooms_clear,
        Godot.Core.RoomManager.rooms_convert,
        Godot.Core.RoomManager.rooms_get_active,
        Godot.Core.RoomManager.rooms_set_active,
        Godot.Core.RoomManager.set_debug_sprawl,
        Godot.Core.RoomManager.set_default_portal_margin,
        Godot.Core.RoomManager.set_gameplay_monitor_enabled,
        Godot.Core.RoomManager.set_merge_meshes,
        Godot.Core.RoomManager.set_overlap_warning_threshold,
        Godot.Core.RoomManager.set_portal_depth_limit,
        Godot.Core.RoomManager.set_preview_camera_path,
        Godot.Core.RoomManager.set_pvs_mode,
        Godot.Core.RoomManager.set_room_simplify,
        Godot.Core.RoomManager.set_roomlist_path,
        Godot.Core.RoomManager.set_show_margins,
        Godot.Core.RoomManager.set_use_secondary_pvs)
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

_PVS_MODE_PARTIAL :: Int
_PVS_MODE_PARTIAL = 1

_PVS_MODE_FULL :: Int
_PVS_MODE_FULL = 2

_PVS_MODE_DISABLED :: Int
_PVS_MODE_DISABLED = 0

instance NodeProperty RoomManager "active" Bool 'False where
        nodeProperty
          = (rooms_get_active, wrapDroppingSetter rooms_set_active, Nothing)

instance NodeProperty RoomManager "debug_sprawl" Bool 'False where
        nodeProperty
          = (get_debug_sprawl, wrapDroppingSetter set_debug_sprawl, Nothing)

instance NodeProperty RoomManager "default_portal_margin" Float
           'False
         where
        nodeProperty
          = (get_default_portal_margin,
             wrapDroppingSetter set_default_portal_margin, Nothing)

instance NodeProperty RoomManager "gameplay_monitor" Bool 'False
         where
        nodeProperty
          = (get_gameplay_monitor_enabled,
             wrapDroppingSetter set_gameplay_monitor_enabled, Nothing)

instance NodeProperty RoomManager "merge_meshes" Bool 'False where
        nodeProperty
          = (get_merge_meshes, wrapDroppingSetter set_merge_meshes, Nothing)

instance NodeProperty RoomManager "overlap_warning_threshold" Int
           'False
         where
        nodeProperty
          = (get_overlap_warning_threshold,
             wrapDroppingSetter set_overlap_warning_threshold, Nothing)

instance NodeProperty RoomManager "portal_depth_limit" Int 'False
         where
        nodeProperty
          = (get_portal_depth_limit,
             wrapDroppingSetter set_portal_depth_limit, Nothing)

instance NodeProperty RoomManager "preview_camera" NodePath 'False
         where
        nodeProperty
          = (get_preview_camera_path,
             wrapDroppingSetter set_preview_camera_path, Nothing)

instance NodeProperty RoomManager "pvs_mode" Int 'False where
        nodeProperty
          = (get_pvs_mode, wrapDroppingSetter set_pvs_mode, Nothing)

instance NodeProperty RoomManager "room_simplify" Float 'False
         where
        nodeProperty
          = (get_room_simplify, wrapDroppingSetter set_room_simplify,
             Nothing)

instance NodeProperty RoomManager "roomlist" NodePath 'False where
        nodeProperty
          = (get_roomlist_path, wrapDroppingSetter set_roomlist_path,
             Nothing)

instance NodeProperty RoomManager "show_margins" Bool 'False where
        nodeProperty
          = (get_show_margins, wrapDroppingSetter set_show_margins, Nothing)

instance NodeProperty RoomManager "use_secondary_pvs" Bool 'False
         where
        nodeProperty
          = (get_use_secondary_pvs, wrapDroppingSetter set_use_secondary_pvs,
             Nothing)

{-# NOINLINE bindRoomManager_get_debug_sprawl #-}

-- | Large objects can 'sprawl' over (be present in) more than one room. It can be useful to visualize which objects are sprawling outside the current room.
--   			Toggling this setting turns this debug view on and off.
bindRoomManager_get_debug_sprawl :: MethodBind
bindRoomManager_get_debug_sprawl
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "get_debug_sprawl" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Large objects can 'sprawl' over (be present in) more than one room. It can be useful to visualize which objects are sprawling outside the current room.
--   			Toggling this setting turns this debug view on and off.
get_debug_sprawl ::
                   (RoomManager :< cls, Object :< cls) => cls -> IO Bool
get_debug_sprawl cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_get_debug_sprawl
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "get_debug_sprawl" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.RoomManager.get_debug_sprawl

{-# NOINLINE bindRoomManager_get_default_portal_margin #-}

-- | Usually we don't want objects that only __just__ cross a boundary into an adjacent @Room@ to sprawl into that room. To prevent this, each @Portal@ has an extra margin, or tolerance zone where objects can enter without sprawling to a neighbouring room.
--   			In most cases you can set this here for all portals. It is possible to override the margin for each portal.
bindRoomManager_get_default_portal_margin :: MethodBind
bindRoomManager_get_default_portal_margin
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "get_default_portal_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Usually we don't want objects that only __just__ cross a boundary into an adjacent @Room@ to sprawl into that room. To prevent this, each @Portal@ has an extra margin, or tolerance zone where objects can enter without sprawling to a neighbouring room.
--   			In most cases you can set this here for all portals. It is possible to override the margin for each portal.
get_default_portal_margin ::
                            (RoomManager :< cls, Object :< cls) => cls -> IO Float
get_default_portal_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_get_default_portal_margin
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "get_default_portal_margin" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.RoomManager.get_default_portal_margin

{-# NOINLINE bindRoomManager_get_gameplay_monitor_enabled #-}

-- | When using a partial or full PVS, the gameplay monitor allows you to receive callbacks when roaming objects or rooms enter or exit the __gameplay area__. The gameplay area is defined as either the primary, or secondary PVS.
--   			These callbacks allow you to, for example, reduce processing for objects that are far from the player, or turn on and off AI.
--   			You can either choose to receive callbacks as notifications through the @_notification@ function, or as signals.
--   			@NOTIFICATION_ENTER_GAMEPLAY@
--   			@NOTIFICATION_EXIT_GAMEPLAY@
--   			Signals: @"gameplay_entered"@, @"gameplay_exited"@
bindRoomManager_get_gameplay_monitor_enabled :: MethodBind
bindRoomManager_get_gameplay_monitor_enabled
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "get_gameplay_monitor_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When using a partial or full PVS, the gameplay monitor allows you to receive callbacks when roaming objects or rooms enter or exit the __gameplay area__. The gameplay area is defined as either the primary, or secondary PVS.
--   			These callbacks allow you to, for example, reduce processing for objects that are far from the player, or turn on and off AI.
--   			You can either choose to receive callbacks as notifications through the @_notification@ function, or as signals.
--   			@NOTIFICATION_ENTER_GAMEPLAY@
--   			@NOTIFICATION_EXIT_GAMEPLAY@
--   			Signals: @"gameplay_entered"@, @"gameplay_exited"@
get_gameplay_monitor_enabled ::
                               (RoomManager :< cls, Object :< cls) => cls -> IO Bool
get_gameplay_monitor_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_get_gameplay_monitor_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "get_gameplay_monitor_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RoomManager.get_gameplay_monitor_enabled

{-# NOINLINE bindRoomManager_get_merge_meshes #-}

-- | If enabled, the system will attempt to merge similar meshes (particularly in terms of materials) within @Room@s during conversion. This can significantly reduce the number of drawcalls and state changes required during rendering, albeit at a cost of reduced culling granularity.
--   			__Note:__ This operates at runtime during the conversion process, and will only operate on exported or running projects, in order to prevent accidental alteration to the scene and loss of data.
bindRoomManager_get_merge_meshes :: MethodBind
bindRoomManager_get_merge_meshes
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "get_merge_meshes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If enabled, the system will attempt to merge similar meshes (particularly in terms of materials) within @Room@s during conversion. This can significantly reduce the number of drawcalls and state changes required during rendering, albeit at a cost of reduced culling granularity.
--   			__Note:__ This operates at runtime during the conversion process, and will only operate on exported or running projects, in order to prevent accidental alteration to the scene and loss of data.
get_merge_meshes ::
                   (RoomManager :< cls, Object :< cls) => cls -> IO Bool
get_merge_meshes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_get_merge_meshes
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "get_merge_meshes" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.RoomManager.get_merge_meshes

{-# NOINLINE bindRoomManager_get_overlap_warning_threshold #-}

-- | When converting rooms, the editor will warn you if overlap is detected between rooms. Overlap can interfere with determining the room that cameras and objects are within. A small amount can be acceptable, depending on your level. Here you can alter the threshold at which the editor warning appears. There are no other side effects.
bindRoomManager_get_overlap_warning_threshold :: MethodBind
bindRoomManager_get_overlap_warning_threshold
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "get_overlap_warning_threshold" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When converting rooms, the editor will warn you if overlap is detected between rooms. Overlap can interfere with determining the room that cameras and objects are within. A small amount can be acceptable, depending on your level. Here you can alter the threshold at which the editor warning appears. There are no other side effects.
get_overlap_warning_threshold ::
                                (RoomManager :< cls, Object :< cls) => cls -> IO Int
get_overlap_warning_threshold cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRoomManager_get_overlap_warning_threshold
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "get_overlap_warning_threshold" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.RoomManager.get_overlap_warning_threshold

{-# NOINLINE bindRoomManager_get_portal_depth_limit #-}

-- | Portal rendering is recursive - each time a portal is seen through an earlier portal there is some cost. For this reason, and to prevent the possibility of infinite loops, this setting provides a hard limit on the recursion depth.
--   			__Note:__ This value is unused when using @Full@ PVS mode.
bindRoomManager_get_portal_depth_limit :: MethodBind
bindRoomManager_get_portal_depth_limit
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "get_portal_depth_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Portal rendering is recursive - each time a portal is seen through an earlier portal there is some cost. For this reason, and to prevent the possibility of infinite loops, this setting provides a hard limit on the recursion depth.
--   			__Note:__ This value is unused when using @Full@ PVS mode.
get_portal_depth_limit ::
                         (RoomManager :< cls, Object :< cls) => cls -> IO Int
get_portal_depth_limit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_get_portal_depth_limit
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "get_portal_depth_limit" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.RoomManager.get_portal_depth_limit

{-# NOINLINE bindRoomManager_get_preview_camera_path #-}

-- | Portal culling normally operates using the current @Camera@ / @Camera@s, however for debugging purposes within the editor, you can use this setting to override this behaviour and force it to use a particular camera to get a better idea of what the occlusion culling is doing.
bindRoomManager_get_preview_camera_path :: MethodBind
bindRoomManager_get_preview_camera_path
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "get_preview_camera_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Portal culling normally operates using the current @Camera@ / @Camera@s, however for debugging purposes within the editor, you can use this setting to override this behaviour and force it to use a particular camera to get a better idea of what the occlusion culling is doing.
get_preview_camera_path ::
                          (RoomManager :< cls, Object :< cls) => cls -> IO NodePath
get_preview_camera_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_get_preview_camera_path
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "get_preview_camera_path" '[]
           (IO NodePath)
         where
        nodeMethod = Godot.Core.RoomManager.get_preview_camera_path

{-# NOINLINE bindRoomManager_get_pvs_mode #-}

-- | Optionally during conversion the potentially visible set (PVS) of rooms that are potentially visible from each room can be calculated. This can be used either to aid in dynamic portal culling, or to totally replace portal culling.
--   			In @Full@ PVS Mode, all objects within the potentially visible rooms will be frustum culled, and rendered if they are within the view frustum.
bindRoomManager_get_pvs_mode :: MethodBind
bindRoomManager_get_pvs_mode
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "get_pvs_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Optionally during conversion the potentially visible set (PVS) of rooms that are potentially visible from each room can be calculated. This can be used either to aid in dynamic portal culling, or to totally replace portal culling.
--   			In @Full@ PVS Mode, all objects within the potentially visible rooms will be frustum culled, and rendered if they are within the view frustum.
get_pvs_mode ::
               (RoomManager :< cls, Object :< cls) => cls -> IO Int
get_pvs_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_get_pvs_mode (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "get_pvs_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.RoomManager.get_pvs_mode

{-# NOINLINE bindRoomManager_get_room_simplify #-}

-- | During the conversion process, the geometry of objects within @Room@s, or a custom specified manual bound, are used to generate a __convex hull bound__.
--   			This convex hull is __required__ in the visibility system, and is used for many purposes. Most importantly, it is used to decide whether the @Camera@ (or an object) is within a @Room@. The convex hull generating algorithm is good, but occasionally it can create too many (or too few) planes to give a good representation of the room volume.
--   			The @room_simplify@ value can be used to gain fine control over this process. It determines how similar planes can be for them to be considered the same (and duplicates removed). The value can be set between 0 (no simplification) and 1 (maximum simplification).
--   			The value set here is the default for all rooms, but individual rooms can override this value if desired.
--   			The room convex hulls are shown as a wireframe in the editor.
bindRoomManager_get_room_simplify :: MethodBind
bindRoomManager_get_room_simplify
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "get_room_simplify" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | During the conversion process, the geometry of objects within @Room@s, or a custom specified manual bound, are used to generate a __convex hull bound__.
--   			This convex hull is __required__ in the visibility system, and is used for many purposes. Most importantly, it is used to decide whether the @Camera@ (or an object) is within a @Room@. The convex hull generating algorithm is good, but occasionally it can create too many (or too few) planes to give a good representation of the room volume.
--   			The @room_simplify@ value can be used to gain fine control over this process. It determines how similar planes can be for them to be considered the same (and duplicates removed). The value can be set between 0 (no simplification) and 1 (maximum simplification).
--   			The value set here is the default for all rooms, but individual rooms can override this value if desired.
--   			The room convex hulls are shown as a wireframe in the editor.
get_room_simplify ::
                    (RoomManager :< cls, Object :< cls) => cls -> IO Float
get_room_simplify cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_get_room_simplify
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "get_room_simplify" '[] (IO Float)
         where
        nodeMethod = Godot.Core.RoomManager.get_room_simplify

{-# NOINLINE bindRoomManager_get_roomlist_path #-}

-- | For the @Room@ conversion process to succeed, you must point the @RoomManager@ to the parent @Node@ of your @Room@s and @RoomGroup@s, which we refer to as the @roomlist@ (the roomlist is not a special node type, it is normally just a @Spatial@).
bindRoomManager_get_roomlist_path :: MethodBind
bindRoomManager_get_roomlist_path
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "get_roomlist_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | For the @Room@ conversion process to succeed, you must point the @RoomManager@ to the parent @Node@ of your @Room@s and @RoomGroup@s, which we refer to as the @roomlist@ (the roomlist is not a special node type, it is normally just a @Spatial@).
get_roomlist_path ::
                    (RoomManager :< cls, Object :< cls) => cls -> IO NodePath
get_roomlist_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_get_roomlist_path
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "get_roomlist_path" '[]
           (IO NodePath)
         where
        nodeMethod = Godot.Core.RoomManager.get_roomlist_path

{-# NOINLINE bindRoomManager_get_show_margins #-}

-- | Shows the @Portal@ margins when the portal gizmo is used in the editor.
bindRoomManager_get_show_margins :: MethodBind
bindRoomManager_get_show_margins
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "get_show_margins" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shows the @Portal@ margins when the portal gizmo is used in the editor.
get_show_margins ::
                   (RoomManager :< cls, Object :< cls) => cls -> IO Bool
get_show_margins cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_get_show_margins
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "get_show_margins" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.RoomManager.get_show_margins

{-# NOINLINE bindRoomManager_get_use_secondary_pvs #-}

-- | When receiving gameplay callbacks when objects enter and exit gameplay, the __gameplay area__ can be defined by either the primary PVS (potentially visible set) of @Room@s, or the secondary PVS (the primary PVS and their neighbouring @Room@s).
--   			Sometimes using the larger gameplay area of the secondary PVS may be preferable.
bindRoomManager_get_use_secondary_pvs :: MethodBind
bindRoomManager_get_use_secondary_pvs
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "get_use_secondary_pvs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When receiving gameplay callbacks when objects enter and exit gameplay, the __gameplay area__ can be defined by either the primary PVS (potentially visible set) of @Room@s, or the secondary PVS (the primary PVS and their neighbouring @Room@s).
--   			Sometimes using the larger gameplay area of the secondary PVS may be preferable.
get_use_secondary_pvs ::
                        (RoomManager :< cls, Object :< cls) => cls -> IO Bool
get_use_secondary_pvs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_get_use_secondary_pvs
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "get_use_secondary_pvs" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RoomManager.get_use_secondary_pvs

{-# NOINLINE bindRoomManager_rooms_clear #-}

-- | This function clears all converted data from the __room graph__. Use this before unloading a level, when transitioning from level to level, or returning to a main menu.
bindRoomManager_rooms_clear :: MethodBind
bindRoomManager_rooms_clear
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "rooms_clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This function clears all converted data from the __room graph__. Use this before unloading a level, when transitioning from level to level, or returning to a main menu.
rooms_clear :: (RoomManager :< cls, Object :< cls) => cls -> IO ()
rooms_clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_rooms_clear (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "rooms_clear" '[] (IO ()) where
        nodeMethod = Godot.Core.RoomManager.rooms_clear

{-# NOINLINE bindRoomManager_rooms_convert #-}

-- | This is the most important function in the whole portal culling system. Without it, the system cannot function.
--   				First it goes through every @Room@ that is a child of the @room list@ node (and @RoomGroup@s within) and converts and adds it to the @room graph@.
--   				This works for both @Room@ nodes, and @Spatial@ nodes that follow a special naming convention. They should begin with the prefix @i@'Room_'@/i@, followed by the name you wish to give the room, e.g. @i@'Room_lounge'@/i@. This will automatically convert such @Spatial@s to @Room@ nodes for you. This is useful if you want to build you entire room system in e.g. Blender, and reimport multiple times as you work on the level.
--   				The conversion will try to assign @VisualInstance@s that are children and grandchildren of the @Room@ to the room. These should be given a suitable @portal mode@ (see the @CullInstance@ documentation). The default @portal mode@ is @STATIC@ - objects which are not expected to move while the level is played, which will typically be most objects.
--   				The conversion will usually use the geometry of these @VisualInstance@s (and the @Portal@s) to calculate a convex hull bound for the room. These bounds will be shown in the editor with a wireframe. Alternatively you can specify a manual custom bound for any room, see the @Room@ documentation.
--   				By definition, @Camera@s within a room can see everything else within the room (that is one advantage to using convex hulls). However, in order to see from one room into adjacent rooms, you must place @Portal@s, which represent openings that the camera can see through, like windows and doors.
--   				@Portal@s are really just specialized @MeshInstance@s. In fact you will usually first create a portal by creating a @MeshInstance@, especially a @plane@ mesh instance. You would move the plane in the editor to cover a window or doorway, with the front face pointing outward from the room. To let the conversion process know you want this mesh to be a portal, again we use a special naming convention. @MeshInstance@s to be converted to a @Portal@ should start with the prefix @i@'Portal_'@/i@.
--   				You now have a choice - you can leave the name as @i@'Portal_'@/i@ and allow the system to automatically detect the nearest @Room@ to link. In most cases this will work fine.
--   				An alternative method is to specify the @Room@ to link to manually, appending a suffix to the portal name, which should be the name of the room you intend to link to. For example @i@'Portal_lounge'@/i@ will attempt to link to the room named @i@'Room_lounge'@/i@.
--   				There is a special case here - Godot does not allow two nodes to share the same name. What if you want to manually have more than one portal leading into the same room? Surely they will need to both be called, e.g. @i@'Portal_lounge'@/i@?
--   				The solution is a wildcard character. After the room name, if you use the character @i@'*'@/i@, this character and anything following it will be ignored. So you can use for example @i@'Portal_lounge*0'@/i@, @i@'Portal_lounge*1'@/i@ etc.
--   				Note that @Portal@s that have already been converted to @Portal@ nodes (rather than @MeshInstance@s) still need to follow the same naming convention, as they will be relinked each time during conversion.
--   				It is recommended that you only place objects in rooms that are desired to stay within those rooms - i.e. @portal mode@s @STATIC@ or @DYNAMIC@ (not crossing portals). @GLOBAL@ and @ROAMING@ objects are best placed in another part of the scene tree, to avoid confusion. See @CullInstance@ for a full description of portal modes.
bindRoomManager_rooms_convert :: MethodBind
bindRoomManager_rooms_convert
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "rooms_convert" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This is the most important function in the whole portal culling system. Without it, the system cannot function.
--   				First it goes through every @Room@ that is a child of the @room list@ node (and @RoomGroup@s within) and converts and adds it to the @room graph@.
--   				This works for both @Room@ nodes, and @Spatial@ nodes that follow a special naming convention. They should begin with the prefix @i@'Room_'@/i@, followed by the name you wish to give the room, e.g. @i@'Room_lounge'@/i@. This will automatically convert such @Spatial@s to @Room@ nodes for you. This is useful if you want to build you entire room system in e.g. Blender, and reimport multiple times as you work on the level.
--   				The conversion will try to assign @VisualInstance@s that are children and grandchildren of the @Room@ to the room. These should be given a suitable @portal mode@ (see the @CullInstance@ documentation). The default @portal mode@ is @STATIC@ - objects which are not expected to move while the level is played, which will typically be most objects.
--   				The conversion will usually use the geometry of these @VisualInstance@s (and the @Portal@s) to calculate a convex hull bound for the room. These bounds will be shown in the editor with a wireframe. Alternatively you can specify a manual custom bound for any room, see the @Room@ documentation.
--   				By definition, @Camera@s within a room can see everything else within the room (that is one advantage to using convex hulls). However, in order to see from one room into adjacent rooms, you must place @Portal@s, which represent openings that the camera can see through, like windows and doors.
--   				@Portal@s are really just specialized @MeshInstance@s. In fact you will usually first create a portal by creating a @MeshInstance@, especially a @plane@ mesh instance. You would move the plane in the editor to cover a window or doorway, with the front face pointing outward from the room. To let the conversion process know you want this mesh to be a portal, again we use a special naming convention. @MeshInstance@s to be converted to a @Portal@ should start with the prefix @i@'Portal_'@/i@.
--   				You now have a choice - you can leave the name as @i@'Portal_'@/i@ and allow the system to automatically detect the nearest @Room@ to link. In most cases this will work fine.
--   				An alternative method is to specify the @Room@ to link to manually, appending a suffix to the portal name, which should be the name of the room you intend to link to. For example @i@'Portal_lounge'@/i@ will attempt to link to the room named @i@'Room_lounge'@/i@.
--   				There is a special case here - Godot does not allow two nodes to share the same name. What if you want to manually have more than one portal leading into the same room? Surely they will need to both be called, e.g. @i@'Portal_lounge'@/i@?
--   				The solution is a wildcard character. After the room name, if you use the character @i@'*'@/i@, this character and anything following it will be ignored. So you can use for example @i@'Portal_lounge*0'@/i@, @i@'Portal_lounge*1'@/i@ etc.
--   				Note that @Portal@s that have already been converted to @Portal@ nodes (rather than @MeshInstance@s) still need to follow the same naming convention, as they will be relinked each time during conversion.
--   				It is recommended that you only place objects in rooms that are desired to stay within those rooms - i.e. @portal mode@s @STATIC@ or @DYNAMIC@ (not crossing portals). @GLOBAL@ and @ROAMING@ objects are best placed in another part of the scene tree, to avoid confusion. See @CullInstance@ for a full description of portal modes.
rooms_convert ::
                (RoomManager :< cls, Object :< cls) => cls -> IO ()
rooms_convert cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_rooms_convert (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "rooms_convert" '[] (IO ()) where
        nodeMethod = Godot.Core.RoomManager.rooms_convert

{-# NOINLINE bindRoomManager_rooms_get_active #-}

-- | Switches the portal culling system on and off.
--   			It is important to note that when portal culling is active, it is responsible for __all__ the 3d culling. Some editor functionality may be more difficult to use, so switching the active flag is intended to be used to make sure your @Room@ / @Portal@ layout works within the editor.
--   			Switching to @active@ will have no effect when the @room graph@ is unloaded (the rooms have not yet been converted).
bindRoomManager_rooms_get_active :: MethodBind
bindRoomManager_rooms_get_active
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "rooms_get_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Switches the portal culling system on and off.
--   			It is important to note that when portal culling is active, it is responsible for __all__ the 3d culling. Some editor functionality may be more difficult to use, so switching the active flag is intended to be used to make sure your @Room@ / @Portal@ layout works within the editor.
--   			Switching to @active@ will have no effect when the @room graph@ is unloaded (the rooms have not yet been converted).
rooms_get_active ::
                   (RoomManager :< cls, Object :< cls) => cls -> IO Bool
rooms_get_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_rooms_get_active
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "rooms_get_active" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.RoomManager.rooms_get_active

{-# NOINLINE bindRoomManager_rooms_set_active #-}

-- | Switches the portal culling system on and off.
--   			It is important to note that when portal culling is active, it is responsible for __all__ the 3d culling. Some editor functionality may be more difficult to use, so switching the active flag is intended to be used to make sure your @Room@ / @Portal@ layout works within the editor.
--   			Switching to @active@ will have no effect when the @room graph@ is unloaded (the rooms have not yet been converted).
bindRoomManager_rooms_set_active :: MethodBind
bindRoomManager_rooms_set_active
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "rooms_set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Switches the portal culling system on and off.
--   			It is important to note that when portal culling is active, it is responsible for __all__ the 3d culling. Some editor functionality may be more difficult to use, so switching the active flag is intended to be used to make sure your @Room@ / @Portal@ layout works within the editor.
--   			Switching to @active@ will have no effect when the @room graph@ is unloaded (the rooms have not yet been converted).
rooms_set_active ::
                   (RoomManager :< cls, Object :< cls) => cls -> Bool -> IO ()
rooms_set_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_rooms_set_active
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "rooms_set_active" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.RoomManager.rooms_set_active

{-# NOINLINE bindRoomManager_set_debug_sprawl #-}

-- | Large objects can 'sprawl' over (be present in) more than one room. It can be useful to visualize which objects are sprawling outside the current room.
--   			Toggling this setting turns this debug view on and off.
bindRoomManager_set_debug_sprawl :: MethodBind
bindRoomManager_set_debug_sprawl
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "set_debug_sprawl" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Large objects can 'sprawl' over (be present in) more than one room. It can be useful to visualize which objects are sprawling outside the current room.
--   			Toggling this setting turns this debug view on and off.
set_debug_sprawl ::
                   (RoomManager :< cls, Object :< cls) => cls -> Bool -> IO ()
set_debug_sprawl cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_set_debug_sprawl
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "set_debug_sprawl" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.RoomManager.set_debug_sprawl

{-# NOINLINE bindRoomManager_set_default_portal_margin #-}

-- | Usually we don't want objects that only __just__ cross a boundary into an adjacent @Room@ to sprawl into that room. To prevent this, each @Portal@ has an extra margin, or tolerance zone where objects can enter without sprawling to a neighbouring room.
--   			In most cases you can set this here for all portals. It is possible to override the margin for each portal.
bindRoomManager_set_default_portal_margin :: MethodBind
bindRoomManager_set_default_portal_margin
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "set_default_portal_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Usually we don't want objects that only __just__ cross a boundary into an adjacent @Room@ to sprawl into that room. To prevent this, each @Portal@ has an extra margin, or tolerance zone where objects can enter without sprawling to a neighbouring room.
--   			In most cases you can set this here for all portals. It is possible to override the margin for each portal.
set_default_portal_margin ::
                            (RoomManager :< cls, Object :< cls) => cls -> Float -> IO ()
set_default_portal_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_set_default_portal_margin
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "set_default_portal_margin"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.RoomManager.set_default_portal_margin

{-# NOINLINE bindRoomManager_set_gameplay_monitor_enabled #-}

-- | When using a partial or full PVS, the gameplay monitor allows you to receive callbacks when roaming objects or rooms enter or exit the __gameplay area__. The gameplay area is defined as either the primary, or secondary PVS.
--   			These callbacks allow you to, for example, reduce processing for objects that are far from the player, or turn on and off AI.
--   			You can either choose to receive callbacks as notifications through the @_notification@ function, or as signals.
--   			@NOTIFICATION_ENTER_GAMEPLAY@
--   			@NOTIFICATION_EXIT_GAMEPLAY@
--   			Signals: @"gameplay_entered"@, @"gameplay_exited"@
bindRoomManager_set_gameplay_monitor_enabled :: MethodBind
bindRoomManager_set_gameplay_monitor_enabled
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "set_gameplay_monitor_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When using a partial or full PVS, the gameplay monitor allows you to receive callbacks when roaming objects or rooms enter or exit the __gameplay area__. The gameplay area is defined as either the primary, or secondary PVS.
--   			These callbacks allow you to, for example, reduce processing for objects that are far from the player, or turn on and off AI.
--   			You can either choose to receive callbacks as notifications through the @_notification@ function, or as signals.
--   			@NOTIFICATION_ENTER_GAMEPLAY@
--   			@NOTIFICATION_EXIT_GAMEPLAY@
--   			Signals: @"gameplay_entered"@, @"gameplay_exited"@
set_gameplay_monitor_enabled ::
                               (RoomManager :< cls, Object :< cls) => cls -> Bool -> IO ()
set_gameplay_monitor_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_set_gameplay_monitor_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "set_gameplay_monitor_enabled"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RoomManager.set_gameplay_monitor_enabled

{-# NOINLINE bindRoomManager_set_merge_meshes #-}

-- | If enabled, the system will attempt to merge similar meshes (particularly in terms of materials) within @Room@s during conversion. This can significantly reduce the number of drawcalls and state changes required during rendering, albeit at a cost of reduced culling granularity.
--   			__Note:__ This operates at runtime during the conversion process, and will only operate on exported or running projects, in order to prevent accidental alteration to the scene and loss of data.
bindRoomManager_set_merge_meshes :: MethodBind
bindRoomManager_set_merge_meshes
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "set_merge_meshes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If enabled, the system will attempt to merge similar meshes (particularly in terms of materials) within @Room@s during conversion. This can significantly reduce the number of drawcalls and state changes required during rendering, albeit at a cost of reduced culling granularity.
--   			__Note:__ This operates at runtime during the conversion process, and will only operate on exported or running projects, in order to prevent accidental alteration to the scene and loss of data.
set_merge_meshes ::
                   (RoomManager :< cls, Object :< cls) => cls -> Bool -> IO ()
set_merge_meshes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_set_merge_meshes
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "set_merge_meshes" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.RoomManager.set_merge_meshes

{-# NOINLINE bindRoomManager_set_overlap_warning_threshold #-}

-- | When converting rooms, the editor will warn you if overlap is detected between rooms. Overlap can interfere with determining the room that cameras and objects are within. A small amount can be acceptable, depending on your level. Here you can alter the threshold at which the editor warning appears. There are no other side effects.
bindRoomManager_set_overlap_warning_threshold :: MethodBind
bindRoomManager_set_overlap_warning_threshold
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "set_overlap_warning_threshold" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When converting rooms, the editor will warn you if overlap is detected between rooms. Overlap can interfere with determining the room that cameras and objects are within. A small amount can be acceptable, depending on your level. Here you can alter the threshold at which the editor warning appears. There are no other side effects.
set_overlap_warning_threshold ::
                                (RoomManager :< cls, Object :< cls) => cls -> Int -> IO ()
set_overlap_warning_threshold cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRoomManager_set_overlap_warning_threshold
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "set_overlap_warning_threshold"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.RoomManager.set_overlap_warning_threshold

{-# NOINLINE bindRoomManager_set_portal_depth_limit #-}

-- | Portal rendering is recursive - each time a portal is seen through an earlier portal there is some cost. For this reason, and to prevent the possibility of infinite loops, this setting provides a hard limit on the recursion depth.
--   			__Note:__ This value is unused when using @Full@ PVS mode.
bindRoomManager_set_portal_depth_limit :: MethodBind
bindRoomManager_set_portal_depth_limit
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "set_portal_depth_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Portal rendering is recursive - each time a portal is seen through an earlier portal there is some cost. For this reason, and to prevent the possibility of infinite loops, this setting provides a hard limit on the recursion depth.
--   			__Note:__ This value is unused when using @Full@ PVS mode.
set_portal_depth_limit ::
                         (RoomManager :< cls, Object :< cls) => cls -> Int -> IO ()
set_portal_depth_limit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_set_portal_depth_limit
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "set_portal_depth_limit" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.RoomManager.set_portal_depth_limit

{-# NOINLINE bindRoomManager_set_preview_camera_path #-}

-- | Portal culling normally operates using the current @Camera@ / @Camera@s, however for debugging purposes within the editor, you can use this setting to override this behaviour and force it to use a particular camera to get a better idea of what the occlusion culling is doing.
bindRoomManager_set_preview_camera_path :: MethodBind
bindRoomManager_set_preview_camera_path
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "set_preview_camera_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Portal culling normally operates using the current @Camera@ / @Camera@s, however for debugging purposes within the editor, you can use this setting to override this behaviour and force it to use a particular camera to get a better idea of what the occlusion culling is doing.
set_preview_camera_path ::
                          (RoomManager :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_preview_camera_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_set_preview_camera_path
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "set_preview_camera_path"
           '[NodePath]
           (IO ())
         where
        nodeMethod = Godot.Core.RoomManager.set_preview_camera_path

{-# NOINLINE bindRoomManager_set_pvs_mode #-}

-- | Optionally during conversion the potentially visible set (PVS) of rooms that are potentially visible from each room can be calculated. This can be used either to aid in dynamic portal culling, or to totally replace portal culling.
--   			In @Full@ PVS Mode, all objects within the potentially visible rooms will be frustum culled, and rendered if they are within the view frustum.
bindRoomManager_set_pvs_mode :: MethodBind
bindRoomManager_set_pvs_mode
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "set_pvs_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Optionally during conversion the potentially visible set (PVS) of rooms that are potentially visible from each room can be calculated. This can be used either to aid in dynamic portal culling, or to totally replace portal culling.
--   			In @Full@ PVS Mode, all objects within the potentially visible rooms will be frustum culled, and rendered if they are within the view frustum.
set_pvs_mode ::
               (RoomManager :< cls, Object :< cls) => cls -> Int -> IO ()
set_pvs_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_set_pvs_mode (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "set_pvs_mode" '[Int] (IO ()) where
        nodeMethod = Godot.Core.RoomManager.set_pvs_mode

{-# NOINLINE bindRoomManager_set_room_simplify #-}

-- | During the conversion process, the geometry of objects within @Room@s, or a custom specified manual bound, are used to generate a __convex hull bound__.
--   			This convex hull is __required__ in the visibility system, and is used for many purposes. Most importantly, it is used to decide whether the @Camera@ (or an object) is within a @Room@. The convex hull generating algorithm is good, but occasionally it can create too many (or too few) planes to give a good representation of the room volume.
--   			The @room_simplify@ value can be used to gain fine control over this process. It determines how similar planes can be for them to be considered the same (and duplicates removed). The value can be set between 0 (no simplification) and 1 (maximum simplification).
--   			The value set here is the default for all rooms, but individual rooms can override this value if desired.
--   			The room convex hulls are shown as a wireframe in the editor.
bindRoomManager_set_room_simplify :: MethodBind
bindRoomManager_set_room_simplify
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "set_room_simplify" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | During the conversion process, the geometry of objects within @Room@s, or a custom specified manual bound, are used to generate a __convex hull bound__.
--   			This convex hull is __required__ in the visibility system, and is used for many purposes. Most importantly, it is used to decide whether the @Camera@ (or an object) is within a @Room@. The convex hull generating algorithm is good, but occasionally it can create too many (or too few) planes to give a good representation of the room volume.
--   			The @room_simplify@ value can be used to gain fine control over this process. It determines how similar planes can be for them to be considered the same (and duplicates removed). The value can be set between 0 (no simplification) and 1 (maximum simplification).
--   			The value set here is the default for all rooms, but individual rooms can override this value if desired.
--   			The room convex hulls are shown as a wireframe in the editor.
set_room_simplify ::
                    (RoomManager :< cls, Object :< cls) => cls -> Float -> IO ()
set_room_simplify cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_set_room_simplify
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "set_room_simplify" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.RoomManager.set_room_simplify

{-# NOINLINE bindRoomManager_set_roomlist_path #-}

-- | For the @Room@ conversion process to succeed, you must point the @RoomManager@ to the parent @Node@ of your @Room@s and @RoomGroup@s, which we refer to as the @roomlist@ (the roomlist is not a special node type, it is normally just a @Spatial@).
bindRoomManager_set_roomlist_path :: MethodBind
bindRoomManager_set_roomlist_path
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "set_roomlist_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | For the @Room@ conversion process to succeed, you must point the @RoomManager@ to the parent @Node@ of your @Room@s and @RoomGroup@s, which we refer to as the @roomlist@ (the roomlist is not a special node type, it is normally just a @Spatial@).
set_roomlist_path ::
                    (RoomManager :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_roomlist_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_set_roomlist_path
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "set_roomlist_path" '[NodePath]
           (IO ())
         where
        nodeMethod = Godot.Core.RoomManager.set_roomlist_path

{-# NOINLINE bindRoomManager_set_show_margins #-}

-- | Shows the @Portal@ margins when the portal gizmo is used in the editor.
bindRoomManager_set_show_margins :: MethodBind
bindRoomManager_set_show_margins
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "set_show_margins" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shows the @Portal@ margins when the portal gizmo is used in the editor.
set_show_margins ::
                   (RoomManager :< cls, Object :< cls) => cls -> Bool -> IO ()
set_show_margins cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_set_show_margins
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "set_show_margins" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.RoomManager.set_show_margins

{-# NOINLINE bindRoomManager_set_use_secondary_pvs #-}

-- | When receiving gameplay callbacks when objects enter and exit gameplay, the __gameplay area__ can be defined by either the primary PVS (potentially visible set) of @Room@s, or the secondary PVS (the primary PVS and their neighbouring @Room@s).
--   			Sometimes using the larger gameplay area of the secondary PVS may be preferable.
bindRoomManager_set_use_secondary_pvs :: MethodBind
bindRoomManager_set_use_secondary_pvs
  = unsafePerformIO $
      withCString "RoomManager" $
        \ clsNamePtr ->
          withCString "set_use_secondary_pvs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When receiving gameplay callbacks when objects enter and exit gameplay, the __gameplay area__ can be defined by either the primary PVS (potentially visible set) of @Room@s, or the secondary PVS (the primary PVS and their neighbouring @Room@s).
--   			Sometimes using the larger gameplay area of the secondary PVS may be preferable.
set_use_secondary_pvs ::
                        (RoomManager :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_secondary_pvs cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomManager_set_use_secondary_pvs
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomManager "set_use_secondary_pvs" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RoomManager.set_use_secondary_pvs