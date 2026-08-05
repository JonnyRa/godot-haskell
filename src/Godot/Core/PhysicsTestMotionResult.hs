{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PhysicsTestMotionResult
       (Godot.Core.PhysicsTestMotionResult.get_collider,
        Godot.Core.PhysicsTestMotionResult.get_collider_id,
        Godot.Core.PhysicsTestMotionResult.get_collider_rid,
        Godot.Core.PhysicsTestMotionResult.get_collider_shape,
        Godot.Core.PhysicsTestMotionResult.get_collider_velocity,
        Godot.Core.PhysicsTestMotionResult.get_collision_depth,
        Godot.Core.PhysicsTestMotionResult.get_collision_normal,
        Godot.Core.PhysicsTestMotionResult.get_collision_point,
        Godot.Core.PhysicsTestMotionResult.get_collision_safe_fraction,
        Godot.Core.PhysicsTestMotionResult.get_collision_unsafe_fraction,
        Godot.Core.PhysicsTestMotionResult.get_motion,
        Godot.Core.PhysicsTestMotionResult.get_motion_remainder)
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
import Godot.Core.Reference()

instance NodeProperty PhysicsTestMotionResult "collider" Object
           'True
         where
        nodeProperty = (get_collider, (), Nothing)

instance NodeProperty PhysicsTestMotionResult "collider_id" Int
           'True
         where
        nodeProperty = (get_collider_id, (), Nothing)

instance NodeProperty PhysicsTestMotionResult "collider_rid" Rid
           'True
         where
        nodeProperty = (get_collider_rid, (), Nothing)

instance NodeProperty PhysicsTestMotionResult "collider_shape" Int
           'True
         where
        nodeProperty = (get_collider_shape, (), Nothing)

instance NodeProperty PhysicsTestMotionResult "collider_velocity"
           Vector3
           'True
         where
        nodeProperty = (get_collider_velocity, (), Nothing)

instance NodeProperty PhysicsTestMotionResult "collision_depth"
           Float
           'True
         where
        nodeProperty = (get_collision_depth, (), Nothing)

instance NodeProperty PhysicsTestMotionResult "collision_normal"
           Vector3
           'True
         where
        nodeProperty = (get_collision_normal, (), Nothing)

instance NodeProperty PhysicsTestMotionResult "collision_point"
           Vector3
           'True
         where
        nodeProperty = (get_collision_point, (), Nothing)

instance NodeProperty PhysicsTestMotionResult
           "collision_safe_fraction"
           Float
           'True
         where
        nodeProperty = (get_collision_safe_fraction, (), Nothing)

instance NodeProperty PhysicsTestMotionResult
           "collision_unsafe_fraction"
           Float
           'True
         where
        nodeProperty = (get_collision_unsafe_fraction, (), Nothing)

instance NodeProperty PhysicsTestMotionResult "motion" Vector3
           'True
         where
        nodeProperty = (get_motion, (), Nothing)

instance NodeProperty PhysicsTestMotionResult "motion_remainder"
           Vector3
           'True
         where
        nodeProperty = (get_motion_remainder, (), Nothing)

{-# NOINLINE bindPhysicsTestMotionResult_get_collider #-}

bindPhysicsTestMotionResult_get_collider :: MethodBind
bindPhysicsTestMotionResult_get_collider
  = unsafePerformIO $
      withCString "PhysicsTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collider" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collider ::
               (PhysicsTestMotionResult :< cls, Object :< cls) => cls -> IO Object
get_collider cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsTestMotionResult_get_collider
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod PhysicsTestMotionResult "get_collider" '[]
           (IO Object)
         where
        nodeMethod = Godot.Core.PhysicsTestMotionResult.get_collider

{-# NOINLINE bindPhysicsTestMotionResult_get_collider_id #-}

bindPhysicsTestMotionResult_get_collider_id :: MethodBind
bindPhysicsTestMotionResult_get_collider_id
  = unsafePerformIO $
      withCString "PhysicsTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collider_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collider_id ::
                  (PhysicsTestMotionResult :< cls, Object :< cls) => cls -> IO Int
get_collider_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsTestMotionResult_get_collider_id
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsTestMotionResult "get_collider_id" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsTestMotionResult.get_collider_id

{-# NOINLINE bindPhysicsTestMotionResult_get_collider_rid #-}

bindPhysicsTestMotionResult_get_collider_rid :: MethodBind
bindPhysicsTestMotionResult_get_collider_rid
  = unsafePerformIO $
      withCString "PhysicsTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collider_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collider_rid ::
                   (PhysicsTestMotionResult :< cls, Object :< cls) => cls -> IO Rid
get_collider_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsTestMotionResult_get_collider_rid
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsTestMotionResult "get_collider_rid" '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.PhysicsTestMotionResult.get_collider_rid

{-# NOINLINE bindPhysicsTestMotionResult_get_collider_shape #-}

bindPhysicsTestMotionResult_get_collider_shape :: MethodBind
bindPhysicsTestMotionResult_get_collider_shape
  = unsafePerformIO $
      withCString "PhysicsTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collider_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collider_shape ::
                     (PhysicsTestMotionResult :< cls, Object :< cls) => cls -> IO Int
get_collider_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsTestMotionResult_get_collider_shape
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsTestMotionResult "get_collider_shape"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsTestMotionResult.get_collider_shape

{-# NOINLINE bindPhysicsTestMotionResult_get_collider_velocity #-}

bindPhysicsTestMotionResult_get_collider_velocity :: MethodBind
bindPhysicsTestMotionResult_get_collider_velocity
  = unsafePerformIO $
      withCString "PhysicsTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collider_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collider_velocity ::
                        (PhysicsTestMotionResult :< cls, Object :< cls) =>
                        cls -> IO Vector3
get_collider_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsTestMotionResult_get_collider_velocity
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsTestMotionResult "get_collider_velocity"
           '[]
           (IO Vector3)
         where
        nodeMethod
          = Godot.Core.PhysicsTestMotionResult.get_collider_velocity

{-# NOINLINE bindPhysicsTestMotionResult_get_collision_depth #-}

bindPhysicsTestMotionResult_get_collision_depth :: MethodBind
bindPhysicsTestMotionResult_get_collision_depth
  = unsafePerformIO $
      withCString "PhysicsTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collision_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_depth ::
                      (PhysicsTestMotionResult :< cls, Object :< cls) => cls -> IO Float
get_collision_depth cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsTestMotionResult_get_collision_depth
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsTestMotionResult "get_collision_depth"
           '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.PhysicsTestMotionResult.get_collision_depth

{-# NOINLINE bindPhysicsTestMotionResult_get_collision_normal #-}

bindPhysicsTestMotionResult_get_collision_normal :: MethodBind
bindPhysicsTestMotionResult_get_collision_normal
  = unsafePerformIO $
      withCString "PhysicsTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collision_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_normal ::
                       (PhysicsTestMotionResult :< cls, Object :< cls) =>
                       cls -> IO Vector3
get_collision_normal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsTestMotionResult_get_collision_normal
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsTestMotionResult "get_collision_normal"
           '[]
           (IO Vector3)
         where
        nodeMethod
          = Godot.Core.PhysicsTestMotionResult.get_collision_normal

{-# NOINLINE bindPhysicsTestMotionResult_get_collision_point #-}

bindPhysicsTestMotionResult_get_collision_point :: MethodBind
bindPhysicsTestMotionResult_get_collision_point
  = unsafePerformIO $
      withCString "PhysicsTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collision_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_point ::
                      (PhysicsTestMotionResult :< cls, Object :< cls) =>
                      cls -> IO Vector3
get_collision_point cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsTestMotionResult_get_collision_point
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsTestMotionResult "get_collision_point"
           '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.PhysicsTestMotionResult.get_collision_point

{-# NOINLINE bindPhysicsTestMotionResult_get_collision_safe_fraction
             #-}

bindPhysicsTestMotionResult_get_collision_safe_fraction ::
                                                        MethodBind
bindPhysicsTestMotionResult_get_collision_safe_fraction
  = unsafePerformIO $
      withCString "PhysicsTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collision_safe_fraction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_safe_fraction ::
                              (PhysicsTestMotionResult :< cls, Object :< cls) => cls -> IO Float
get_collision_safe_fraction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsTestMotionResult_get_collision_safe_fraction
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsTestMotionResult
           "get_collision_safe_fraction"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.PhysicsTestMotionResult.get_collision_safe_fraction

{-# NOINLINE bindPhysicsTestMotionResult_get_collision_unsafe_fraction
             #-}

bindPhysicsTestMotionResult_get_collision_unsafe_fraction ::
                                                          MethodBind
bindPhysicsTestMotionResult_get_collision_unsafe_fraction
  = unsafePerformIO $
      withCString "PhysicsTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collision_unsafe_fraction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_unsafe_fraction ::
                                (PhysicsTestMotionResult :< cls, Object :< cls) => cls -> IO Float
get_collision_unsafe_fraction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsTestMotionResult_get_collision_unsafe_fraction
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsTestMotionResult
           "get_collision_unsafe_fraction"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.PhysicsTestMotionResult.get_collision_unsafe_fraction

{-# NOINLINE bindPhysicsTestMotionResult_get_motion #-}

bindPhysicsTestMotionResult_get_motion :: MethodBind
bindPhysicsTestMotionResult_get_motion
  = unsafePerformIO $
      withCString "PhysicsTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_motion" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_motion ::
             (PhysicsTestMotionResult :< cls, Object :< cls) =>
             cls -> IO Vector3
get_motion cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsTestMotionResult_get_motion
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsTestMotionResult "get_motion" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.PhysicsTestMotionResult.get_motion

{-# NOINLINE bindPhysicsTestMotionResult_get_motion_remainder #-}

bindPhysicsTestMotionResult_get_motion_remainder :: MethodBind
bindPhysicsTestMotionResult_get_motion_remainder
  = unsafePerformIO $
      withCString "PhysicsTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_motion_remainder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_motion_remainder ::
                       (PhysicsTestMotionResult :< cls, Object :< cls) =>
                       cls -> IO Vector3
get_motion_remainder cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsTestMotionResult_get_motion_remainder
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsTestMotionResult "get_motion_remainder"
           '[]
           (IO Vector3)
         where
        nodeMethod
          = Godot.Core.PhysicsTestMotionResult.get_motion_remainder