{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Navigation
       (Godot.Core.Navigation.sig_map_changed,
        Godot.Core.Navigation.get_cell_height,
        Godot.Core.Navigation.get_cell_size,
        Godot.Core.Navigation.get_closest_point,
        Godot.Core.Navigation.get_closest_point_normal,
        Godot.Core.Navigation.get_closest_point_owner,
        Godot.Core.Navigation.get_closest_point_to_segment,
        Godot.Core.Navigation.get_edge_connection_margin,
        Godot.Core.Navigation.get_navigation_layers,
        Godot.Core.Navigation.get_rid,
        Godot.Core.Navigation.get_simple_path,
        Godot.Core.Navigation.get_up_vector,
        Godot.Core.Navigation.set_cell_height,
        Godot.Core.Navigation.set_cell_size,
        Godot.Core.Navigation.set_edge_connection_margin,
        Godot.Core.Navigation.set_navigation_layers,
        Godot.Core.Navigation.set_up_vector)
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

-- | Emitted when a navigation map is updated, when a region moves or is modified.
sig_map_changed :: Godot.Internal.Dispatch.Signal Navigation
sig_map_changed = Godot.Internal.Dispatch.Signal "map_changed"

instance NodeSignal Navigation "map_changed" '[Rid]

instance NodeProperty Navigation "cell_height" Float 'False where
        nodeProperty
          = (get_cell_height, wrapDroppingSetter set_cell_height, Nothing)

instance NodeProperty Navigation "cell_size" Float 'False where
        nodeProperty
          = (get_cell_size, wrapDroppingSetter set_cell_size, Nothing)

instance NodeProperty Navigation "edge_connection_margin" Float
           'False
         where
        nodeProperty
          = (get_edge_connection_margin,
             wrapDroppingSetter set_edge_connection_margin, Nothing)

instance NodeProperty Navigation "navigation_layers" Int 'False
         where
        nodeProperty
          = (get_navigation_layers, wrapDroppingSetter set_navigation_layers,
             Nothing)

instance NodeProperty Navigation "up_vector" Vector3 'False where
        nodeProperty
          = (get_up_vector, wrapDroppingSetter set_up_vector, Nothing)

{-# NOINLINE bindNavigation_get_cell_height #-}

-- | The cell height to use for fields.
bindNavigation_get_cell_height :: MethodBind
bindNavigation_get_cell_height
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_cell_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The cell height to use for fields.
get_cell_height ::
                  (Navigation :< cls, Object :< cls) => cls -> IO Float
get_cell_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_cell_height (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation "get_cell_height" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Navigation.get_cell_height

{-# NOINLINE bindNavigation_get_cell_size #-}

-- | The XZ plane cell size to use for fields.
bindNavigation_get_cell_size :: MethodBind
bindNavigation_get_cell_size
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The XZ plane cell size to use for fields.
get_cell_size ::
                (Navigation :< cls, Object :< cls) => cls -> IO Float
get_cell_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_cell_size (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation "get_cell_size" '[] (IO Float) where
        nodeMethod = Godot.Core.Navigation.get_cell_size

{-# NOINLINE bindNavigation_get_closest_point #-}

-- | Returns the navigation point closest to the point given. Points are in local coordinate space.
bindNavigation_get_closest_point :: MethodBind
bindNavigation_get_closest_point
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_closest_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the navigation point closest to the point given. Points are in local coordinate space.
get_closest_point ::
                    (Navigation :< cls, Object :< cls) => cls -> Vector3 -> IO Vector3
get_closest_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_closest_point
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation "get_closest_point" '[Vector3]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Navigation.get_closest_point

{-# NOINLINE bindNavigation_get_closest_point_normal #-}

-- | Returns the surface normal at the navigation point closest to the point given. Useful for rotating a navigation agent according to the navigation mesh it moves on.
bindNavigation_get_closest_point_normal :: MethodBind
bindNavigation_get_closest_point_normal
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_closest_point_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the surface normal at the navigation point closest to the point given. Useful for rotating a navigation agent according to the navigation mesh it moves on.
get_closest_point_normal ::
                           (Navigation :< cls, Object :< cls) => cls -> Vector3 -> IO Vector3
get_closest_point_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_closest_point_normal
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation "get_closest_point_normal"
           '[Vector3]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Navigation.get_closest_point_normal

{-# NOINLINE bindNavigation_get_closest_point_owner #-}

-- | Returns the owner of the @NavigationMesh@ which contains the navigation point closest to the point given. This is usually a @NavigationMeshInstance@.
bindNavigation_get_closest_point_owner :: MethodBind
bindNavigation_get_closest_point_owner
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_closest_point_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the owner of the @NavigationMesh@ which contains the navigation point closest to the point given. This is usually a @NavigationMeshInstance@.
get_closest_point_owner ::
                          (Navigation :< cls, Object :< cls) => cls -> Vector3 -> IO Rid
get_closest_point_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_closest_point_owner
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation "get_closest_point_owner" '[Vector3]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Navigation.get_closest_point_owner

{-# NOINLINE bindNavigation_get_closest_point_to_segment #-}

-- | Returns the navigation point closest to the given line segment. When enabling @use_collision@, only considers intersection points between segment and navigation meshes. If multiple intersection points are found, the one closest to the segment start point is returned.
bindNavigation_get_closest_point_to_segment :: MethodBind
bindNavigation_get_closest_point_to_segment
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_closest_point_to_segment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the navigation point closest to the given line segment. When enabling @use_collision@, only considers intersection points between segment and navigation meshes. If multiple intersection points are found, the one closest to the segment start point is returned.
get_closest_point_to_segment ::
                               (Navigation :< cls, Object :< cls) =>
                               cls -> Vector3 -> Vector3 -> Maybe Bool -> IO Vector3
get_closest_point_to_segment cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool False) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_closest_point_to_segment
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation "get_closest_point_to_segment"
           '[Vector3, Vector3, Maybe Bool]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Navigation.get_closest_point_to_segment

{-# NOINLINE bindNavigation_get_edge_connection_margin #-}

-- | This value is used to detect the near edges to connect compatible regions.
bindNavigation_get_edge_connection_margin :: MethodBind
bindNavigation_get_edge_connection_margin
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_edge_connection_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This value is used to detect the near edges to connect compatible regions.
get_edge_connection_margin ::
                             (Navigation :< cls, Object :< cls) => cls -> IO Float
get_edge_connection_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_edge_connection_margin
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation "get_edge_connection_margin" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Navigation.get_edge_connection_margin

{-# NOINLINE bindNavigation_get_navigation_layers #-}

-- | A bitfield determining all navigation map layers the navigation can use on a @method Navigation.get_simple_path@ path query.
bindNavigation_get_navigation_layers :: MethodBind
bindNavigation_get_navigation_layers
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_navigation_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A bitfield determining all navigation map layers the navigation can use on a @method Navigation.get_simple_path@ path query.
get_navigation_layers ::
                        (Navigation :< cls, Object :< cls) => cls -> IO Int
get_navigation_layers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_navigation_layers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation "get_navigation_layers" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Navigation.get_navigation_layers

{-# NOINLINE bindNavigation_get_rid #-}

-- | Returns the @RID@ of the navigation map on the @NavigationServer@.
bindNavigation_get_rid :: MethodBind
bindNavigation_get_rid
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of the navigation map on the @NavigationServer@.
get_rid :: (Navigation :< cls, Object :< cls) => cls -> IO Rid
get_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_rid (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation "get_rid" '[] (IO Rid) where
        nodeMethod = Godot.Core.Navigation.get_rid

{-# NOINLINE bindNavigation_get_simple_path #-}

-- | @i@Deprecated.@/i@ @Navigation@ node and @method get_simple_path@ are deprecated and will be removed in a future version. Use @method NavigationServer.map_get_path@ instead.
--   				Returns the path between two given points. Points are in local coordinate space. If @optimize@ is @true@ (the default), the agent properties associated with each @NavigationMesh@ (radius, height, etc.) are considered in the path calculation, otherwise they are ignored.
bindNavigation_get_simple_path :: MethodBind
bindNavigation_get_simple_path
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_simple_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @i@Deprecated.@/i@ @Navigation@ node and @method get_simple_path@ are deprecated and will be removed in a future version. Use @method NavigationServer.map_get_path@ instead.
--   				Returns the path between two given points. Points are in local coordinate space. If @optimize@ is @true@ (the default), the agent properties associated with each @NavigationMesh@ (radius, height, etc.) are considered in the path calculation, otherwise they are ignored.
get_simple_path ::
                  (Navigation :< cls, Object :< cls) =>
                  cls -> Vector3 -> Vector3 -> Maybe Bool -> IO PoolVector3Array
get_simple_path cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool True) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_simple_path (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation "get_simple_path"
           '[Vector3, Vector3, Maybe Bool]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.Navigation.get_simple_path

{-# NOINLINE bindNavigation_get_up_vector #-}

-- | Defines which direction is up. By default, this is @(0, 1, 0)@, which is the world's "up" direction.
bindNavigation_get_up_vector :: MethodBind
bindNavigation_get_up_vector
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_up_vector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines which direction is up. By default, this is @(0, 1, 0)@, which is the world's "up" direction.
get_up_vector ::
                (Navigation :< cls, Object :< cls) => cls -> IO Vector3
get_up_vector cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_up_vector (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation "get_up_vector" '[] (IO Vector3)
         where
        nodeMethod = Godot.Core.Navigation.get_up_vector

{-# NOINLINE bindNavigation_set_cell_height #-}

-- | The cell height to use for fields.
bindNavigation_set_cell_height :: MethodBind
bindNavigation_set_cell_height
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "set_cell_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The cell height to use for fields.
set_cell_height ::
                  (Navigation :< cls, Object :< cls) => cls -> Float -> IO ()
set_cell_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_set_cell_height (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation "set_cell_height" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Navigation.set_cell_height

{-# NOINLINE bindNavigation_set_cell_size #-}

-- | The XZ plane cell size to use for fields.
bindNavigation_set_cell_size :: MethodBind
bindNavigation_set_cell_size
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "set_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The XZ plane cell size to use for fields.
set_cell_size ::
                (Navigation :< cls, Object :< cls) => cls -> Float -> IO ()
set_cell_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_set_cell_size (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation "set_cell_size" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Navigation.set_cell_size

{-# NOINLINE bindNavigation_set_edge_connection_margin #-}

-- | This value is used to detect the near edges to connect compatible regions.
bindNavigation_set_edge_connection_margin :: MethodBind
bindNavigation_set_edge_connection_margin
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "set_edge_connection_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This value is used to detect the near edges to connect compatible regions.
set_edge_connection_margin ::
                             (Navigation :< cls, Object :< cls) => cls -> Float -> IO ()
set_edge_connection_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_set_edge_connection_margin
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation "set_edge_connection_margin"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation.set_edge_connection_margin

{-# NOINLINE bindNavigation_set_navigation_layers #-}

-- | A bitfield determining all navigation map layers the navigation can use on a @method Navigation.get_simple_path@ path query.
bindNavigation_set_navigation_layers :: MethodBind
bindNavigation_set_navigation_layers
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "set_navigation_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A bitfield determining all navigation map layers the navigation can use on a @method Navigation.get_simple_path@ path query.
set_navigation_layers ::
                        (Navigation :< cls, Object :< cls) => cls -> Int -> IO ()
set_navigation_layers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_set_navigation_layers
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation "set_navigation_layers" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation.set_navigation_layers

{-# NOINLINE bindNavigation_set_up_vector #-}

-- | Defines which direction is up. By default, this is @(0, 1, 0)@, which is the world's "up" direction.
bindNavigation_set_up_vector :: MethodBind
bindNavigation_set_up_vector
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "set_up_vector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines which direction is up. By default, this is @(0, 1, 0)@, which is the world's "up" direction.
set_up_vector ::
                (Navigation :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_up_vector cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_set_up_vector (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Navigation "set_up_vector" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.Navigation.set_up_vector