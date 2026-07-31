{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.HMACContext
       (Godot.Core.HMACContext.finish, Godot.Core.HMACContext.start,
        Godot.Core.HMACContext.update)
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

{-# NOINLINE bindHMACContext_finish #-}

-- | Returns the resulting HMAC. If the HMAC failed, an empty @PoolByteArray@ is returned.
bindHMACContext_finish :: MethodBind
bindHMACContext_finish
  = unsafePerformIO $
      withCString "HMACContext" $
        \ clsNamePtr ->
          withCString "finish" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the resulting HMAC. If the HMAC failed, an empty @PoolByteArray@ is returned.
finish ::
         (HMACContext :< cls, Object :< cls) => cls -> IO PoolByteArray
finish cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHMACContext_finish (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod HMACContext "finish" '[] (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.HMACContext.finish

{-# NOINLINE bindHMACContext_start #-}

-- | Initializes the HMACContext. This method cannot be called again on the same HMACContext until @method finish@ has been called.
bindHMACContext_start :: MethodBind
bindHMACContext_start
  = unsafePerformIO $
      withCString "HMACContext" $
        \ clsNamePtr ->
          withCString "start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initializes the HMACContext. This method cannot be called again on the same HMACContext until @method finish@ has been called.
start ::
        (HMACContext :< cls, Object :< cls) =>
        cls -> Int -> PoolByteArray -> IO Int
start cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHMACContext_start (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod HMACContext "start" '[Int, PoolByteArray]
           (IO Int)
         where
        nodeMethod = Godot.Core.HMACContext.start

{-# NOINLINE bindHMACContext_update #-}

-- | Updates the message to be HMACed. This can be called multiple times before @method finish@ is called to append @data@ to the message, but cannot be called until @method start@ has been called.
bindHMACContext_update :: MethodBind
bindHMACContext_update
  = unsafePerformIO $
      withCString "HMACContext" $
        \ clsNamePtr ->
          withCString "update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Updates the message to be HMACed. This can be called multiple times before @method finish@ is called to append @data@ to the message, but cannot be called until @method start@ has been called.
update ::
         (HMACContext :< cls, Object :< cls) =>
         cls -> PoolByteArray -> IO Int
update cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHMACContext_update (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod HMACContext "update" '[PoolByteArray] (IO Int)
         where
        nodeMethod = Godot.Core.HMACContext.update