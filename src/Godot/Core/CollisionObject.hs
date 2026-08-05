{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CollisionObject
       (Godot.Core.CollisionObject.sig_input_event,
        Godot.Core.CollisionObject.sig_mouse_entered,
        Godot.Core.CollisionObject.sig_mouse_exited,
        Godot.Core.CollisionObject._input_event,
        Godot.Core.CollisionObject._shape_changed,
        Godot.Core.CollisionObject._update_debug_shapes,
        Godot.Core.CollisionObject.create_shape_owner,
        Godot.Core.CollisionObject.get_capture_input_on_drag,
        Godot.Core.CollisionObject.get_collision_layer,
        Godot.Core.CollisionObject.get_collision_layer_bit,
        Godot.Core.CollisionObject.get_collision_mask,
        Godot.Core.CollisionObject.get_collision_mask_bit,
        Godot.Core.CollisionObject.get_rid,
        Godot.Core.CollisionObject.get_shape_owners,
        Godot.Core.CollisionObject.is_ray_pickable,
        Godot.Core.CollisionObject.is_shape_owner_disabled,
        Godot.Core.CollisionObject.remove_shape_owner,
        Godot.Core.CollisionObject.set_capture_input_on_drag,
        Godot.Core.CollisionObject.set_collision_layer,
        Godot.Core.CollisionObject.set_collision_layer_bit,
        Godot.Core.CollisionObject.set_collision_mask,
        Godot.Core.CollisionObject.set_collision_mask_bit,
        Godot.Core.CollisionObject.set_ray_pickable,
        Godot.Core.CollisionObject.shape_find_owner,
        Godot.Core.CollisionObject.shape_owner_add_shape,
        Godot.Core.CollisionObject.shape_owner_clear_shapes,
        Godot.Core.CollisionObject.shape_owner_get_owner,
        Godot.Core.CollisionObject.shape_owner_get_shape,
        Godot.Core.CollisionObject.shape_owner_get_shape_count,
        Godot.Core.CollisionObject.shape_owner_get_shape_index,
        Godot.Core.CollisionObject.shape_owner_get_transform,
        Godot.Core.CollisionObject.shape_owner_remove_shape,
        Godot.Core.CollisionObject.shape_owner_set_disabled,
        Godot.Core.CollisionObject.shape_owner_set_transform)
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

-- | Emitted when the object receives an unhandled @InputEvent@. @position@ is the location in world space of the mouse pointer on the surface of the shape with index @shape_idx@ and @normal@ is the normal vector of the surface at that point.
sig_input_event :: Godot.Internal.Dispatch.Signal CollisionObject
sig_input_event = Godot.Internal.Dispatch.Signal "input_event"

instance NodeSignal CollisionObject "input_event"
           '[Node, InputEvent, Vector3, Vector3, Int]

-- | Emitted when the mouse pointer enters any of this object's shapes.
sig_mouse_entered :: Godot.Internal.Dispatch.Signal CollisionObject
sig_mouse_entered = Godot.Internal.Dispatch.Signal "mouse_entered"

instance NodeSignal CollisionObject "mouse_entered" '[]

-- | Emitted when the mouse pointer exits all this object's shapes.
sig_mouse_exited :: Godot.Internal.Dispatch.Signal CollisionObject
sig_mouse_exited = Godot.Internal.Dispatch.Signal "mouse_exited"

instance NodeSignal CollisionObject "mouse_exited" '[]

instance NodeProperty CollisionObject "collision_layer" Int 'False
         where
        nodeProperty
          = (get_collision_layer, wrapDroppingSetter set_collision_layer,
             Nothing)

instance NodeProperty CollisionObject "collision_mask" Int 'False
         where
        nodeProperty
          = (get_collision_mask, wrapDroppingSetter set_collision_mask,
             Nothing)

instance NodeProperty CollisionObject "input_capture_on_drag" Bool
           'False
         where
        nodeProperty
          = (get_capture_input_on_drag,
             wrapDroppingSetter set_capture_input_on_drag, Nothing)

instance NodeProperty CollisionObject "input_ray_pickable" Bool
           'False
         where
        nodeProperty
          = (is_ray_pickable, wrapDroppingSetter set_ray_pickable, Nothing)

{-# NOINLINE bindCollisionObject__input_event #-}

-- | Receives unhandled @InputEvent@s. @position@ is the location in world space of the mouse pointer on the surface of the shape with index @shape_idx@ and @normal@ is the normal vector of the surface at that point. Connect to the @signal input_event@ signal to easily pick up these events.
bindCollisionObject__input_event :: MethodBind
bindCollisionObject__input_event
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "_input_event" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Receives unhandled @InputEvent@s. @position@ is the location in world space of the mouse pointer on the surface of the shape with index @shape_idx@ and @normal@ is the normal vector of the surface at that point. Connect to the @signal input_event@ signal to easily pick up these events.
_input_event ::
               (CollisionObject :< cls, Object :< cls) =>
               cls -> Object -> InputEvent -> Vector3 -> Vector3 -> Int -> IO ()
_input_event cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject__input_event
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "_input_event"
           '[Object, InputEvent, Vector3, Vector3, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject._input_event

{-# NOINLINE bindCollisionObject__shape_changed #-}

bindCollisionObject__shape_changed :: MethodBind
bindCollisionObject__shape_changed
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "_shape_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_shape_changed ::
                 (CollisionObject :< cls, Object :< cls) => cls -> Shape -> IO ()
_shape_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject__shape_changed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "_shape_changed" '[Shape]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject._shape_changed

{-# NOINLINE bindCollisionObject__update_debug_shapes #-}

bindCollisionObject__update_debug_shapes :: MethodBind
bindCollisionObject__update_debug_shapes
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "_update_debug_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_debug_shapes ::
                       (CollisionObject :< cls, Object :< cls) => cls -> IO ()
_update_debug_shapes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject__update_debug_shapes
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "_update_debug_shapes" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject._update_debug_shapes

{-# NOINLINE bindCollisionObject_create_shape_owner #-}

-- | Creates a new shape owner for the given object. Returns @owner_id@ of the new owner for future reference.
bindCollisionObject_create_shape_owner :: MethodBind
bindCollisionObject_create_shape_owner
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "create_shape_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new shape owner for the given object. Returns @owner_id@ of the new owner for future reference.
create_shape_owner ::
                     (CollisionObject :< cls, Object :< cls) => cls -> Object -> IO Int
create_shape_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_create_shape_owner
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "create_shape_owner" '[Object]
           (IO Int)
         where
        nodeMethod = Godot.Core.CollisionObject.create_shape_owner

{-# NOINLINE bindCollisionObject_get_capture_input_on_drag #-}

-- | If @true@, the @CollisionObject@ will continue to receive input events as the mouse is dragged across its shapes.
bindCollisionObject_get_capture_input_on_drag :: MethodBind
bindCollisionObject_get_capture_input_on_drag
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "get_capture_input_on_drag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @CollisionObject@ will continue to receive input events as the mouse is dragged across its shapes.
get_capture_input_on_drag ::
                            (CollisionObject :< cls, Object :< cls) => cls -> IO Bool
get_capture_input_on_drag cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_get_capture_input_on_drag
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "get_capture_input_on_drag" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.CollisionObject.get_capture_input_on_drag

{-# NOINLINE bindCollisionObject_get_collision_layer #-}

-- | The physics layers this CollisionObject3D is in. Collision objects can exist in one or more of 32 different layers. See also @collision_mask@.
--   			__Note:__ A contact is detected if object A is in any of the layers that object B scans, or object B is in any layers that object A scans. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindCollisionObject_get_collision_layer :: MethodBind
bindCollisionObject_get_collision_layer
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "get_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this CollisionObject3D is in. Collision objects can exist in one or more of 32 different layers. See also @collision_mask@.
--   			__Note:__ A contact is detected if object A is in any of the layers that object B scans, or object B is in any layers that object A scans. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
get_collision_layer ::
                      (CollisionObject :< cls, Object :< cls) => cls -> IO Int
get_collision_layer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_get_collision_layer
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "get_collision_layer" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.CollisionObject.get_collision_layer

{-# NOINLINE bindCollisionObject_get_collision_layer_bit #-}

-- | Returns whether or not the specified @bit@ of the @collision_layer@ is set.
bindCollisionObject_get_collision_layer_bit :: MethodBind
bindCollisionObject_get_collision_layer_bit
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "get_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether or not the specified @bit@ of the @collision_layer@ is set.
get_collision_layer_bit ::
                          (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_layer_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_get_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "get_collision_layer_bit"
           '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.CollisionObject.get_collision_layer_bit

{-# NOINLINE bindCollisionObject_get_collision_mask #-}

-- | The physics layers this CollisionObject3D scans. Collision objects can scan one or more of 32 different layers. See also @collision_layer@.
--   			__Note:__ A contact is detected if object A is in any of the layers that object B scans, or object B is in any layers that object A scans. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindCollisionObject_get_collision_mask :: MethodBind
bindCollisionObject_get_collision_mask
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this CollisionObject3D scans. Collision objects can scan one or more of 32 different layers. See also @collision_layer@.
--   			__Note:__ A contact is detected if object A is in any of the layers that object B scans, or object B is in any layers that object A scans. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
get_collision_mask ::
                     (CollisionObject :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_get_collision_mask
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "get_collision_mask" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.CollisionObject.get_collision_mask

{-# NOINLINE bindCollisionObject_get_collision_mask_bit #-}

-- | Returns whether or not the specified @bit@ of the @collision_mask@ is set.
bindCollisionObject_get_collision_mask_bit :: MethodBind
bindCollisionObject_get_collision_mask_bit
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "get_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether or not the specified @bit@ of the @collision_mask@ is set.
get_collision_mask_bit ::
                         (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_get_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "get_collision_mask_bit" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.CollisionObject.get_collision_mask_bit

{-# NOINLINE bindCollisionObject_get_rid #-}

-- | Returns the object's @RID@.
bindCollisionObject_get_rid :: MethodBind
bindCollisionObject_get_rid
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "get_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's @RID@.
get_rid :: (CollisionObject :< cls, Object :< cls) => cls -> IO Rid
get_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_get_rid (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "get_rid" '[] (IO Rid) where
        nodeMethod = Godot.Core.CollisionObject.get_rid

{-# NOINLINE bindCollisionObject_get_shape_owners #-}

-- | Returns an @Array@ of @owner_id@ identifiers. You can use these ids in other methods that take @owner_id@ as an argument.
bindCollisionObject_get_shape_owners :: MethodBind
bindCollisionObject_get_shape_owners
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "get_shape_owners" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an @Array@ of @owner_id@ identifiers. You can use these ids in other methods that take @owner_id@ as an argument.
get_shape_owners ::
                   (CollisionObject :< cls, Object :< cls) => cls -> IO Array
get_shape_owners cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_get_shape_owners
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "get_shape_owners" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.CollisionObject.get_shape_owners

{-# NOINLINE bindCollisionObject_is_ray_pickable #-}

-- | If @true@, this object is pickable. A pickable object can detect the mouse pointer entering/leaving, and if the mouse is inside it, report input events. Requires at least one @collision_layer@ bit to be set.
bindCollisionObject_is_ray_pickable :: MethodBind
bindCollisionObject_is_ray_pickable
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "is_ray_pickable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this object is pickable. A pickable object can detect the mouse pointer entering/leaving, and if the mouse is inside it, report input events. Requires at least one @collision_layer@ bit to be set.
is_ray_pickable ::
                  (CollisionObject :< cls, Object :< cls) => cls -> IO Bool
is_ray_pickable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_is_ray_pickable
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "is_ray_pickable" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.CollisionObject.is_ray_pickable

{-# NOINLINE bindCollisionObject_is_shape_owner_disabled #-}

-- | If @true@, the shape owner and its shapes are disabled.
bindCollisionObject_is_shape_owner_disabled :: MethodBind
bindCollisionObject_is_shape_owner_disabled
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "is_shape_owner_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the shape owner and its shapes are disabled.
is_shape_owner_disabled ::
                          (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO Bool
is_shape_owner_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_is_shape_owner_disabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "is_shape_owner_disabled"
           '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.CollisionObject.is_shape_owner_disabled

{-# NOINLINE bindCollisionObject_remove_shape_owner #-}

-- | Removes the given shape owner.
bindCollisionObject_remove_shape_owner :: MethodBind
bindCollisionObject_remove_shape_owner
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "remove_shape_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the given shape owner.
remove_shape_owner ::
                     (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO ()
remove_shape_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_remove_shape_owner
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "remove_shape_owner" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.remove_shape_owner

{-# NOINLINE bindCollisionObject_set_capture_input_on_drag #-}

-- | If @true@, the @CollisionObject@ will continue to receive input events as the mouse is dragged across its shapes.
bindCollisionObject_set_capture_input_on_drag :: MethodBind
bindCollisionObject_set_capture_input_on_drag
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "set_capture_input_on_drag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @CollisionObject@ will continue to receive input events as the mouse is dragged across its shapes.
set_capture_input_on_drag ::
                            (CollisionObject :< cls, Object :< cls) => cls -> Bool -> IO ()
set_capture_input_on_drag cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_set_capture_input_on_drag
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "set_capture_input_on_drag"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.set_capture_input_on_drag

{-# NOINLINE bindCollisionObject_set_collision_layer #-}

-- | The physics layers this CollisionObject3D is in. Collision objects can exist in one or more of 32 different layers. See also @collision_mask@.
--   			__Note:__ A contact is detected if object A is in any of the layers that object B scans, or object B is in any layers that object A scans. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindCollisionObject_set_collision_layer :: MethodBind
bindCollisionObject_set_collision_layer
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this CollisionObject3D is in. Collision objects can exist in one or more of 32 different layers. See also @collision_mask@.
--   			__Note:__ A contact is detected if object A is in any of the layers that object B scans, or object B is in any layers that object A scans. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
set_collision_layer ::
                      (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_set_collision_layer
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "set_collision_layer" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.set_collision_layer

{-# NOINLINE bindCollisionObject_set_collision_layer_bit #-}

-- | If @value@ is @true@, sets the specified @bit@ in the the @collision_layer@.
--   				If @value@ is @false@, clears the specified @bit@ in the the @collision_layer@.
bindCollisionObject_set_collision_layer_bit :: MethodBind
bindCollisionObject_set_collision_layer_bit
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "set_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @value@ is @true@, sets the specified @bit@ in the the @collision_layer@.
--   				If @value@ is @false@, clears the specified @bit@ in the the @collision_layer@.
set_collision_layer_bit ::
                          (CollisionObject :< cls, Object :< cls) =>
                          cls -> Int -> Bool -> IO ()
set_collision_layer_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_set_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "set_collision_layer_bit"
           '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.set_collision_layer_bit

{-# NOINLINE bindCollisionObject_set_collision_mask #-}

-- | The physics layers this CollisionObject3D scans. Collision objects can scan one or more of 32 different layers. See also @collision_layer@.
--   			__Note:__ A contact is detected if object A is in any of the layers that object B scans, or object B is in any layers that object A scans. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindCollisionObject_set_collision_mask :: MethodBind
bindCollisionObject_set_collision_mask
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this CollisionObject3D scans. Collision objects can scan one or more of 32 different layers. See also @collision_layer@.
--   			__Note:__ A contact is detected if object A is in any of the layers that object B scans, or object B is in any layers that object A scans. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
set_collision_mask ::
                     (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_set_collision_mask
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "set_collision_mask" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.set_collision_mask

{-# NOINLINE bindCollisionObject_set_collision_mask_bit #-}

-- | If @value@ is @true@, sets the specified @bit@ in the the @collision_mask@.
--   				If @value@ is @false@, clears the specified @bit@ in the the @collision_mask@.
bindCollisionObject_set_collision_mask_bit :: MethodBind
bindCollisionObject_set_collision_mask_bit
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "set_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @value@ is @true@, sets the specified @bit@ in the the @collision_mask@.
--   				If @value@ is @false@, clears the specified @bit@ in the the @collision_mask@.
set_collision_mask_bit ::
                         (CollisionObject :< cls, Object :< cls) =>
                         cls -> Int -> Bool -> IO ()
set_collision_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_set_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "set_collision_mask_bit"
           '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.set_collision_mask_bit

{-# NOINLINE bindCollisionObject_set_ray_pickable #-}

-- | If @true@, this object is pickable. A pickable object can detect the mouse pointer entering/leaving, and if the mouse is inside it, report input events. Requires at least one @collision_layer@ bit to be set.
bindCollisionObject_set_ray_pickable :: MethodBind
bindCollisionObject_set_ray_pickable
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "set_ray_pickable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this object is pickable. A pickable object can detect the mouse pointer entering/leaving, and if the mouse is inside it, report input events. Requires at least one @collision_layer@ bit to be set.
set_ray_pickable ::
                   (CollisionObject :< cls, Object :< cls) => cls -> Bool -> IO ()
set_ray_pickable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_set_ray_pickable
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "set_ray_pickable" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.set_ray_pickable

{-# NOINLINE bindCollisionObject_shape_find_owner #-}

-- | Returns the @owner_id@ of the given shape.
bindCollisionObject_shape_find_owner :: MethodBind
bindCollisionObject_shape_find_owner
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_find_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @owner_id@ of the given shape.
shape_find_owner ::
                   (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO Int
shape_find_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_find_owner
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "shape_find_owner" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.CollisionObject.shape_find_owner

{-# NOINLINE bindCollisionObject_shape_owner_add_shape #-}

-- | Adds a @Shape@ to the shape owner.
bindCollisionObject_shape_owner_add_shape :: MethodBind
bindCollisionObject_shape_owner_add_shape
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_add_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @Shape@ to the shape owner.
shape_owner_add_shape ::
                        (CollisionObject :< cls, Object :< cls) =>
                        cls -> Int -> Shape -> IO ()
shape_owner_add_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_add_shape
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "shape_owner_add_shape"
           '[Int, Shape]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_add_shape

{-# NOINLINE bindCollisionObject_shape_owner_clear_shapes #-}

-- | Removes all shapes from the shape owner.
bindCollisionObject_shape_owner_clear_shapes :: MethodBind
bindCollisionObject_shape_owner_clear_shapes
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_clear_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all shapes from the shape owner.
shape_owner_clear_shapes ::
                           (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO ()
shape_owner_clear_shapes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_clear_shapes
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "shape_owner_clear_shapes"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_clear_shapes

{-# NOINLINE bindCollisionObject_shape_owner_get_owner #-}

-- | Returns the parent object of the given shape owner.
bindCollisionObject_shape_owner_get_owner :: MethodBind
bindCollisionObject_shape_owner_get_owner
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_get_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the parent object of the given shape owner.
shape_owner_get_owner ::
                        (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO Object
shape_owner_get_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_get_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod CollisionObject "shape_owner_get_owner" '[Int]
           (IO Object)
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_get_owner

{-# NOINLINE bindCollisionObject_shape_owner_get_shape #-}

-- | Returns the @Shape@ with the given id from the given shape owner.
bindCollisionObject_shape_owner_get_shape :: MethodBind
bindCollisionObject_shape_owner_get_shape
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Shape@ with the given id from the given shape owner.
shape_owner_get_shape ::
                        (CollisionObject :< cls, Object :< cls) =>
                        cls -> Int -> Int -> IO Shape
shape_owner_get_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_get_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod CollisionObject "shape_owner_get_shape"
           '[Int, Int]
           (IO Shape)
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_get_shape

{-# NOINLINE bindCollisionObject_shape_owner_get_shape_count #-}

-- | Returns the number of shapes the given shape owner contains.
bindCollisionObject_shape_owner_get_shape_count :: MethodBind
bindCollisionObject_shape_owner_get_shape_count
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_get_shape_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of shapes the given shape owner contains.
shape_owner_get_shape_count ::
                              (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO Int
shape_owner_get_shape_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_shape_owner_get_shape_count
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "shape_owner_get_shape_count"
           '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_get_shape_count

{-# NOINLINE bindCollisionObject_shape_owner_get_shape_index #-}

-- | Returns the child index of the @Shape@ with the given id from the given shape owner.
bindCollisionObject_shape_owner_get_shape_index :: MethodBind
bindCollisionObject_shape_owner_get_shape_index
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_get_shape_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the child index of the @Shape@ with the given id from the given shape owner.
shape_owner_get_shape_index ::
                              (CollisionObject :< cls, Object :< cls) =>
                              cls -> Int -> Int -> IO Int
shape_owner_get_shape_index cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_shape_owner_get_shape_index
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "shape_owner_get_shape_index"
           '[Int, Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_get_shape_index

{-# NOINLINE bindCollisionObject_shape_owner_get_transform #-}

-- | Returns the shape owner's @Transform@.
bindCollisionObject_shape_owner_get_transform :: MethodBind
bindCollisionObject_shape_owner_get_transform
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the shape owner's @Transform@.
shape_owner_get_transform ::
                            (CollisionObject :< cls, Object :< cls) =>
                            cls -> Int -> IO Transform
shape_owner_get_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_shape_owner_get_transform
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "shape_owner_get_transform"
           '[Int]
           (IO Transform)
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_get_transform

{-# NOINLINE bindCollisionObject_shape_owner_remove_shape #-}

-- | Removes a shape from the given shape owner.
bindCollisionObject_shape_owner_remove_shape :: MethodBind
bindCollisionObject_shape_owner_remove_shape
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_remove_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a shape from the given shape owner.
shape_owner_remove_shape ::
                           (CollisionObject :< cls, Object :< cls) =>
                           cls -> Int -> Int -> IO ()
shape_owner_remove_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_remove_shape
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "shape_owner_remove_shape"
           '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_remove_shape

{-# NOINLINE bindCollisionObject_shape_owner_set_disabled #-}

-- | If @true@, disables the given shape owner.
bindCollisionObject_shape_owner_set_disabled :: MethodBind
bindCollisionObject_shape_owner_set_disabled
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_set_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, disables the given shape owner.
shape_owner_set_disabled ::
                           (CollisionObject :< cls, Object :< cls) =>
                           cls -> Int -> Bool -> IO ()
shape_owner_set_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_set_disabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "shape_owner_set_disabled"
           '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_set_disabled

{-# NOINLINE bindCollisionObject_shape_owner_set_transform #-}

-- | Sets the @Transform@ of the given shape owner.
bindCollisionObject_shape_owner_set_transform :: MethodBind
bindCollisionObject_shape_owner_set_transform
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Transform@ of the given shape owner.
shape_owner_set_transform ::
                            (CollisionObject :< cls, Object :< cls) =>
                            cls -> Int -> Transform -> IO ()
shape_owner_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_shape_owner_set_transform
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CollisionObject "shape_owner_set_transform"
           '[Int, Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_set_transform