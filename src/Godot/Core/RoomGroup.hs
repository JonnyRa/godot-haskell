{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.RoomGroup
       (Godot.Core.RoomGroup.get_roomgroup_priority,
        Godot.Core.RoomGroup.set_roomgroup_priority)
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

instance NodeProperty RoomGroup "roomgroup_priority" Int 'False
         where
        nodeProperty
          = (get_roomgroup_priority,
             wrapDroppingSetter set_roomgroup_priority, Nothing)

{-# NOINLINE bindRoomGroup_get_roomgroup_priority #-}

-- | This priority will be applied to @Room@s within the group. The @Room@ priority allows the use of __internal rooms__, rooms @i@within@/i@ another room or rooms.
--   			When the @Camera@ is within more than one room (regular and internal), the higher priority room will take precedence. So with for example, a house inside a terrain 'room', you would make the house higher priority, so that when the camera is within the house, the house is used as the source room, but outside the house, the terrain room would be used instead.
bindRoomGroup_get_roomgroup_priority :: MethodBind
bindRoomGroup_get_roomgroup_priority
  = unsafePerformIO $
      withCString "RoomGroup" $
        \ clsNamePtr ->
          withCString "get_roomgroup_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This priority will be applied to @Room@s within the group. The @Room@ priority allows the use of __internal rooms__, rooms @i@within@/i@ another room or rooms.
--   			When the @Camera@ is within more than one room (regular and internal), the higher priority room will take precedence. So with for example, a house inside a terrain 'room', you would make the house higher priority, so that when the camera is within the house, the house is used as the source room, but outside the house, the terrain room would be used instead.
get_roomgroup_priority ::
                         (RoomGroup :< cls, Object :< cls) => cls -> IO Int
get_roomgroup_priority cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomGroup_get_roomgroup_priority
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomGroup "get_roomgroup_priority" '[] (IO Int)
         where
        nodeMethod = Godot.Core.RoomGroup.get_roomgroup_priority

{-# NOINLINE bindRoomGroup_set_roomgroup_priority #-}

-- | This priority will be applied to @Room@s within the group. The @Room@ priority allows the use of __internal rooms__, rooms @i@within@/i@ another room or rooms.
--   			When the @Camera@ is within more than one room (regular and internal), the higher priority room will take precedence. So with for example, a house inside a terrain 'room', you would make the house higher priority, so that when the camera is within the house, the house is used as the source room, but outside the house, the terrain room would be used instead.
bindRoomGroup_set_roomgroup_priority :: MethodBind
bindRoomGroup_set_roomgroup_priority
  = unsafePerformIO $
      withCString "RoomGroup" $
        \ clsNamePtr ->
          withCString "set_roomgroup_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This priority will be applied to @Room@s within the group. The @Room@ priority allows the use of __internal rooms__, rooms @i@within@/i@ another room or rooms.
--   			When the @Camera@ is within more than one room (regular and internal), the higher priority room will take precedence. So with for example, a house inside a terrain 'room', you would make the house higher priority, so that when the camera is within the house, the house is used as the source room, but outside the house, the terrain room would be used instead.
set_roomgroup_priority ::
                         (RoomGroup :< cls, Object :< cls) => cls -> Int -> IO ()
set_roomgroup_priority cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRoomGroup_set_roomgroup_priority
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod RoomGroup "set_roomgroup_priority" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.RoomGroup.set_roomgroup_priority