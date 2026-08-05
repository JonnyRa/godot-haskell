{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Room
       (Godot.Core.Room.get_points, Godot.Core.Room.get_room_simplify,
        Godot.Core.Room.get_use_default_simplify,
        Godot.Core.Room.set_point, Godot.Core.Room.set_points,
        Godot.Core.Room.set_room_simplify,
        Godot.Core.Room.set_use_default_simplify)
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

instance NodeProperty Room "points" PoolVector3Array 'False where
        nodeProperty = (get_points, wrapDroppingSetter set_points, Nothing)

instance NodeProperty Room "room_simplify" Float 'False where
        nodeProperty
          = (get_room_simplify, wrapDroppingSetter set_room_simplify,
             Nothing)

instance NodeProperty Room "use_default_simplify" Bool 'False where
        nodeProperty
          = (get_use_default_simplify,
             wrapDroppingSetter set_use_default_simplify, Nothing)

{-# NOINLINE bindRoom_get_points #-}

-- | If @points@ are set, the @Room@ bounding convex hull will be built from these points. If no points are set, the room bound will either be derived from a manual bound (@MeshInstance@ with name prefix @Bound_@), or from the geometry within the room.
--   			Note that you can use the @Generate Points@ editor button to get started. This will use either the geometry or manual bound to generate the room hull, and save the resulting points, allowing you to edit them to further refine the bound.
bindRoom_get_points :: MethodBind
bindRoom_get_points
  = unsafePerformIO $
      withCString "Room" $
        \ clsNamePtr ->
          withCString "get_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @points@ are set, the @Room@ bounding convex hull will be built from these points. If no points are set, the room bound will either be derived from a manual bound (@MeshInstance@ with name prefix @Bound_@), or from the geometry within the room.
--   			Note that you can use the @Generate Points@ editor button to get started. This will use either the geometry or manual bound to generate the room hull, and save the resulting points, allowing you to edit them to further refine the bound.
get_points ::
             (Room :< cls, Object :< cls) => cls -> IO PoolVector3Array
get_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoom_get_points (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Room "get_points" '[] (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.Room.get_points

{-# NOINLINE bindRoom_get_room_simplify #-}

-- | The @simplify@ value determines to what degree room hulls (bounds) are simplified, by removing similar planes. A value of 0 gives no simplification, 1 gives maximum simplification.
bindRoom_get_room_simplify :: MethodBind
bindRoom_get_room_simplify
  = unsafePerformIO $
      withCString "Room" $
        \ clsNamePtr ->
          withCString "get_room_simplify" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @simplify@ value determines to what degree room hulls (bounds) are simplified, by removing similar planes. A value of 0 gives no simplification, 1 gives maximum simplification.
get_room_simplify ::
                    (Room :< cls, Object :< cls) => cls -> IO Float
get_room_simplify cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoom_get_room_simplify (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Room "get_room_simplify" '[] (IO Float) where
        nodeMethod = Godot.Core.Room.get_room_simplify

{-# NOINLINE bindRoom_get_use_default_simplify #-}

-- | The room hull simplification can either use the default value set in the @RoomManager@, or override this and use the per room setting.
bindRoom_get_use_default_simplify :: MethodBind
bindRoom_get_use_default_simplify
  = unsafePerformIO $
      withCString "Room" $
        \ clsNamePtr ->
          withCString "get_use_default_simplify" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The room hull simplification can either use the default value set in the @RoomManager@, or override this and use the per room setting.
get_use_default_simplify ::
                           (Room :< cls, Object :< cls) => cls -> IO Bool
get_use_default_simplify cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoom_get_use_default_simplify
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Room "get_use_default_simplify" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Room.get_use_default_simplify

{-# NOINLINE bindRoom_set_point #-}

-- | Sets individual points. Primarily for use by the editor.
bindRoom_set_point :: MethodBind
bindRoom_set_point
  = unsafePerformIO $
      withCString "Room" $
        \ clsNamePtr ->
          withCString "set_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets individual points. Primarily for use by the editor.
set_point ::
            (Room :< cls, Object :< cls) => cls -> Int -> Vector3 -> IO ()
set_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoom_set_point (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Room "set_point" '[Int, Vector3] (IO ()) where
        nodeMethod = Godot.Core.Room.set_point

{-# NOINLINE bindRoom_set_points #-}

-- | If @points@ are set, the @Room@ bounding convex hull will be built from these points. If no points are set, the room bound will either be derived from a manual bound (@MeshInstance@ with name prefix @Bound_@), or from the geometry within the room.
--   			Note that you can use the @Generate Points@ editor button to get started. This will use either the geometry or manual bound to generate the room hull, and save the resulting points, allowing you to edit them to further refine the bound.
bindRoom_set_points :: MethodBind
bindRoom_set_points
  = unsafePerformIO $
      withCString "Room" $
        \ clsNamePtr ->
          withCString "set_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @points@ are set, the @Room@ bounding convex hull will be built from these points. If no points are set, the room bound will either be derived from a manual bound (@MeshInstance@ with name prefix @Bound_@), or from the geometry within the room.
--   			Note that you can use the @Generate Points@ editor button to get started. This will use either the geometry or manual bound to generate the room hull, and save the resulting points, allowing you to edit them to further refine the bound.
set_points ::
             (Room :< cls, Object :< cls) => cls -> PoolVector3Array -> IO ()
set_points cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoom_set_points (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Room "set_points" '[PoolVector3Array] (IO ())
         where
        nodeMethod = Godot.Core.Room.set_points

{-# NOINLINE bindRoom_set_room_simplify #-}

-- | The @simplify@ value determines to what degree room hulls (bounds) are simplified, by removing similar planes. A value of 0 gives no simplification, 1 gives maximum simplification.
bindRoom_set_room_simplify :: MethodBind
bindRoom_set_room_simplify
  = unsafePerformIO $
      withCString "Room" $
        \ clsNamePtr ->
          withCString "set_room_simplify" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @simplify@ value determines to what degree room hulls (bounds) are simplified, by removing similar planes. A value of 0 gives no simplification, 1 gives maximum simplification.
set_room_simplify ::
                    (Room :< cls, Object :< cls) => cls -> Float -> IO ()
set_room_simplify cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoom_set_room_simplify (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Room "set_room_simplify" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Room.set_room_simplify

{-# NOINLINE bindRoom_set_use_default_simplify #-}

-- | The room hull simplification can either use the default value set in the @RoomManager@, or override this and use the per room setting.
bindRoom_set_use_default_simplify :: MethodBind
bindRoom_set_use_default_simplify
  = unsafePerformIO $
      withCString "Room" $
        \ clsNamePtr ->
          withCString "set_use_default_simplify" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The room hull simplification can either use the default value set in the @RoomManager@, or override this and use the per room setting.
set_use_default_simplify ::
                           (Room :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_default_simplify cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoom_set_use_default_simplify
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Room "set_use_default_simplify" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Room.set_use_default_simplify