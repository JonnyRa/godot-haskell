{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GLTFPhysicsBody
       (Godot.Core.GLTFPhysicsBody.get_angular_velocity,
        Godot.Core.GLTFPhysicsBody.get_body_type,
        Godot.Core.GLTFPhysicsBody.get_linear_velocity,
        Godot.Core.GLTFPhysicsBody.get_mass,
        Godot.Core.GLTFPhysicsBody.set_angular_velocity,
        Godot.Core.GLTFPhysicsBody.set_body_type,
        Godot.Core.GLTFPhysicsBody.set_linear_velocity,
        Godot.Core.GLTFPhysicsBody.set_mass,
        Godot.Core.GLTFPhysicsBody.to_dictionary,
        Godot.Core.GLTFPhysicsBody.to_node)
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
import Godot.Core.Resource()

instance NodeProperty GLTFPhysicsBody "angular_velocity" Vector3
           'False
         where
        nodeProperty
          = (get_angular_velocity, wrapDroppingSetter set_angular_velocity,
             Nothing)

instance NodeProperty GLTFPhysicsBody "body_type" GodotString
           'False
         where
        nodeProperty
          = (get_body_type, wrapDroppingSetter set_body_type, Nothing)

instance NodeProperty GLTFPhysicsBody "linear_velocity" Vector3
           'False
         where
        nodeProperty
          = (get_linear_velocity, wrapDroppingSetter set_linear_velocity,
             Nothing)

instance NodeProperty GLTFPhysicsBody "mass" Float 'False where
        nodeProperty = (get_mass, wrapDroppingSetter set_mass, Nothing)

{-# NOINLINE bindGLTFPhysicsBody_get_angular_velocity #-}

bindGLTFPhysicsBody_get_angular_velocity :: MethodBind
bindGLTFPhysicsBody_get_angular_velocity
  = unsafePerformIO $
      withCString "GLTFPhysicsBody" $
        \ clsNamePtr ->
          withCString "get_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_angular_velocity ::
                       (GLTFPhysicsBody :< cls, Object :< cls) => cls -> IO Vector3
get_angular_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFPhysicsBody_get_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFPhysicsBody "get_angular_velocity" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.GLTFPhysicsBody.get_angular_velocity

{-# NOINLINE bindGLTFPhysicsBody_get_body_type #-}

bindGLTFPhysicsBody_get_body_type :: MethodBind
bindGLTFPhysicsBody_get_body_type
  = unsafePerformIO $
      withCString "GLTFPhysicsBody" $
        \ clsNamePtr ->
          withCString "get_body_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_body_type ::
                (GLTFPhysicsBody :< cls, Object :< cls) => cls -> IO GodotString
get_body_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFPhysicsBody_get_body_type
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFPhysicsBody "get_body_type" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.GLTFPhysicsBody.get_body_type

{-# NOINLINE bindGLTFPhysicsBody_get_linear_velocity #-}

bindGLTFPhysicsBody_get_linear_velocity :: MethodBind
bindGLTFPhysicsBody_get_linear_velocity
  = unsafePerformIO $
      withCString "GLTFPhysicsBody" $
        \ clsNamePtr ->
          withCString "get_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_linear_velocity ::
                      (GLTFPhysicsBody :< cls, Object :< cls) => cls -> IO Vector3
get_linear_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFPhysicsBody_get_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFPhysicsBody "get_linear_velocity" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.GLTFPhysicsBody.get_linear_velocity

{-# NOINLINE bindGLTFPhysicsBody_get_mass #-}

bindGLTFPhysicsBody_get_mass :: MethodBind
bindGLTFPhysicsBody_get_mass
  = unsafePerformIO $
      withCString "GLTFPhysicsBody" $
        \ clsNamePtr ->
          withCString "get_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mass ::
           (GLTFPhysicsBody :< cls, Object :< cls) => cls -> IO Float
get_mass cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFPhysicsBody_get_mass (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFPhysicsBody "get_mass" '[] (IO Float) where
        nodeMethod = Godot.Core.GLTFPhysicsBody.get_mass

{-# NOINLINE bindGLTFPhysicsBody_set_angular_velocity #-}

bindGLTFPhysicsBody_set_angular_velocity :: MethodBind
bindGLTFPhysicsBody_set_angular_velocity
  = unsafePerformIO $
      withCString "GLTFPhysicsBody" $
        \ clsNamePtr ->
          withCString "set_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_angular_velocity ::
                       (GLTFPhysicsBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_angular_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFPhysicsBody_set_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFPhysicsBody "set_angular_velocity"
           '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFPhysicsBody.set_angular_velocity

{-# NOINLINE bindGLTFPhysicsBody_set_body_type #-}

bindGLTFPhysicsBody_set_body_type :: MethodBind
bindGLTFPhysicsBody_set_body_type
  = unsafePerformIO $
      withCString "GLTFPhysicsBody" $
        \ clsNamePtr ->
          withCString "set_body_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_body_type ::
                (GLTFPhysicsBody :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_body_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFPhysicsBody_set_body_type
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFPhysicsBody "set_body_type" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFPhysicsBody.set_body_type

{-# NOINLINE bindGLTFPhysicsBody_set_linear_velocity #-}

bindGLTFPhysicsBody_set_linear_velocity :: MethodBind
bindGLTFPhysicsBody_set_linear_velocity
  = unsafePerformIO $
      withCString "GLTFPhysicsBody" $
        \ clsNamePtr ->
          withCString "set_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_linear_velocity ::
                      (GLTFPhysicsBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_linear_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFPhysicsBody_set_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFPhysicsBody "set_linear_velocity"
           '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFPhysicsBody.set_linear_velocity

{-# NOINLINE bindGLTFPhysicsBody_set_mass #-}

bindGLTFPhysicsBody_set_mass :: MethodBind
bindGLTFPhysicsBody_set_mass
  = unsafePerformIO $
      withCString "GLTFPhysicsBody" $
        \ clsNamePtr ->
          withCString "set_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_mass ::
           (GLTFPhysicsBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_mass cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFPhysicsBody_set_mass (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFPhysicsBody "set_mass" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.GLTFPhysicsBody.set_mass

{-# NOINLINE bindGLTFPhysicsBody_to_dictionary #-}

bindGLTFPhysicsBody_to_dictionary :: MethodBind
bindGLTFPhysicsBody_to_dictionary
  = unsafePerformIO $
      withCString "GLTFPhysicsBody" $
        \ clsNamePtr ->
          withCString "to_dictionary" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

to_dictionary ::
                (GLTFPhysicsBody :< cls, Object :< cls) => cls -> IO Dictionary
to_dictionary cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFPhysicsBody_to_dictionary
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFPhysicsBody "to_dictionary" '[]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.GLTFPhysicsBody.to_dictionary

{-# NOINLINE bindGLTFPhysicsBody_to_node #-}

bindGLTFPhysicsBody_to_node :: MethodBind
bindGLTFPhysicsBody_to_node
  = unsafePerformIO $
      withCString "GLTFPhysicsBody" $
        \ clsNamePtr ->
          withCString "to_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

to_node ::
          (GLTFPhysicsBody :< cls, Object :< cls) =>
          cls -> IO CollisionObject
to_node cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFPhysicsBody_to_node (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod GLTFPhysicsBody "to_node" '[]
           (IO CollisionObject)
         where
        nodeMethod = Godot.Core.GLTFPhysicsBody.to_node