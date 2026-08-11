{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.OccluderShapePolygon
       (Godot.Core.OccluderShapePolygon.get_hole_points,
        Godot.Core.OccluderShapePolygon.get_polygon_points,
        Godot.Core.OccluderShapePolygon.is_two_way,
        Godot.Core.OccluderShapePolygon.set_hole_point,
        Godot.Core.OccluderShapePolygon.set_hole_points,
        Godot.Core.OccluderShapePolygon.set_polygon_point,
        Godot.Core.OccluderShapePolygon.set_polygon_points,
        Godot.Core.OccluderShapePolygon.set_two_way)
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

instance NodeProperty OccluderShapePolygon "hole_points"
           PoolVector2Array
           'False
         where
        nodeProperty
          = (get_hole_points, wrapDroppingSetter set_hole_points, Nothing)

instance NodeProperty OccluderShapePolygon "polygon_points"
           PoolVector2Array
           'False
         where
        nodeProperty
          = (get_polygon_points, wrapDroppingSetter set_polygon_points,
             Nothing)

instance NodeProperty OccluderShapePolygon "two_way" Bool 'False
         where
        nodeProperty
          = (is_two_way, wrapDroppingSetter set_two_way, Nothing)

{-# NOINLINE bindOccluderShapePolygon_get_hole_points #-}

-- | Allows changing the hole geometry from code.
bindOccluderShapePolygon_get_hole_points :: MethodBind
bindOccluderShapePolygon_get_hole_points
  = unsafePerformIO $
      withCString "OccluderShapePolygon" $
        \ clsNamePtr ->
          withCString "get_hole_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allows changing the hole geometry from code.
get_hole_points ::
                  (OccluderShapePolygon :< cls, Object :< cls) =>
                  cls -> IO PoolVector2Array
get_hole_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderShapePolygon_get_hole_points
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod OccluderShapePolygon "get_hole_points" '[]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.OccluderShapePolygon.get_hole_points

{-# NOINLINE bindOccluderShapePolygon_get_polygon_points #-}

-- | Allows changing the polygon geometry from code.
bindOccluderShapePolygon_get_polygon_points :: MethodBind
bindOccluderShapePolygon_get_polygon_points
  = unsafePerformIO $
      withCString "OccluderShapePolygon" $
        \ clsNamePtr ->
          withCString "get_polygon_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allows changing the polygon geometry from code.
get_polygon_points ::
                     (OccluderShapePolygon :< cls, Object :< cls) =>
                     cls -> IO PoolVector2Array
get_polygon_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderShapePolygon_get_polygon_points
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod OccluderShapePolygon "get_polygon_points" '[]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.OccluderShapePolygon.get_polygon_points

{-# NOINLINE bindOccluderShapePolygon_is_two_way #-}

-- | Specifies whether the occluder should operate from both sides. If @false@, the occluder will operate one way only.
bindOccluderShapePolygon_is_two_way :: MethodBind
bindOccluderShapePolygon_is_two_way
  = unsafePerformIO $
      withCString "OccluderShapePolygon" $
        \ clsNamePtr ->
          withCString "is_two_way" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies whether the occluder should operate from both sides. If @false@, the occluder will operate one way only.
is_two_way ::
             (OccluderShapePolygon :< cls, Object :< cls) => cls -> IO Bool
is_two_way cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderShapePolygon_is_two_way
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod OccluderShapePolygon "is_two_way" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.OccluderShapePolygon.is_two_way

{-# NOINLINE bindOccluderShapePolygon_set_hole_point #-}

-- | Sets an individual hole point position. Primarily for use by the editor.
--   				__Note:__ This function will not resize the hole point array. Set @hole_points@ to set the number of points.
bindOccluderShapePolygon_set_hole_point :: MethodBind
bindOccluderShapePolygon_set_hole_point
  = unsafePerformIO $
      withCString "OccluderShapePolygon" $
        \ clsNamePtr ->
          withCString "set_hole_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an individual hole point position. Primarily for use by the editor.
--   				__Note:__ This function will not resize the hole point array. Set @hole_points@ to set the number of points.
set_hole_point ::
                 (OccluderShapePolygon :< cls, Object :< cls) =>
                 cls -> Int -> Vector2 -> IO ()
set_hole_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderShapePolygon_set_hole_point
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod OccluderShapePolygon "set_hole_point"
           '[Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.OccluderShapePolygon.set_hole_point

{-# NOINLINE bindOccluderShapePolygon_set_hole_points #-}

-- | Allows changing the hole geometry from code.
bindOccluderShapePolygon_set_hole_points :: MethodBind
bindOccluderShapePolygon_set_hole_points
  = unsafePerformIO $
      withCString "OccluderShapePolygon" $
        \ clsNamePtr ->
          withCString "set_hole_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allows changing the hole geometry from code.
set_hole_points ::
                  (OccluderShapePolygon :< cls, Object :< cls) =>
                  cls -> PoolVector2Array -> IO ()
set_hole_points cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderShapePolygon_set_hole_points
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod OccluderShapePolygon "set_hole_points"
           '[PoolVector2Array]
           (IO ())
         where
        nodeMethod = Godot.Core.OccluderShapePolygon.set_hole_points

{-# NOINLINE bindOccluderShapePolygon_set_polygon_point #-}

-- | Sets an individual polygon point position. Primarily for use by the editor.
--   				__Note:__ This function will not resize the polygon point array. Set @polygon_points@ to set the number of points.
bindOccluderShapePolygon_set_polygon_point :: MethodBind
bindOccluderShapePolygon_set_polygon_point
  = unsafePerformIO $
      withCString "OccluderShapePolygon" $
        \ clsNamePtr ->
          withCString "set_polygon_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an individual polygon point position. Primarily for use by the editor.
--   				__Note:__ This function will not resize the polygon point array. Set @polygon_points@ to set the number of points.
set_polygon_point ::
                    (OccluderShapePolygon :< cls, Object :< cls) =>
                    cls -> Int -> Vector2 -> IO ()
set_polygon_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderShapePolygon_set_polygon_point
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod OccluderShapePolygon "set_polygon_point"
           '[Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.OccluderShapePolygon.set_polygon_point

{-# NOINLINE bindOccluderShapePolygon_set_polygon_points #-}

-- | Allows changing the polygon geometry from code.
bindOccluderShapePolygon_set_polygon_points :: MethodBind
bindOccluderShapePolygon_set_polygon_points
  = unsafePerformIO $
      withCString "OccluderShapePolygon" $
        \ clsNamePtr ->
          withCString "set_polygon_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allows changing the polygon geometry from code.
set_polygon_points ::
                     (OccluderShapePolygon :< cls, Object :< cls) =>
                     cls -> PoolVector2Array -> IO ()
set_polygon_points cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderShapePolygon_set_polygon_points
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod OccluderShapePolygon "set_polygon_points"
           '[PoolVector2Array]
           (IO ())
         where
        nodeMethod = Godot.Core.OccluderShapePolygon.set_polygon_points

{-# NOINLINE bindOccluderShapePolygon_set_two_way #-}

-- | Specifies whether the occluder should operate from both sides. If @false@, the occluder will operate one way only.
bindOccluderShapePolygon_set_two_way :: MethodBind
bindOccluderShapePolygon_set_two_way
  = unsafePerformIO $
      withCString "OccluderShapePolygon" $
        \ clsNamePtr ->
          withCString "set_two_way" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies whether the occluder should operate from both sides. If @false@, the occluder will operate one way only.
set_two_way ::
              (OccluderShapePolygon :< cls, Object :< cls) =>
              cls -> Bool -> IO ()
set_two_way cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderShapePolygon_set_two_way
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod OccluderShapePolygon "set_two_way" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.OccluderShapePolygon.set_two_way