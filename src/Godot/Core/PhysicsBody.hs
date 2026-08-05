{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PhysicsBody
       (Godot.Core.PhysicsBody._get_layers,
        Godot.Core.PhysicsBody._set_layers,
        Godot.Core.PhysicsBody.add_collision_exception_with,
        Godot.Core.PhysicsBody.get_collision_exceptions,
        Godot.Core.PhysicsBody.remove_collision_exception_with)
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
import Godot.Core.CollisionObject()

{-# NOINLINE bindPhysicsBody__get_layers #-}

bindPhysicsBody__get_layers :: MethodBind
bindPhysicsBody__get_layers
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "_get_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_layers :: (PhysicsBody :< cls, Object :< cls) => cls -> IO Int
_get_layers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody__get_layers (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsBody "_get_layers" '[] (IO Int) where
        nodeMethod = Godot.Core.PhysicsBody._get_layers

{-# NOINLINE bindPhysicsBody__set_layers #-}

bindPhysicsBody__set_layers :: MethodBind
bindPhysicsBody__set_layers
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "_set_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_layers ::
              (PhysicsBody :< cls, Object :< cls) => cls -> Int -> IO ()
_set_layers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody__set_layers (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsBody "_set_layers" '[Int] (IO ()) where
        nodeMethod = Godot.Core.PhysicsBody._set_layers

{-# NOINLINE bindPhysicsBody_add_collision_exception_with #-}

-- | Adds a body to the list of bodies that this body can't collide with.
bindPhysicsBody_add_collision_exception_with :: MethodBind
bindPhysicsBody_add_collision_exception_with
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "add_collision_exception_with" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a body to the list of bodies that this body can't collide with.
add_collision_exception_with ::
                               (PhysicsBody :< cls, Object :< cls) => cls -> Node -> IO ()
add_collision_exception_with cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody_add_collision_exception_with
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsBody "add_collision_exception_with"
           '[Node]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsBody.add_collision_exception_with

{-# NOINLINE bindPhysicsBody_get_collision_exceptions #-}

-- | Returns an array of nodes that were added as collision exceptions for this body.
bindPhysicsBody_get_collision_exceptions :: MethodBind
bindPhysicsBody_get_collision_exceptions
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "get_collision_exceptions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of nodes that were added as collision exceptions for this body.
get_collision_exceptions ::
                           (PhysicsBody :< cls, Object :< cls) => cls -> IO Array
get_collision_exceptions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody_get_collision_exceptions
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsBody "get_collision_exceptions" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.PhysicsBody.get_collision_exceptions

{-# NOINLINE bindPhysicsBody_remove_collision_exception_with #-}

-- | Removes a body from the list of bodies that this body can't collide with.
bindPhysicsBody_remove_collision_exception_with :: MethodBind
bindPhysicsBody_remove_collision_exception_with
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "remove_collision_exception_with" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a body from the list of bodies that this body can't collide with.
remove_collision_exception_with ::
                                  (PhysicsBody :< cls, Object :< cls) => cls -> Node -> IO ()
remove_collision_exception_with cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsBody_remove_collision_exception_with
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod PhysicsBody "remove_collision_exception_with"
           '[Node]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsBody.remove_collision_exception_with