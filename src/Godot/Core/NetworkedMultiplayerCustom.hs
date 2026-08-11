{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NetworkedMultiplayerCustom
       (Godot.Core.NetworkedMultiplayerCustom.sig_packet_generated,
        Godot.Core.NetworkedMultiplayerCustom.deliver_packet,
        Godot.Core.NetworkedMultiplayerCustom.initialize,
        Godot.Core.NetworkedMultiplayerCustom.set_connection_status,
        Godot.Core.NetworkedMultiplayerCustom.set_max_packet_size)
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
import Godot.Core.NetworkedMultiplayerPeer()

-- | Emitted when the local @MultiplayerAPI@ generates a packet (e.g. when calling @method Node.rpc@).
--   				Your script should take this packet and send it to the requested peer over the network (which should call @method deliver_packet@ with the data when it's received).
sig_packet_generated ::
                     Godot.Internal.Dispatch.Signal NetworkedMultiplayerCustom
sig_packet_generated
  = Godot.Internal.Dispatch.Signal "packet_generated"

instance NodeSignal NetworkedMultiplayerCustom "packet_generated"
           '[Int, PoolByteArray, Int]

{-# NOINLINE bindNetworkedMultiplayerCustom_deliver_packet #-}

-- | Deliver a packet to the local @MultiplayerAPI@.
--   				When your script receives a packet from other peers over the network (originating from the @signal packet_generated@ signal on the sending peer), passing it to this method will deliver it locally.
bindNetworkedMultiplayerCustom_deliver_packet :: MethodBind
bindNetworkedMultiplayerCustom_deliver_packet
  = unsafePerformIO $
      withCString "NetworkedMultiplayerCustom" $
        \ clsNamePtr ->
          withCString "deliver_packet" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deliver a packet to the local @MultiplayerAPI@.
--   				When your script receives a packet from other peers over the network (originating from the @signal packet_generated@ signal on the sending peer), passing it to this method will deliver it locally.
deliver_packet ::
                 (NetworkedMultiplayerCustom :< cls, Object :< cls) =>
                 cls -> PoolByteArray -> Int -> IO ()
deliver_packet cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerCustom_deliver_packet
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NetworkedMultiplayerCustom "deliver_packet"
           '[PoolByteArray, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.NetworkedMultiplayerCustom.deliver_packet

{-# NOINLINE bindNetworkedMultiplayerCustom_initialize #-}

-- | Initialize the peer with the given @self_peer_id@ (must be between 1 and 2147483647).
--   				Can only be called if the connection status is @NetworkedMultiplayerPeer.CONNECTION_CONNECTING@. See @method set_connection_status@.
bindNetworkedMultiplayerCustom_initialize :: MethodBind
bindNetworkedMultiplayerCustom_initialize
  = unsafePerformIO $
      withCString "NetworkedMultiplayerCustom" $
        \ clsNamePtr ->
          withCString "initialize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initialize the peer with the given @self_peer_id@ (must be between 1 and 2147483647).
--   				Can only be called if the connection status is @NetworkedMultiplayerPeer.CONNECTION_CONNECTING@. See @method set_connection_status@.
initialize ::
             (NetworkedMultiplayerCustom :< cls, Object :< cls) =>
             cls -> Int -> IO ()
initialize cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNetworkedMultiplayerCustom_initialize
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NetworkedMultiplayerCustom "initialize" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.NetworkedMultiplayerCustom.initialize

{-# NOINLINE bindNetworkedMultiplayerCustom_set_connection_status
             #-}

-- | Set the state of the connection. See @enum NetworkedMultiplayerPeer.ConnectionStatus@.
--   				This will emit the @signal NetworkedMultiplayerPeer.connection_succeeded@, @signal NetworkedMultiplayerPeer.connection_failed@ or @signal NetworkedMultiplayerPeer.server_disconnected@ signals depending on the status and if the peer has the unique network id of @1@.
--   				You can only change to @NetworkedMultiplayerPeer.CONNECTION_CONNECTING@ from @NetworkedMultiplayerPeer.CONNECTION_DISCONNECTED@ and to @NetworkedMultiplayerPeer.CONNECTION_CONNECTED@ from @NetworkedMultiplayerPeer.CONNECTION_CONNECTING@.
bindNetworkedMultiplayerCustom_set_connection_status :: MethodBind
bindNetworkedMultiplayerCustom_set_connection_status
  = unsafePerformIO $
      withCString "NetworkedMultiplayerCustom" $
        \ clsNamePtr ->
          withCString "set_connection_status" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the state of the connection. See @enum NetworkedMultiplayerPeer.ConnectionStatus@.
--   				This will emit the @signal NetworkedMultiplayerPeer.connection_succeeded@, @signal NetworkedMultiplayerPeer.connection_failed@ or @signal NetworkedMultiplayerPeer.server_disconnected@ signals depending on the status and if the peer has the unique network id of @1@.
--   				You can only change to @NetworkedMultiplayerPeer.CONNECTION_CONNECTING@ from @NetworkedMultiplayerPeer.CONNECTION_DISCONNECTED@ and to @NetworkedMultiplayerPeer.CONNECTION_CONNECTED@ from @NetworkedMultiplayerPeer.CONNECTION_CONNECTING@.
set_connection_status ::
                        (NetworkedMultiplayerCustom :< cls, Object :< cls) =>
                        cls -> Int -> IO ()
set_connection_status cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerCustom_set_connection_status
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NetworkedMultiplayerCustom
           "set_connection_status"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.NetworkedMultiplayerCustom.set_connection_status

{-# NOINLINE bindNetworkedMultiplayerCustom_set_max_packet_size #-}

-- | Set the max packet size that this peer can handle.
bindNetworkedMultiplayerCustom_set_max_packet_size :: MethodBind
bindNetworkedMultiplayerCustom_set_max_packet_size
  = unsafePerformIO $
      withCString "NetworkedMultiplayerCustom" $
        \ clsNamePtr ->
          withCString "set_max_packet_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the max packet size that this peer can handle.
set_max_packet_size ::
                      (NetworkedMultiplayerCustom :< cls, Object :< cls) =>
                      cls -> Int -> IO ()
set_max_packet_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerCustom_set_max_packet_size
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NetworkedMultiplayerCustom
           "set_max_packet_size"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.NetworkedMultiplayerCustom.set_max_packet_size