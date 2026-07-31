{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.OccluderShapeSphere
       (Godot.Core.OccluderShapeSphere.get_spheres,
        Godot.Core.OccluderShapeSphere.set_sphere_position,
        Godot.Core.OccluderShapeSphere.set_sphere_radius,
        Godot.Core.OccluderShapeSphere.set_spheres)
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
import Godot.Core.OccluderShape()

instance NodeProperty OccluderShapeSphere "spheres" Array 'False
         where
        nodeProperty
          = (get_spheres, wrapDroppingSetter set_spheres, Nothing)

{-# NOINLINE bindOccluderShapeSphere_get_spheres #-}

-- | The sphere data can be accessed as an array of @Plane@s. The position of each sphere is stored in the @normal@, and the radius is stored in the @d@ value of the plane.
bindOccluderShapeSphere_get_spheres :: MethodBind
bindOccluderShapeSphere_get_spheres
  = unsafePerformIO $
      withCString "OccluderShapeSphere" $
        \ clsNamePtr ->
          withCString "get_spheres" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sphere data can be accessed as an array of @Plane@s. The position of each sphere is stored in the @normal@, and the radius is stored in the @d@ value of the plane.
get_spheres ::
              (OccluderShapeSphere :< cls, Object :< cls) => cls -> IO Array
get_spheres cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderShapeSphere_get_spheres
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod OccluderShapeSphere "get_spheres" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.OccluderShapeSphere.get_spheres

{-# NOINLINE bindOccluderShapeSphere_set_sphere_position #-}

-- | Sets an individual sphere's position.
bindOccluderShapeSphere_set_sphere_position :: MethodBind
bindOccluderShapeSphere_set_sphere_position
  = unsafePerformIO $
      withCString "OccluderShapeSphere" $
        \ clsNamePtr ->
          withCString "set_sphere_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an individual sphere's position.
set_sphere_position ::
                      (OccluderShapeSphere :< cls, Object :< cls) =>
                      cls -> Int -> Vector3 -> IO ()
set_sphere_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderShapeSphere_set_sphere_position
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod OccluderShapeSphere "set_sphere_position"
           '[Int, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.OccluderShapeSphere.set_sphere_position

{-# NOINLINE bindOccluderShapeSphere_set_sphere_radius #-}

-- | Sets an individual sphere's radius.
bindOccluderShapeSphere_set_sphere_radius :: MethodBind
bindOccluderShapeSphere_set_sphere_radius
  = unsafePerformIO $
      withCString "OccluderShapeSphere" $
        \ clsNamePtr ->
          withCString "set_sphere_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an individual sphere's radius.
set_sphere_radius ::
                    (OccluderShapeSphere :< cls, Object :< cls) =>
                    cls -> Int -> Float -> IO ()
set_sphere_radius cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderShapeSphere_set_sphere_radius
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod OccluderShapeSphere "set_sphere_radius"
           '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.OccluderShapeSphere.set_sphere_radius

{-# NOINLINE bindOccluderShapeSphere_set_spheres #-}

-- | The sphere data can be accessed as an array of @Plane@s. The position of each sphere is stored in the @normal@, and the radius is stored in the @d@ value of the plane.
bindOccluderShapeSphere_set_spheres :: MethodBind
bindOccluderShapeSphere_set_spheres
  = unsafePerformIO $
      withCString "OccluderShapeSphere" $
        \ clsNamePtr ->
          withCString "set_spheres" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sphere data can be accessed as an array of @Plane@s. The position of each sphere is stored in the @normal@, and the radius is stored in the @d@ value of the plane.
set_spheres ::
              (OccluderShapeSphere :< cls, Object :< cls) =>
              cls -> Array -> IO ()
set_spheres cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderShapeSphere_set_spheres
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod OccluderShapeSphere "set_spheres" '[Array]
           (IO ())
         where
        nodeMethod = Godot.Core.OccluderShapeSphere.set_spheres