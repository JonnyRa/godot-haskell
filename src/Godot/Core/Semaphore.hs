{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Semaphore
       (Godot.Core.Semaphore.post, Godot.Core.Semaphore.try_wait,
        Godot.Core.Semaphore.wait)
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

{-# NOINLINE bindSemaphore_post #-}

-- | Lowers the @Semaphore@, allowing one more thread in.
--   				__Note:__ This method internals' can't possibly fail, but an error code is returned for backwards compatibility, which will always be @OK@.
bindSemaphore_post :: MethodBind
bindSemaphore_post
  = unsafePerformIO $
      withCString "_Semaphore" $
        \ clsNamePtr ->
          withCString "post" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Lowers the @Semaphore@, allowing one more thread in.
--   				__Note:__ This method internals' can't possibly fail, but an error code is returned for backwards compatibility, which will always be @OK@.
post :: (Semaphore :< cls, Object :< cls) => cls -> IO Int
post cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSemaphore_post (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Semaphore "post" '[] (IO Int) where
        nodeMethod = Godot.Core.Semaphore.post

{-# NOINLINE bindSemaphore_try_wait #-}

-- | Like @method wait@, but won't block, so if the value is zero, fails immediately and returns @ERR_BUSY@. If non-zero, it returns @OK@ to report success.
bindSemaphore_try_wait :: MethodBind
bindSemaphore_try_wait
  = unsafePerformIO $
      withCString "_Semaphore" $
        \ clsNamePtr ->
          withCString "try_wait" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Like @method wait@, but won't block, so if the value is zero, fails immediately and returns @ERR_BUSY@. If non-zero, it returns @OK@ to report success.
try_wait :: (Semaphore :< cls, Object :< cls) => cls -> IO Int
try_wait cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSemaphore_try_wait (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Semaphore "try_wait" '[] (IO Int) where
        nodeMethod = Godot.Core.Semaphore.try_wait

{-# NOINLINE bindSemaphore_wait #-}

-- | Waits for the @Semaphore@, if its value is zero, blocks until non-zero.
--   				__Note:__ This method internals' can't possibly fail, but an error code is returned for backwards compatibility, which will always be @OK@.
bindSemaphore_wait :: MethodBind
bindSemaphore_wait
  = unsafePerformIO $
      withCString "_Semaphore" $
        \ clsNamePtr ->
          withCString "wait" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Waits for the @Semaphore@, if its value is zero, blocks until non-zero.
--   				__Note:__ This method internals' can't possibly fail, but an error code is returned for backwards compatibility, which will always be @OK@.
wait :: (Semaphore :< cls, Object :< cls) => cls -> IO Int
wait cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSemaphore_wait (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Semaphore "wait" '[] (IO Int) where
        nodeMethod = Godot.Core.Semaphore.wait