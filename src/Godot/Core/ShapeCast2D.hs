{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ShapeCast2D
       (Godot.Core.ShapeCast2D._get_collision_result,
        Godot.Core.ShapeCast2D._redraw_shape,
        Godot.Core.ShapeCast2D.add_exception,
        Godot.Core.ShapeCast2D.add_exception_rid,
        Godot.Core.ShapeCast2D.clear_exceptions,
        Godot.Core.ShapeCast2D.force_shapecast_update,
        Godot.Core.ShapeCast2D.get_closest_collision_safe_fraction,
        Godot.Core.ShapeCast2D.get_closest_collision_unsafe_fraction,
        Godot.Core.ShapeCast2D.get_collider,
        Godot.Core.ShapeCast2D.get_collider_rid,
        Godot.Core.ShapeCast2D.get_collider_shape,
        Godot.Core.ShapeCast2D.get_collision_count,
        Godot.Core.ShapeCast2D.get_collision_mask,
        Godot.Core.ShapeCast2D.get_collision_mask_value,
        Godot.Core.ShapeCast2D.get_collision_normal,
        Godot.Core.ShapeCast2D.get_collision_point,
        Godot.Core.ShapeCast2D.get_exclude_parent_body,
        Godot.Core.ShapeCast2D.get_margin,
        Godot.Core.ShapeCast2D.get_max_results,
        Godot.Core.ShapeCast2D.get_shape,
        Godot.Core.ShapeCast2D.get_target_position,
        Godot.Core.ShapeCast2D.is_collide_with_areas_enabled,
        Godot.Core.ShapeCast2D.is_collide_with_bodies_enabled,
        Godot.Core.ShapeCast2D.is_colliding,
        Godot.Core.ShapeCast2D.is_enabled,
        Godot.Core.ShapeCast2D.remove_exception,
        Godot.Core.ShapeCast2D.remove_exception_rid,
        Godot.Core.ShapeCast2D.set_collide_with_areas,
        Godot.Core.ShapeCast2D.set_collide_with_bodies,
        Godot.Core.ShapeCast2D.set_collision_mask,
        Godot.Core.ShapeCast2D.set_collision_mask_value,
        Godot.Core.ShapeCast2D.set_enabled,
        Godot.Core.ShapeCast2D.set_exclude_parent_body,
        Godot.Core.ShapeCast2D.set_margin,
        Godot.Core.ShapeCast2D.set_max_results,
        Godot.Core.ShapeCast2D.set_shape,
        Godot.Core.ShapeCast2D.set_target_position)
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

instance NodeProperty ShapeCast2D "collide_with_areas" Bool 'False
         where
        nodeProperty
          = (is_collide_with_areas_enabled,
             wrapDroppingSetter set_collide_with_areas, Nothing)

instance NodeProperty ShapeCast2D "collide_with_bodies" Bool 'False
         where
        nodeProperty
          = (is_collide_with_bodies_enabled,
             wrapDroppingSetter set_collide_with_bodies, Nothing)

instance NodeProperty ShapeCast2D "collision_mask" Int 'False where
        nodeProperty
          = (get_collision_mask, wrapDroppingSetter set_collision_mask,
             Nothing)

instance NodeProperty ShapeCast2D "collision_result" Array 'True
         where
        nodeProperty = (_get_collision_result, (), Nothing)

instance NodeProperty ShapeCast2D "enabled" Bool 'False where
        nodeProperty
          = (is_enabled, wrapDroppingSetter set_enabled, Nothing)

instance NodeProperty ShapeCast2D "exclude_parent" Bool 'False
         where
        nodeProperty
          = (get_exclude_parent_body,
             wrapDroppingSetter set_exclude_parent_body, Nothing)

instance NodeProperty ShapeCast2D "margin" Float 'False where
        nodeProperty = (get_margin, wrapDroppingSetter set_margin, Nothing)

instance NodeProperty ShapeCast2D "max_results" Int 'False where
        nodeProperty
          = (get_max_results, wrapDroppingSetter set_max_results, Nothing)

instance NodeProperty ShapeCast2D "shape" Shape2D 'False where
        nodeProperty = (get_shape, wrapDroppingSetter set_shape, Nothing)

instance NodeProperty ShapeCast2D "target_position" Vector2 'False
         where
        nodeProperty
          = (get_target_position, wrapDroppingSetter set_target_position,
             Nothing)

{-# NOINLINE bindShapeCast2D__get_collision_result #-}

-- | Returns the complete collision information from the collision sweep. The data returned is the same as in the @method Physics2DDirectSpaceState.get_rest_info@ method.
bindShapeCast2D__get_collision_result :: MethodBind
bindShapeCast2D__get_collision_result
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "_get_collision_result" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the complete collision information from the collision sweep. The data returned is the same as in the @method Physics2DDirectSpaceState.get_rest_info@ method.
_get_collision_result ::
                        (ShapeCast2D :< cls, Object :< cls) => cls -> IO Array
_get_collision_result cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D__get_collision_result
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "_get_collision_result" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.ShapeCast2D._get_collision_result

{-# NOINLINE bindShapeCast2D__redraw_shape #-}

bindShapeCast2D__redraw_shape :: MethodBind
bindShapeCast2D__redraw_shape
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "_redraw_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_redraw_shape ::
                (ShapeCast2D :< cls, Object :< cls) => cls -> IO ()
_redraw_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D__redraw_shape (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "_redraw_shape" '[] (IO ()) where
        nodeMethod = Godot.Core.ShapeCast2D._redraw_shape

{-# NOINLINE bindShapeCast2D_add_exception #-}

-- | Adds a collision exception so the shape does not report collisions with the specified @CollisionObject2D@ node.
bindShapeCast2D_add_exception :: MethodBind
bindShapeCast2D_add_exception
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "add_exception" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a collision exception so the shape does not report collisions with the specified @CollisionObject2D@ node.
add_exception ::
                (ShapeCast2D :< cls, Object :< cls) => cls -> Object -> IO ()
add_exception cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_add_exception (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "add_exception" '[Object] (IO ())
         where
        nodeMethod = Godot.Core.ShapeCast2D.add_exception

{-# NOINLINE bindShapeCast2D_add_exception_rid #-}

-- | Adds a collision exception so the shape does not report collisions with the specified @RID@.
bindShapeCast2D_add_exception_rid :: MethodBind
bindShapeCast2D_add_exception_rid
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "add_exception_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a collision exception so the shape does not report collisions with the specified @RID@.
add_exception_rid ::
                    (ShapeCast2D :< cls, Object :< cls) => cls -> Rid -> IO ()
add_exception_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_add_exception_rid
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "add_exception_rid" '[Rid] (IO ())
         where
        nodeMethod = Godot.Core.ShapeCast2D.add_exception_rid

{-# NOINLINE bindShapeCast2D_clear_exceptions #-}

-- | Removes all collision exceptions for this shape.
bindShapeCast2D_clear_exceptions :: MethodBind
bindShapeCast2D_clear_exceptions
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "clear_exceptions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all collision exceptions for this shape.
clear_exceptions ::
                   (ShapeCast2D :< cls, Object :< cls) => cls -> IO ()
clear_exceptions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_clear_exceptions
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "clear_exceptions" '[] (IO ())
         where
        nodeMethod = Godot.Core.ShapeCast2D.clear_exceptions

{-# NOINLINE bindShapeCast2D_force_shapecast_update #-}

-- | Updates the collision information for the shape. Use this method to update the collision information immediately instead of waiting for the next @_physics_process@ call, for example if the shape or its parent has changed state.
--   				__Note:__ @enabled@ is not required for this to work.
bindShapeCast2D_force_shapecast_update :: MethodBind
bindShapeCast2D_force_shapecast_update
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "force_shapecast_update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Updates the collision information for the shape. Use this method to update the collision information immediately instead of waiting for the next @_physics_process@ call, for example if the shape or its parent has changed state.
--   				__Note:__ @enabled@ is not required for this to work.
force_shapecast_update ::
                         (ShapeCast2D :< cls, Object :< cls) => cls -> IO ()
force_shapecast_update cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_force_shapecast_update
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "force_shapecast_update" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.ShapeCast2D.force_shapecast_update

{-# NOINLINE bindShapeCast2D_get_closest_collision_safe_fraction
             #-}

-- | The fraction from the @ShapeCast2D@'s origin to its @target_position@ (between 0 and 1) of how far the shape can move without triggering a collision.
bindShapeCast2D_get_closest_collision_safe_fraction :: MethodBind
bindShapeCast2D_get_closest_collision_safe_fraction
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "get_closest_collision_safe_fraction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fraction from the @ShapeCast2D@'s origin to its @target_position@ (between 0 and 1) of how far the shape can move without triggering a collision.
get_closest_collision_safe_fraction ::
                                      (ShapeCast2D :< cls, Object :< cls) => cls -> IO Float
get_closest_collision_safe_fraction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindShapeCast2D_get_closest_collision_safe_fraction
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D
           "get_closest_collision_safe_fraction"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.ShapeCast2D.get_closest_collision_safe_fraction

{-# NOINLINE bindShapeCast2D_get_closest_collision_unsafe_fraction
             #-}

-- | The fraction from the @ShapeCast2D@'s origin to its @target_position@ (between 0 and 1) of how far the shape must move to trigger a collision.
bindShapeCast2D_get_closest_collision_unsafe_fraction :: MethodBind
bindShapeCast2D_get_closest_collision_unsafe_fraction
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "get_closest_collision_unsafe_fraction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fraction from the @ShapeCast2D@'s origin to its @target_position@ (between 0 and 1) of how far the shape must move to trigger a collision.
get_closest_collision_unsafe_fraction ::
                                        (ShapeCast2D :< cls, Object :< cls) => cls -> IO Float
get_closest_collision_unsafe_fraction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindShapeCast2D_get_closest_collision_unsafe_fraction
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D
           "get_closest_collision_unsafe_fraction"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.ShapeCast2D.get_closest_collision_unsafe_fraction

{-# NOINLINE bindShapeCast2D_get_collider #-}

-- | Returns the collided @Object@ of one of the multiple collisions at @index@, or @null@ if no object is intersecting the shape (i.e. @method is_colliding@ returns @false@).
bindShapeCast2D_get_collider :: MethodBind
bindShapeCast2D_get_collider
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "get_collider" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the collided @Object@ of one of the multiple collisions at @index@, or @null@ if no object is intersecting the shape (i.e. @method is_colliding@ returns @false@).
get_collider ::
               (ShapeCast2D :< cls, Object :< cls) => cls -> Int -> IO Object
get_collider cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_get_collider (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod ShapeCast2D "get_collider" '[Int] (IO Object)
         where
        nodeMethod = Godot.Core.ShapeCast2D.get_collider

{-# NOINLINE bindShapeCast2D_get_collider_rid #-}

-- | Returns the @RID@ of the collided object of one of the multiple collisions at @index@.
bindShapeCast2D_get_collider_rid :: MethodBind
bindShapeCast2D_get_collider_rid
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "get_collider_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of the collided object of one of the multiple collisions at @index@.
get_collider_rid ::
                   (ShapeCast2D :< cls, Object :< cls) => cls -> Int -> IO Rid
get_collider_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_get_collider_rid
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "get_collider_rid" '[Int] (IO Rid)
         where
        nodeMethod = Godot.Core.ShapeCast2D.get_collider_rid

{-# NOINLINE bindShapeCast2D_get_collider_shape #-}

-- | Returns the shape ID of the colliding shape of one of the multiple collisions at @index@, or @0@ if no object is intersecting the shape (i.e. @method is_colliding@ returns @false@).
bindShapeCast2D_get_collider_shape :: MethodBind
bindShapeCast2D_get_collider_shape
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "get_collider_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the shape ID of the colliding shape of one of the multiple collisions at @index@, or @0@ if no object is intersecting the shape (i.e. @method is_colliding@ returns @false@).
get_collider_shape ::
                     (ShapeCast2D :< cls, Object :< cls) => cls -> Int -> IO Int
get_collider_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_get_collider_shape
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "get_collider_shape" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.ShapeCast2D.get_collider_shape

{-# NOINLINE bindShapeCast2D_get_collision_count #-}

-- | The number of collisions detected at the point of impact. Use this to iterate over multiple collisions as provided by @method get_collider@, @method get_collider_shape@, @method get_collision_point@, and @method get_collision_normal@ methods.
bindShapeCast2D_get_collision_count :: MethodBind
bindShapeCast2D_get_collision_count
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "get_collision_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of collisions detected at the point of impact. Use this to iterate over multiple collisions as provided by @method get_collider@, @method get_collider_shape@, @method get_collision_point@, and @method get_collision_normal@ methods.
get_collision_count ::
                      (ShapeCast2D :< cls, Object :< cls) => cls -> IO Int
get_collision_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_get_collision_count
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "get_collision_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ShapeCast2D.get_collision_count

{-# NOINLINE bindShapeCast2D_get_collision_mask #-}

-- | The shape's collision mask. Only objects in at least one collision layer enabled in the mask will be detected.
bindShapeCast2D_get_collision_mask :: MethodBind
bindShapeCast2D_get_collision_mask
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shape's collision mask. Only objects in at least one collision layer enabled in the mask will be detected.
get_collision_mask ::
                     (ShapeCast2D :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_get_collision_mask
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "get_collision_mask" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ShapeCast2D.get_collision_mask

{-# NOINLINE bindShapeCast2D_get_collision_mask_value #-}

-- | Returns whether or not the specified layer of the @collision_mask@ is enabled, given a @layer_number@ between 1 and 32.
bindShapeCast2D_get_collision_mask_value :: MethodBind
bindShapeCast2D_get_collision_mask_value
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "get_collision_mask_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether or not the specified layer of the @collision_mask@ is enabled, given a @layer_number@ between 1 and 32.
get_collision_mask_value ::
                           (ShapeCast2D :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_mask_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_get_collision_mask_value
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "get_collision_mask_value" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ShapeCast2D.get_collision_mask_value

{-# NOINLINE bindShapeCast2D_get_collision_normal #-}

-- | Returns the normal of one of the multiple collisions at @index@ of the intersecting object.
bindShapeCast2D_get_collision_normal :: MethodBind
bindShapeCast2D_get_collision_normal
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "get_collision_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the normal of one of the multiple collisions at @index@ of the intersecting object.
get_collision_normal ::
                       (ShapeCast2D :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_collision_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_get_collision_normal
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "get_collision_normal" '[Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.ShapeCast2D.get_collision_normal

{-# NOINLINE bindShapeCast2D_get_collision_point #-}

-- | Returns the collision point of one of the multiple collisions at @index@ where the shape intersects the colliding object.
--   				__Note:__ this point is in the __global__ coordinate system.
bindShapeCast2D_get_collision_point :: MethodBind
bindShapeCast2D_get_collision_point
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "get_collision_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the collision point of one of the multiple collisions at @index@ where the shape intersects the colliding object.
--   				__Note:__ this point is in the __global__ coordinate system.
get_collision_point ::
                      (ShapeCast2D :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_collision_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_get_collision_point
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "get_collision_point" '[Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.ShapeCast2D.get_collision_point

{-# NOINLINE bindShapeCast2D_get_exclude_parent_body #-}

-- | If @true@, the parent node will be excluded from collision detection.
bindShapeCast2D_get_exclude_parent_body :: MethodBind
bindShapeCast2D_get_exclude_parent_body
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "get_exclude_parent_body" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the parent node will be excluded from collision detection.
get_exclude_parent_body ::
                          (ShapeCast2D :< cls, Object :< cls) => cls -> IO Bool
get_exclude_parent_body cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_get_exclude_parent_body
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "get_exclude_parent_body" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ShapeCast2D.get_exclude_parent_body

{-# NOINLINE bindShapeCast2D_get_margin #-}

-- | The collision margin for the shape. A larger margin helps detecting collisions more consistently, at the cost of precision.
bindShapeCast2D_get_margin :: MethodBind
bindShapeCast2D_get_margin
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "get_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The collision margin for the shape. A larger margin helps detecting collisions more consistently, at the cost of precision.
get_margin ::
             (ShapeCast2D :< cls, Object :< cls) => cls -> IO Float
get_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_get_margin (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "get_margin" '[] (IO Float) where
        nodeMethod = Godot.Core.ShapeCast2D.get_margin

{-# NOINLINE bindShapeCast2D_get_max_results #-}

-- | The number of intersections can be limited with this parameter, to reduce the processing time.
bindShapeCast2D_get_max_results :: MethodBind
bindShapeCast2D_get_max_results
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "get_max_results" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of intersections can be limited with this parameter, to reduce the processing time.
get_max_results ::
                  (ShapeCast2D :< cls, Object :< cls) => cls -> IO Int
get_max_results cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_get_max_results (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "get_max_results" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ShapeCast2D.get_max_results

{-# NOINLINE bindShapeCast2D_get_shape #-}

-- | The @Shape2D@-derived shape to be used for collision queries.
bindShapeCast2D_get_shape :: MethodBind
bindShapeCast2D_get_shape
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Shape2D@-derived shape to be used for collision queries.
get_shape ::
            (ShapeCast2D :< cls, Object :< cls) => cls -> IO Shape2D
get_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_get_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod ShapeCast2D "get_shape" '[] (IO Shape2D) where
        nodeMethod = Godot.Core.ShapeCast2D.get_shape

{-# NOINLINE bindShapeCast2D_get_target_position #-}

-- | The shape's destination point, relative to this node's @position@.
bindShapeCast2D_get_target_position :: MethodBind
bindShapeCast2D_get_target_position
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "get_target_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shape's destination point, relative to this node's @position@.
get_target_position ::
                      (ShapeCast2D :< cls, Object :< cls) => cls -> IO Vector2
get_target_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_get_target_position
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "get_target_position" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.ShapeCast2D.get_target_position

{-# NOINLINE bindShapeCast2D_is_collide_with_areas_enabled #-}

-- | If @true@, collision with @Area2D@s will be reported.
bindShapeCast2D_is_collide_with_areas_enabled :: MethodBind
bindShapeCast2D_is_collide_with_areas_enabled
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "is_collide_with_areas_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, collision with @Area2D@s will be reported.
is_collide_with_areas_enabled ::
                                (ShapeCast2D :< cls, Object :< cls) => cls -> IO Bool
is_collide_with_areas_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindShapeCast2D_is_collide_with_areas_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "is_collide_with_areas_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ShapeCast2D.is_collide_with_areas_enabled

{-# NOINLINE bindShapeCast2D_is_collide_with_bodies_enabled #-}

-- | If @true@, collision with @PhysicsBody2D@s will be reported.
bindShapeCast2D_is_collide_with_bodies_enabled :: MethodBind
bindShapeCast2D_is_collide_with_bodies_enabled
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "is_collide_with_bodies_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, collision with @PhysicsBody2D@s will be reported.
is_collide_with_bodies_enabled ::
                                 (ShapeCast2D :< cls, Object :< cls) => cls -> IO Bool
is_collide_with_bodies_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindShapeCast2D_is_collide_with_bodies_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "is_collide_with_bodies_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ShapeCast2D.is_collide_with_bodies_enabled

{-# NOINLINE bindShapeCast2D_is_colliding #-}

-- | Returns whether any object is intersecting with the shape's vector (considering the vector length).
bindShapeCast2D_is_colliding :: MethodBind
bindShapeCast2D_is_colliding
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "is_colliding" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether any object is intersecting with the shape's vector (considering the vector length).
is_colliding ::
               (ShapeCast2D :< cls, Object :< cls) => cls -> IO Bool
is_colliding cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_is_colliding (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "is_colliding" '[] (IO Bool) where
        nodeMethod = Godot.Core.ShapeCast2D.is_colliding

{-# NOINLINE bindShapeCast2D_is_enabled #-}

-- | If @true@, collisions will be reported.
bindShapeCast2D_is_enabled :: MethodBind
bindShapeCast2D_is_enabled
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "is_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, collisions will be reported.
is_enabled :: (ShapeCast2D :< cls, Object :< cls) => cls -> IO Bool
is_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_is_enabled (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "is_enabled" '[] (IO Bool) where
        nodeMethod = Godot.Core.ShapeCast2D.is_enabled

{-# NOINLINE bindShapeCast2D_remove_exception #-}

-- | Removes a collision exception so the shape does report collisions with the specified @CollisionObject2D@ node.
bindShapeCast2D_remove_exception :: MethodBind
bindShapeCast2D_remove_exception
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "remove_exception" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a collision exception so the shape does report collisions with the specified @CollisionObject2D@ node.
remove_exception ::
                   (ShapeCast2D :< cls, Object :< cls) => cls -> Object -> IO ()
remove_exception cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_remove_exception
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "remove_exception" '[Object]
           (IO ())
         where
        nodeMethod = Godot.Core.ShapeCast2D.remove_exception

{-# NOINLINE bindShapeCast2D_remove_exception_rid #-}

-- | Removes a collision exception so the shape does report collisions with the specified @RID@.
bindShapeCast2D_remove_exception_rid :: MethodBind
bindShapeCast2D_remove_exception_rid
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "remove_exception_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a collision exception so the shape does report collisions with the specified @RID@.
remove_exception_rid ::
                       (ShapeCast2D :< cls, Object :< cls) => cls -> Rid -> IO ()
remove_exception_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_remove_exception_rid
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "remove_exception_rid" '[Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.ShapeCast2D.remove_exception_rid

{-# NOINLINE bindShapeCast2D_set_collide_with_areas #-}

-- | If @true@, collision with @Area2D@s will be reported.
bindShapeCast2D_set_collide_with_areas :: MethodBind
bindShapeCast2D_set_collide_with_areas
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "set_collide_with_areas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, collision with @Area2D@s will be reported.
set_collide_with_areas ::
                         (ShapeCast2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_collide_with_areas cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_set_collide_with_areas
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "set_collide_with_areas" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.ShapeCast2D.set_collide_with_areas

{-# NOINLINE bindShapeCast2D_set_collide_with_bodies #-}

-- | If @true@, collision with @PhysicsBody2D@s will be reported.
bindShapeCast2D_set_collide_with_bodies :: MethodBind
bindShapeCast2D_set_collide_with_bodies
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "set_collide_with_bodies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, collision with @PhysicsBody2D@s will be reported.
set_collide_with_bodies ::
                          (ShapeCast2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_collide_with_bodies cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_set_collide_with_bodies
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "set_collide_with_bodies" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.ShapeCast2D.set_collide_with_bodies

{-# NOINLINE bindShapeCast2D_set_collision_mask #-}

-- | The shape's collision mask. Only objects in at least one collision layer enabled in the mask will be detected.
bindShapeCast2D_set_collision_mask :: MethodBind
bindShapeCast2D_set_collision_mask
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shape's collision mask. Only objects in at least one collision layer enabled in the mask will be detected.
set_collision_mask ::
                     (ShapeCast2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_set_collision_mask
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "set_collision_mask" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.ShapeCast2D.set_collision_mask

{-# NOINLINE bindShapeCast2D_set_collision_mask_value #-}

-- | Based on @value@, enables or disables the specified layer in the @collision_mask@, given a @layer_number@ between 1 and 32.
bindShapeCast2D_set_collision_mask_value :: MethodBind
bindShapeCast2D_set_collision_mask_value
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "set_collision_mask_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Based on @value@, enables or disables the specified layer in the @collision_mask@, given a @layer_number@ between 1 and 32.
set_collision_mask_value ::
                           (ShapeCast2D :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_mask_value cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_set_collision_mask_value
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "set_collision_mask_value"
           '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.ShapeCast2D.set_collision_mask_value

{-# NOINLINE bindShapeCast2D_set_enabled #-}

-- | If @true@, collisions will be reported.
bindShapeCast2D_set_enabled :: MethodBind
bindShapeCast2D_set_enabled
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "set_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, collisions will be reported.
set_enabled ::
              (ShapeCast2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_set_enabled (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "set_enabled" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.ShapeCast2D.set_enabled

{-# NOINLINE bindShapeCast2D_set_exclude_parent_body #-}

-- | If @true@, the parent node will be excluded from collision detection.
bindShapeCast2D_set_exclude_parent_body :: MethodBind
bindShapeCast2D_set_exclude_parent_body
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "set_exclude_parent_body" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the parent node will be excluded from collision detection.
set_exclude_parent_body ::
                          (ShapeCast2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_exclude_parent_body cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_set_exclude_parent_body
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "set_exclude_parent_body" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.ShapeCast2D.set_exclude_parent_body

{-# NOINLINE bindShapeCast2D_set_margin #-}

-- | The collision margin for the shape. A larger margin helps detecting collisions more consistently, at the cost of precision.
bindShapeCast2D_set_margin :: MethodBind
bindShapeCast2D_set_margin
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "set_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The collision margin for the shape. A larger margin helps detecting collisions more consistently, at the cost of precision.
set_margin ::
             (ShapeCast2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_set_margin (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "set_margin" '[Float] (IO ()) where
        nodeMethod = Godot.Core.ShapeCast2D.set_margin

{-# NOINLINE bindShapeCast2D_set_max_results #-}

-- | The number of intersections can be limited with this parameter, to reduce the processing time.
bindShapeCast2D_set_max_results :: MethodBind
bindShapeCast2D_set_max_results
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "set_max_results" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of intersections can be limited with this parameter, to reduce the processing time.
set_max_results ::
                  (ShapeCast2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_max_results cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_set_max_results (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "set_max_results" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.ShapeCast2D.set_max_results

{-# NOINLINE bindShapeCast2D_set_shape #-}

-- | The @Shape2D@-derived shape to be used for collision queries.
bindShapeCast2D_set_shape :: MethodBind
bindShapeCast2D_set_shape
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Shape2D@-derived shape to be used for collision queries.
set_shape ::
            (ShapeCast2D :< cls, Object :< cls) => cls -> Shape2D -> IO ()
set_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_set_shape (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "set_shape" '[Shape2D] (IO ())
         where
        nodeMethod = Godot.Core.ShapeCast2D.set_shape

{-# NOINLINE bindShapeCast2D_set_target_position #-}

-- | The shape's destination point, relative to this node's @position@.
bindShapeCast2D_set_target_position :: MethodBind
bindShapeCast2D_set_target_position
  = unsafePerformIO $
      withCString "ShapeCast2D" $
        \ clsNamePtr ->
          withCString "set_target_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shape's destination point, relative to this node's @position@.
set_target_position ::
                      (ShapeCast2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_target_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShapeCast2D_set_target_position
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ShapeCast2D "set_target_position" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.ShapeCast2D.set_target_position