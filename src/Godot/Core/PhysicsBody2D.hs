{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PhysicsBody2D
       (Godot.Core.PhysicsBody2D._get_layers,
        Godot.Core.PhysicsBody2D._set_layers,
        Godot.Core.PhysicsBody2D.add_collision_exception_with,
        Godot.Core.PhysicsBody2D.get_collision_exceptions,
        Godot.Core.PhysicsBody2D.remove_collision_exception_with)
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
import Godot.Core.CollisionObject2D()

instance NodeProperty PhysicsBody2D "layers" Int 'False where
        nodeProperty
          = (_get_layers, wrapDroppingSetter _set_layers, Nothing)

{-# NOINLINE bindPhysicsBody2D__get_layers #-}

-- | Both collision_layer and collision_mask. Returns collision_layer when accessed. Updates collision_layer and collision_mask when modified.
bindPhysicsBody2D__get_layers :: MethodBind
bindPhysicsBody2D__get_layers
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "_get_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Both collision_layer and collision_mask. Returns collision_layer when accessed. Updates collision_layer and collision_mask when modified.
_get_layers ::
              (PhysicsBody2D :< cls, Object :< cls) => cls -> IO Int
_get_layers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody2D__get_layers (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsBody2D "_get_layers" '[] (IO Int) where
        nodeMethod = Godot.Core.PhysicsBody2D._get_layers

{-# NOINLINE bindPhysicsBody2D__set_layers #-}

-- | Both collision_layer and collision_mask. Returns collision_layer when accessed. Updates collision_layer and collision_mask when modified.
bindPhysicsBody2D__set_layers :: MethodBind
bindPhysicsBody2D__set_layers
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "_set_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Both collision_layer and collision_mask. Returns collision_layer when accessed. Updates collision_layer and collision_mask when modified.
_set_layers ::
              (PhysicsBody2D :< cls, Object :< cls) => cls -> Int -> IO ()
_set_layers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody2D__set_layers (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsBody2D "_set_layers" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.PhysicsBody2D._set_layers

{-# NOINLINE bindPhysicsBody2D_add_collision_exception_with #-}

-- | Adds a body to the list of bodies that this body can't collide with.
bindPhysicsBody2D_add_collision_exception_with :: MethodBind
bindPhysicsBody2D_add_collision_exception_with
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "add_collision_exception_with" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a body to the list of bodies that this body can't collide with.
add_collision_exception_with ::
                               (PhysicsBody2D :< cls, Object :< cls) => cls -> Node -> IO ()
add_collision_exception_with cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsBody2D_add_collision_exception_with
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsBody2D "add_collision_exception_with"
           '[Node]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsBody2D.add_collision_exception_with

{-# NOINLINE bindPhysicsBody2D_get_collision_exceptions #-}

-- | Returns an array of nodes that were added as collision exceptions for this body.
bindPhysicsBody2D_get_collision_exceptions :: MethodBind
bindPhysicsBody2D_get_collision_exceptions
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "get_collision_exceptions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of nodes that were added as collision exceptions for this body.
get_collision_exceptions ::
                           (PhysicsBody2D :< cls, Object :< cls) => cls -> IO Array
get_collision_exceptions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody2D_get_collision_exceptions
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsBody2D "get_collision_exceptions" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.PhysicsBody2D.get_collision_exceptions

{-# NOINLINE bindPhysicsBody2D_remove_collision_exception_with #-}

-- | Removes a body from the list of bodies that this body can't collide with.
bindPhysicsBody2D_remove_collision_exception_with :: MethodBind
bindPhysicsBody2D_remove_collision_exception_with
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "remove_collision_exception_with" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a body from the list of bodies that this body can't collide with.
remove_collision_exception_with ::
                                  (PhysicsBody2D :< cls, Object :< cls) => cls -> Node -> IO ()
remove_collision_exception_with cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsBody2D_remove_collision_exception_with
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsBody2D "remove_collision_exception_with"
           '[Node]
           (IO ())
         where
        nodeMethod
          = Godot.Core.PhysicsBody2D.remove_collision_exception_with