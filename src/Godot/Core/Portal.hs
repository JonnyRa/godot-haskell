{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Portal
       (Godot.Core.Portal.get_linked_room, Godot.Core.Portal.get_points,
        Godot.Core.Portal.get_portal_active,
        Godot.Core.Portal.get_portal_margin,
        Godot.Core.Portal.get_use_default_margin,
        Godot.Core.Portal.is_two_way, Godot.Core.Portal.set_linked_room,
        Godot.Core.Portal.set_point, Godot.Core.Portal.set_points,
        Godot.Core.Portal.set_portal_active,
        Godot.Core.Portal.set_portal_margin, Godot.Core.Portal.set_two_way,
        Godot.Core.Portal.set_use_default_margin)
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

instance NodeProperty Portal "linked_room" NodePath 'False where
        nodeProperty
          = (get_linked_room, wrapDroppingSetter set_linked_room, Nothing)

instance NodeProperty Portal "points" PoolVector2Array 'False where
        nodeProperty = (get_points, wrapDroppingSetter set_points, Nothing)

instance NodeProperty Portal "portal_active" Bool 'False where
        nodeProperty
          = (get_portal_active, wrapDroppingSetter set_portal_active,
             Nothing)

instance NodeProperty Portal "portal_margin" Float 'False where
        nodeProperty
          = (get_portal_margin, wrapDroppingSetter set_portal_margin,
             Nothing)

instance NodeProperty Portal "two_way" Bool 'False where
        nodeProperty
          = (is_two_way, wrapDroppingSetter set_two_way, Nothing)

instance NodeProperty Portal "use_default_margin" Bool 'False where
        nodeProperty
          = (get_use_default_margin,
             wrapDroppingSetter set_use_default_margin, Nothing)

{-# NOINLINE bindPortal_get_linked_room #-}

-- | This is a shortcut for setting the linked @Room@ in the name of the @Portal@ (the name is used during conversion).
bindPortal_get_linked_room :: MethodBind
bindPortal_get_linked_room
  = unsafePerformIO $
      withCString "Portal" $
        \ clsNamePtr ->
          withCString "get_linked_room" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This is a shortcut for setting the linked @Room@ in the name of the @Portal@ (the name is used during conversion).
get_linked_room ::
                  (Portal :< cls, Object :< cls) => cls -> IO NodePath
get_linked_room cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPortal_get_linked_room (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Portal "get_linked_room" '[] (IO NodePath)
         where
        nodeMethod = Godot.Core.Portal.get_linked_room

{-# NOINLINE bindPortal_get_points #-}

-- | The points defining the shape of the @Portal@ polygon (which should be convex).
--   			These are defined in 2D, with @0,0@ being the origin of the @Portal@ node's @Spatial.global_transform@.
--   			__Note:__ These raw points are sanitized for winding order internally.
bindPortal_get_points :: MethodBind
bindPortal_get_points
  = unsafePerformIO $
      withCString "Portal" $
        \ clsNamePtr ->
          withCString "get_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The points defining the shape of the @Portal@ polygon (which should be convex).
--   			These are defined in 2D, with @0,0@ being the origin of the @Portal@ node's @Spatial.global_transform@.
--   			__Note:__ These raw points are sanitized for winding order internally.
get_points ::
             (Portal :< cls, Object :< cls) => cls -> IO PoolVector2Array
get_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPortal_get_points (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Portal "get_points" '[] (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.Portal.get_points

{-# NOINLINE bindPortal_get_portal_active #-}

-- | Visibility through @Portal@s can be turned on and off at runtime - this is useful for having closable doors.
bindPortal_get_portal_active :: MethodBind
bindPortal_get_portal_active
  = unsafePerformIO $
      withCString "Portal" $
        \ clsNamePtr ->
          withCString "get_portal_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Visibility through @Portal@s can be turned on and off at runtime - this is useful for having closable doors.
get_portal_active ::
                    (Portal :< cls, Object :< cls) => cls -> IO Bool
get_portal_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPortal_get_portal_active (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Portal "get_portal_active" '[] (IO Bool) where
        nodeMethod = Godot.Core.Portal.get_portal_active

{-# NOINLINE bindPortal_get_portal_margin #-}

-- | Some objects are so big that they may be present in more than one @Room@ ('sprawling'). As we often don't want objects that *just* breach the edges to be assigned to neighbouring rooms, you can assign an extra margin through the @Portal@ to allow objects to breach without sprawling.
bindPortal_get_portal_margin :: MethodBind
bindPortal_get_portal_margin
  = unsafePerformIO $
      withCString "Portal" $
        \ clsNamePtr ->
          withCString "get_portal_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Some objects are so big that they may be present in more than one @Room@ ('sprawling'). As we often don't want objects that *just* breach the edges to be assigned to neighbouring rooms, you can assign an extra margin through the @Portal@ to allow objects to breach without sprawling.
get_portal_margin ::
                    (Portal :< cls, Object :< cls) => cls -> IO Float
get_portal_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPortal_get_portal_margin (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Portal "get_portal_margin" '[] (IO Float) where
        nodeMethod = Godot.Core.Portal.get_portal_margin

{-# NOINLINE bindPortal_get_use_default_margin #-}

-- | In most cases you will want to use the default @Portal@ margin in your portals (this is set in the @RoomManager@).
--   			If you want to override this default, set this value to @false@, and the local @portal_margin@ will take effect.
bindPortal_get_use_default_margin :: MethodBind
bindPortal_get_use_default_margin
  = unsafePerformIO $
      withCString "Portal" $
        \ clsNamePtr ->
          withCString "get_use_default_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | In most cases you will want to use the default @Portal@ margin in your portals (this is set in the @RoomManager@).
--   			If you want to override this default, set this value to @false@, and the local @portal_margin@ will take effect.
get_use_default_margin ::
                         (Portal :< cls, Object :< cls) => cls -> IO Bool
get_use_default_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPortal_get_use_default_margin
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Portal "get_use_default_margin" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Portal.get_use_default_margin

{-# NOINLINE bindPortal_is_two_way #-}

-- | Portals default to being two way - see through in both directions, however you can make them one way, visible from the source room only.
bindPortal_is_two_way :: MethodBind
bindPortal_is_two_way
  = unsafePerformIO $
      withCString "Portal" $
        \ clsNamePtr ->
          withCString "is_two_way" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Portals default to being two way - see through in both directions, however you can make them one way, visible from the source room only.
is_two_way :: (Portal :< cls, Object :< cls) => cls -> IO Bool
is_two_way cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPortal_is_two_way (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Portal "is_two_way" '[] (IO Bool) where
        nodeMethod = Godot.Core.Portal.is_two_way

{-# NOINLINE bindPortal_set_linked_room #-}

-- | This is a shortcut for setting the linked @Room@ in the name of the @Portal@ (the name is used during conversion).
bindPortal_set_linked_room :: MethodBind
bindPortal_set_linked_room
  = unsafePerformIO $
      withCString "Portal" $
        \ clsNamePtr ->
          withCString "set_linked_room" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This is a shortcut for setting the linked @Room@ in the name of the @Portal@ (the name is used during conversion).
set_linked_room ::
                  (Portal :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_linked_room cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPortal_set_linked_room (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Portal "set_linked_room" '[NodePath] (IO ())
         where
        nodeMethod = Godot.Core.Portal.set_linked_room

{-# NOINLINE bindPortal_set_point #-}

-- | Sets individual points. Primarily for use by the editor.
bindPortal_set_point :: MethodBind
bindPortal_set_point
  = unsafePerformIO $
      withCString "Portal" $
        \ clsNamePtr ->
          withCString "set_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets individual points. Primarily for use by the editor.
set_point ::
            (Portal :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO ()
set_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPortal_set_point (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Portal "set_point" '[Int, Vector2] (IO ())
         where
        nodeMethod = Godot.Core.Portal.set_point

{-# NOINLINE bindPortal_set_points #-}

-- | The points defining the shape of the @Portal@ polygon (which should be convex).
--   			These are defined in 2D, with @0,0@ being the origin of the @Portal@ node's @Spatial.global_transform@.
--   			__Note:__ These raw points are sanitized for winding order internally.
bindPortal_set_points :: MethodBind
bindPortal_set_points
  = unsafePerformIO $
      withCString "Portal" $
        \ clsNamePtr ->
          withCString "set_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The points defining the shape of the @Portal@ polygon (which should be convex).
--   			These are defined in 2D, with @0,0@ being the origin of the @Portal@ node's @Spatial.global_transform@.
--   			__Note:__ These raw points are sanitized for winding order internally.
set_points ::
             (Portal :< cls, Object :< cls) => cls -> PoolVector2Array -> IO ()
set_points cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPortal_set_points (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Portal "set_points" '[PoolVector2Array] (IO ())
         where
        nodeMethod = Godot.Core.Portal.set_points

{-# NOINLINE bindPortal_set_portal_active #-}

-- | Visibility through @Portal@s can be turned on and off at runtime - this is useful for having closable doors.
bindPortal_set_portal_active :: MethodBind
bindPortal_set_portal_active
  = unsafePerformIO $
      withCString "Portal" $
        \ clsNamePtr ->
          withCString "set_portal_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Visibility through @Portal@s can be turned on and off at runtime - this is useful for having closable doors.
set_portal_active ::
                    (Portal :< cls, Object :< cls) => cls -> Bool -> IO ()
set_portal_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPortal_set_portal_active (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Portal "set_portal_active" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Portal.set_portal_active

{-# NOINLINE bindPortal_set_portal_margin #-}

-- | Some objects are so big that they may be present in more than one @Room@ ('sprawling'). As we often don't want objects that *just* breach the edges to be assigned to neighbouring rooms, you can assign an extra margin through the @Portal@ to allow objects to breach without sprawling.
bindPortal_set_portal_margin :: MethodBind
bindPortal_set_portal_margin
  = unsafePerformIO $
      withCString "Portal" $
        \ clsNamePtr ->
          withCString "set_portal_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Some objects are so big that they may be present in more than one @Room@ ('sprawling'). As we often don't want objects that *just* breach the edges to be assigned to neighbouring rooms, you can assign an extra margin through the @Portal@ to allow objects to breach without sprawling.
set_portal_margin ::
                    (Portal :< cls, Object :< cls) => cls -> Float -> IO ()
set_portal_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPortal_set_portal_margin (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Portal "set_portal_margin" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Portal.set_portal_margin

{-# NOINLINE bindPortal_set_two_way #-}

-- | Portals default to being two way - see through in both directions, however you can make them one way, visible from the source room only.
bindPortal_set_two_way :: MethodBind
bindPortal_set_two_way
  = unsafePerformIO $
      withCString "Portal" $
        \ clsNamePtr ->
          withCString "set_two_way" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Portals default to being two way - see through in both directions, however you can make them one way, visible from the source room only.
set_two_way ::
              (Portal :< cls, Object :< cls) => cls -> Bool -> IO ()
set_two_way cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPortal_set_two_way (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Portal "set_two_way" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Portal.set_two_way

{-# NOINLINE bindPortal_set_use_default_margin #-}

-- | In most cases you will want to use the default @Portal@ margin in your portals (this is set in the @RoomManager@).
--   			If you want to override this default, set this value to @false@, and the local @portal_margin@ will take effect.
bindPortal_set_use_default_margin :: MethodBind
bindPortal_set_use_default_margin
  = unsafePerformIO $
      withCString "Portal" $
        \ clsNamePtr ->
          withCString "set_use_default_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | In most cases you will want to use the default @Portal@ margin in your portals (this is set in the @RoomManager@).
--   			If you want to override this default, set this value to @false@, and the local @portal_margin@ will take effect.
set_use_default_margin ::
                         (Portal :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_default_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPortal_set_use_default_margin
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Portal "set_use_default_margin" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Portal.set_use_default_margin