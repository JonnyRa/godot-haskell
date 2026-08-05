{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AESContext
       (Godot.Core.AESContext._MODE_CBC_DECRYPT,
        Godot.Core.AESContext._MODE_MAX,
        Godot.Core.AESContext._MODE_ECB_ENCRYPT,
        Godot.Core.AESContext._MODE_CBC_ENCRYPT,
        Godot.Core.AESContext._MODE_ECB_DECRYPT,
        Godot.Core.AESContext.finish, Godot.Core.AESContext.get_iv_state,
        Godot.Core.AESContext.start, Godot.Core.AESContext.update)
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
import Godot.Core.Reference()

_MODE_CBC_DECRYPT :: Int
_MODE_CBC_DECRYPT = 3

_MODE_MAX :: Int
_MODE_MAX = 4

_MODE_ECB_ENCRYPT :: Int
_MODE_ECB_ENCRYPT = 0

_MODE_CBC_ENCRYPT :: Int
_MODE_CBC_ENCRYPT = 2

_MODE_ECB_DECRYPT :: Int
_MODE_ECB_DECRYPT = 1

{-# NOINLINE bindAESContext_finish #-}

-- | Close this AES context so it can be started again. See @method start@.
bindAESContext_finish :: MethodBind
bindAESContext_finish
  = unsafePerformIO $
      withCString "AESContext" $
        \ clsNamePtr ->
          withCString "finish" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Close this AES context so it can be started again. See @method start@.
finish :: (AESContext :< cls, Object :< cls) => cls -> IO ()
finish cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAESContext_finish (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod AESContext "finish" '[] (IO ()) where
        nodeMethod = Godot.Core.AESContext.finish

{-# NOINLINE bindAESContext_get_iv_state #-}

-- | Get the current IV state for this context (IV gets updated when calling @method update@). You normally don't need this function.
--   				__Note:__ This function only makes sense when the context is started with @MODE_CBC_ENCRYPT@ or @MODE_CBC_DECRYPT@.
bindAESContext_get_iv_state :: MethodBind
bindAESContext_get_iv_state
  = unsafePerformIO $
      withCString "AESContext" $
        \ clsNamePtr ->
          withCString "get_iv_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the current IV state for this context (IV gets updated when calling @method update@). You normally don't need this function.
--   				__Note:__ This function only makes sense when the context is started with @MODE_CBC_ENCRYPT@ or @MODE_CBC_DECRYPT@.
get_iv_state ::
               (AESContext :< cls, Object :< cls) => cls -> IO PoolByteArray
get_iv_state cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAESContext_get_iv_state (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod AESContext "get_iv_state" '[]
           (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.AESContext.get_iv_state

{-# NOINLINE bindAESContext_start #-}

-- | Start the AES context in the given @mode@. A @key@ of either 16 or 32 bytes must always be provided, while an @iv@ (initialization vector) of exactly 16 bytes, is only needed when @mode@ is either @MODE_CBC_ENCRYPT@ or @MODE_CBC_DECRYPT@.
bindAESContext_start :: MethodBind
bindAESContext_start
  = unsafePerformIO $
      withCString "AESContext" $
        \ clsNamePtr ->
          withCString "start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Start the AES context in the given @mode@. A @key@ of either 16 or 32 bytes must always be provided, while an @iv@ (initialization vector) of exactly 16 bytes, is only needed when @mode@ is either @MODE_CBC_ENCRYPT@ or @MODE_CBC_DECRYPT@.
start ::
        (AESContext :< cls, Object :< cls) =>
        cls -> Int -> PoolByteArray -> Maybe PoolByteArray -> IO Int
start cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantPoolByteArray V.empty arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAESContext_start (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod AESContext "start"
           '[Int, PoolByteArray, Maybe PoolByteArray]
           (IO Int)
         where
        nodeMethod = Godot.Core.AESContext.start

{-# NOINLINE bindAESContext_update #-}

-- | Run the desired operation for this AES context. Will return a @PoolByteArray@ containing the result of encrypting (or decrypting) the given @src@. See @method start@ for mode of operation.
--   				__Note:__ The size of @src@ must be a multiple of 16. Apply some padding if needed.
bindAESContext_update :: MethodBind
bindAESContext_update
  = unsafePerformIO $
      withCString "AESContext" $
        \ clsNamePtr ->
          withCString "update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Run the desired operation for this AES context. Will return a @PoolByteArray@ containing the result of encrypting (or decrypting) the given @src@. See @method start@ for mode of operation.
--   				__Note:__ The size of @src@ must be a multiple of 16. Apply some padding if needed.
update ::
         (AESContext :< cls, Object :< cls) =>
         cls -> PoolByteArray -> IO PoolByteArray
update cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAESContext_update (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod AESContext "update" '[PoolByteArray]
           (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.AESContext.update