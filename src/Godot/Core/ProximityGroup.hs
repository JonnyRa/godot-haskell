{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ProximityGroup
       (Godot.Core.ProximityGroup._MODE_SIGNAL,
        Godot.Core.ProximityGroup._MODE_PROXY,
        Godot.Core.ProximityGroup.sig_broadcast,
        Godot.Core.ProximityGroup._proximity_group_broadcast,
        Godot.Core.ProximityGroup.broadcast,
        Godot.Core.ProximityGroup.get_dispatch_mode,
        Godot.Core.ProximityGroup.get_grid_radius,
        Godot.Core.ProximityGroup.get_group_name,
        Godot.Core.ProximityGroup.set_dispatch_mode,
        Godot.Core.ProximityGroup.set_grid_radius,
        Godot.Core.ProximityGroup.set_group_name)
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

_MODE_SIGNAL :: Int
_MODE_SIGNAL = 1

_MODE_PROXY :: Int
_MODE_PROXY = 0

-- | Emitted when the user calls the @method broadcast@ method and has set @dispatch_mode@ to @MODE_SIGNAL@.
--   				The given method and its parameters are passed on to the listeners who connected to this signal of this object, as well as any @ProximityGroup@ node this node is grouped together with.
--   				__Note:__ This signal is @i@not@/i@ emitted by default, as the default @dispatch_mode@ is @MODE_PROXY@.
sig_broadcast :: Godot.Internal.Dispatch.Signal ProximityGroup
sig_broadcast = Godot.Internal.Dispatch.Signal "broadcast"

instance NodeSignal ProximityGroup "broadcast"
           '[GodotString, Array]

instance NodeProperty ProximityGroup "dispatch_mode" Int 'False
         where
        nodeProperty
          = (get_dispatch_mode, wrapDroppingSetter set_dispatch_mode,
             Nothing)

instance NodeProperty ProximityGroup "grid_radius" Vector3 'False
         where
        nodeProperty
          = (get_grid_radius, wrapDroppingSetter set_grid_radius, Nothing)

instance NodeProperty ProximityGroup "group_name" GodotString
           'False
         where
        nodeProperty
          = (get_group_name, wrapDroppingSetter set_group_name, Nothing)

{-# NOINLINE bindProximityGroup__proximity_group_broadcast #-}

bindProximityGroup__proximity_group_broadcast :: MethodBind
bindProximityGroup__proximity_group_broadcast
  = unsafePerformIO $
      withCString "ProximityGroup" $
        \ clsNamePtr ->
          withCString "_proximity_group_broadcast" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_proximity_group_broadcast ::
                             (ProximityGroup :< cls, Object :< cls) =>
                             cls -> GodotString -> GodotVariant -> IO ()
_proximity_group_broadcast cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindProximityGroup__proximity_group_broadcast
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ProximityGroup "_proximity_group_broadcast"
           '[GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.ProximityGroup._proximity_group_broadcast

{-# NOINLINE bindProximityGroup_broadcast #-}

-- | Calls on all intersecting @ProximityGroup@ the given method and parameters.
--   				If the @dispatch_mode@ is set to @MODE_PROXY@ (the default), all calls are delegated to their respective parent @Node@.
bindProximityGroup_broadcast :: MethodBind
bindProximityGroup_broadcast
  = unsafePerformIO $
      withCString "ProximityGroup" $
        \ clsNamePtr ->
          withCString "broadcast" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls on all intersecting @ProximityGroup@ the given method and parameters.
--   				If the @dispatch_mode@ is set to @MODE_PROXY@ (the default), all calls are delegated to their respective parent @Node@.
broadcast ::
            (ProximityGroup :< cls, Object :< cls) =>
            cls -> GodotString -> GodotVariant -> IO ()
broadcast cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProximityGroup_broadcast (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ProximityGroup "broadcast"
           '[GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.ProximityGroup.broadcast

{-# NOINLINE bindProximityGroup_get_dispatch_mode #-}

-- | Specifies which node gets contacted on a call of method @method broadcast@.
bindProximityGroup_get_dispatch_mode :: MethodBind
bindProximityGroup_get_dispatch_mode
  = unsafePerformIO $
      withCString "ProximityGroup" $
        \ clsNamePtr ->
          withCString "get_dispatch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies which node gets contacted on a call of method @method broadcast@.
get_dispatch_mode ::
                    (ProximityGroup :< cls, Object :< cls) => cls -> IO Int
get_dispatch_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProximityGroup_get_dispatch_mode
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ProximityGroup "get_dispatch_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ProximityGroup.get_dispatch_mode

{-# NOINLINE bindProximityGroup_get_grid_radius #-}

-- | The size of the space in 3D units. This also sets the amount of coordinates required to calculate whether two @ProximityGroup@ nodes are intersecting or not. Smaller @grid_radius@ values can be used for more precise proximity checks at the cost of performance, since more groups will be created.
bindProximityGroup_get_grid_radius :: MethodBind
bindProximityGroup_get_grid_radius
  = unsafePerformIO $
      withCString "ProximityGroup" $
        \ clsNamePtr ->
          withCString "get_grid_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the space in 3D units. This also sets the amount of coordinates required to calculate whether two @ProximityGroup@ nodes are intersecting or not. Smaller @grid_radius@ values can be used for more precise proximity checks at the cost of performance, since more groups will be created.
get_grid_radius ::
                  (ProximityGroup :< cls, Object :< cls) => cls -> IO Vector3
get_grid_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProximityGroup_get_grid_radius
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ProximityGroup "get_grid_radius" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.ProximityGroup.get_grid_radius

{-# NOINLINE bindProximityGroup_get_group_name #-}

-- | Specify the common group name, to let other @ProximityGroup@ nodes know, if they should be auto-grouped with this node in case they intersect with each other.
--   			For example, if you have a @ProximityGroup@ node named @"Earth"@ and another called @"Mars"@, with both nodes having @"planet"@ as their @group_name@. Give both planets a significantly larger @grid_radius@ than their actual radius, position them close enough and they'll be automatically grouped.
bindProximityGroup_get_group_name :: MethodBind
bindProximityGroup_get_group_name
  = unsafePerformIO $
      withCString "ProximityGroup" $
        \ clsNamePtr ->
          withCString "get_group_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specify the common group name, to let other @ProximityGroup@ nodes know, if they should be auto-grouped with this node in case they intersect with each other.
--   			For example, if you have a @ProximityGroup@ node named @"Earth"@ and another called @"Mars"@, with both nodes having @"planet"@ as their @group_name@. Give both planets a significantly larger @grid_radius@ than their actual radius, position them close enough and they'll be automatically grouped.
get_group_name ::
                 (ProximityGroup :< cls, Object :< cls) => cls -> IO GodotString
get_group_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProximityGroup_get_group_name
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ProximityGroup "get_group_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.ProximityGroup.get_group_name

{-# NOINLINE bindProximityGroup_set_dispatch_mode #-}

-- | Specifies which node gets contacted on a call of method @method broadcast@.
bindProximityGroup_set_dispatch_mode :: MethodBind
bindProximityGroup_set_dispatch_mode
  = unsafePerformIO $
      withCString "ProximityGroup" $
        \ clsNamePtr ->
          withCString "set_dispatch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies which node gets contacted on a call of method @method broadcast@.
set_dispatch_mode ::
                    (ProximityGroup :< cls, Object :< cls) => cls -> Int -> IO ()
set_dispatch_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProximityGroup_set_dispatch_mode
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ProximityGroup "set_dispatch_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.ProximityGroup.set_dispatch_mode

{-# NOINLINE bindProximityGroup_set_grid_radius #-}

-- | The size of the space in 3D units. This also sets the amount of coordinates required to calculate whether two @ProximityGroup@ nodes are intersecting or not. Smaller @grid_radius@ values can be used for more precise proximity checks at the cost of performance, since more groups will be created.
bindProximityGroup_set_grid_radius :: MethodBind
bindProximityGroup_set_grid_radius
  = unsafePerformIO $
      withCString "ProximityGroup" $
        \ clsNamePtr ->
          withCString "set_grid_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the space in 3D units. This also sets the amount of coordinates required to calculate whether two @ProximityGroup@ nodes are intersecting or not. Smaller @grid_radius@ values can be used for more precise proximity checks at the cost of performance, since more groups will be created.
set_grid_radius ::
                  (ProximityGroup :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_grid_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProximityGroup_set_grid_radius
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ProximityGroup "set_grid_radius" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.ProximityGroup.set_grid_radius

{-# NOINLINE bindProximityGroup_set_group_name #-}

-- | Specify the common group name, to let other @ProximityGroup@ nodes know, if they should be auto-grouped with this node in case they intersect with each other.
--   			For example, if you have a @ProximityGroup@ node named @"Earth"@ and another called @"Mars"@, with both nodes having @"planet"@ as their @group_name@. Give both planets a significantly larger @grid_radius@ than their actual radius, position them close enough and they'll be automatically grouped.
bindProximityGroup_set_group_name :: MethodBind
bindProximityGroup_set_group_name
  = unsafePerformIO $
      withCString "ProximityGroup" $
        \ clsNamePtr ->
          withCString "set_group_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specify the common group name, to let other @ProximityGroup@ nodes know, if they should be auto-grouped with this node in case they intersect with each other.
--   			For example, if you have a @ProximityGroup@ node named @"Earth"@ and another called @"Mars"@, with both nodes having @"planet"@ as their @group_name@. Give both planets a significantly larger @grid_radius@ than their actual radius, position them close enough and they'll be automatically grouped.
set_group_name ::
                 (ProximityGroup :< cls, Object :< cls) =>
                 cls -> GodotString -> IO ()
set_group_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProximityGroup_set_group_name
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod ProximityGroup "set_group_name" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.ProximityGroup.set_group_name