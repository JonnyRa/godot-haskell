{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Navigation2D
       (Godot.Core.Navigation2D.get_cell_size,
        Godot.Core.Navigation2D.get_closest_point,
        Godot.Core.Navigation2D.get_closest_point_owner,
        Godot.Core.Navigation2D.get_edge_connection_margin,
        Godot.Core.Navigation2D.get_navigation_layers,
        Godot.Core.Navigation2D.get_rid,
        Godot.Core.Navigation2D.get_simple_path,
        Godot.Core.Navigation2D.set_cell_size,
        Godot.Core.Navigation2D.set_edge_connection_margin,
        Godot.Core.Navigation2D.set_navigation_layers)
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

instance NodeProperty Navigation2D "cell_size" Float 'False where
        nodeProperty
          = (get_cell_size, wrapDroppingSetter set_cell_size, Nothing)

instance NodeProperty Navigation2D "edge_connection_margin" Float
           'False
         where
        nodeProperty
          = (get_edge_connection_margin,
             wrapDroppingSetter set_edge_connection_margin, Nothing)

instance NodeProperty Navigation2D "navigation_layers" Int 'False
         where
        nodeProperty
          = (get_navigation_layers, wrapDroppingSetter set_navigation_layers,
             Nothing)

{-# NOINLINE bindNavigation2D_get_cell_size #-}

-- | The XY plane cell size to use for fields.
bindNavigation2D_get_cell_size :: MethodBind
bindNavigation2D_get_cell_size
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "get_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The XY plane cell size to use for fields.
get_cell_size ::
                (Navigation2D :< cls, Object :< cls) => cls -> IO Float
get_cell_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_get_cell_size (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2D "get_cell_size" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Navigation2D.get_cell_size

{-# NOINLINE bindNavigation2D_get_closest_point #-}

-- | Returns the navigation point closest to the point given. Points are in local coordinate space.
bindNavigation2D_get_closest_point :: MethodBind
bindNavigation2D_get_closest_point
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "get_closest_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the navigation point closest to the point given. Points are in local coordinate space.
get_closest_point ::
                    (Navigation2D :< cls, Object :< cls) =>
                    cls -> Vector2 -> IO Vector2
get_closest_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_get_closest_point
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2D "get_closest_point" '[Vector2]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Navigation2D.get_closest_point

{-# NOINLINE bindNavigation2D_get_closest_point_owner #-}

-- | Returns the owner of the @NavigationPolygon@ which contains the navigation point closest to the point given. This is usually a @NavigationPolygonInstance@.
bindNavigation2D_get_closest_point_owner :: MethodBind
bindNavigation2D_get_closest_point_owner
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "get_closest_point_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the owner of the @NavigationPolygon@ which contains the navigation point closest to the point given. This is usually a @NavigationPolygonInstance@.
get_closest_point_owner ::
                          (Navigation2D :< cls, Object :< cls) => cls -> Vector2 -> IO Rid
get_closest_point_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_get_closest_point_owner
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2D "get_closest_point_owner"
           '[Vector2]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Navigation2D.get_closest_point_owner

{-# NOINLINE bindNavigation2D_get_edge_connection_margin #-}

-- | This value is used to detect the near edges to connect compatible regions.
bindNavigation2D_get_edge_connection_margin :: MethodBind
bindNavigation2D_get_edge_connection_margin
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "get_edge_connection_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This value is used to detect the near edges to connect compatible regions.
get_edge_connection_margin ::
                             (Navigation2D :< cls, Object :< cls) => cls -> IO Float
get_edge_connection_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_get_edge_connection_margin
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2D "get_edge_connection_margin" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Navigation2D.get_edge_connection_margin

{-# NOINLINE bindNavigation2D_get_navigation_layers #-}

-- | A bitfield determining all navigation map layers the navigation can use on a @method Navigation2D.get_simple_path@ path query.
bindNavigation2D_get_navigation_layers :: MethodBind
bindNavigation2D_get_navigation_layers
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "get_navigation_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A bitfield determining all navigation map layers the navigation can use on a @method Navigation2D.get_simple_path@ path query.
get_navigation_layers ::
                        (Navigation2D :< cls, Object :< cls) => cls -> IO Int
get_navigation_layers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_get_navigation_layers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2D "get_navigation_layers" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.Navigation2D.get_navigation_layers

{-# NOINLINE bindNavigation2D_get_rid #-}

-- | Returns the object's @RID@.
bindNavigation2D_get_rid :: MethodBind
bindNavigation2D_get_rid
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "get_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's @RID@.
get_rid :: (Navigation2D :< cls, Object :< cls) => cls -> IO Rid
get_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_get_rid (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2D "get_rid" '[] (IO Rid) where
        nodeMethod = Godot.Core.Navigation2D.get_rid

{-# NOINLINE bindNavigation2D_get_simple_path #-}

-- | @i@Deprecated.@/i@ @Navigation2D@ node and @method get_simple_path@ are deprecated and will be removed in a future version. Use @method Navigation2DServer.map_get_path@ instead.
--   				Returns the path between two given points. Points are in local coordinate space. If @optimize@ is @true@ (the default), the path is smoothed by merging path segments where possible.
bindNavigation2D_get_simple_path :: MethodBind
bindNavigation2D_get_simple_path
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "get_simple_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @i@Deprecated.@/i@ @Navigation2D@ node and @method get_simple_path@ are deprecated and will be removed in a future version. Use @method Navigation2DServer.map_get_path@ instead.
--   				Returns the path between two given points. Points are in local coordinate space. If @optimize@ is @true@ (the default), the path is smoothed by merging path segments where possible.
get_simple_path ::
                  (Navigation2D :< cls, Object :< cls) =>
                  cls -> Vector2 -> Vector2 -> Maybe Bool -> IO PoolVector2Array
get_simple_path cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool True) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_get_simple_path
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2D "get_simple_path"
           '[Vector2, Vector2, Maybe Bool]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.Navigation2D.get_simple_path

{-# NOINLINE bindNavigation2D_set_cell_size #-}

-- | The XY plane cell size to use for fields.
bindNavigation2D_set_cell_size :: MethodBind
bindNavigation2D_set_cell_size
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "set_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The XY plane cell size to use for fields.
set_cell_size ::
                (Navigation2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_cell_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_set_cell_size (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2D "set_cell_size" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Navigation2D.set_cell_size

{-# NOINLINE bindNavigation2D_set_edge_connection_margin #-}

-- | This value is used to detect the near edges to connect compatible regions.
bindNavigation2D_set_edge_connection_margin :: MethodBind
bindNavigation2D_set_edge_connection_margin
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "set_edge_connection_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This value is used to detect the near edges to connect compatible regions.
set_edge_connection_margin ::
                             (Navigation2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_edge_connection_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_set_edge_connection_margin
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2D "set_edge_connection_margin"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2D.set_edge_connection_margin

{-# NOINLINE bindNavigation2D_set_navigation_layers #-}

-- | A bitfield determining all navigation map layers the navigation can use on a @method Navigation2D.get_simple_path@ path query.
bindNavigation2D_set_navigation_layers :: MethodBind
bindNavigation2D_set_navigation_layers
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "set_navigation_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A bitfield determining all navigation map layers the navigation can use on a @method Navigation2D.get_simple_path@ path query.
set_navigation_layers ::
                        (Navigation2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_navigation_layers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_set_navigation_layers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation2D "set_navigation_layers" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2D.set_navigation_layers