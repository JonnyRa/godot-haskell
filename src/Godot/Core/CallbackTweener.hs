{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CallbackTweener
       (Godot.Core.CallbackTweener.set_delay) where
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
import Godot.Core.Tweener()

{-# NOINLINE bindCallbackTweener_set_delay #-}

-- | Makes the callback call delayed by given time in seconds. Example:
--   				
--   @
--   
--   				var tween = get_tree().create_tween()
--   				tween.tween_callback(queue_free).set_delay(2) #this will call queue_free() after 2 seconds
--   				
--   @
bindCallbackTweener_set_delay :: MethodBind
bindCallbackTweener_set_delay
  = unsafePerformIO $
      withCString "CallbackTweener" $
        \ clsNamePtr ->
          withCString "set_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Makes the callback call delayed by given time in seconds. Example:
--   				
--   @
--   
--   				var tween = get_tree().create_tween()
--   				tween.tween_callback(queue_free).set_delay(2) #this will call queue_free() after 2 seconds
--   				
--   @
set_delay ::
            (CallbackTweener :< cls, Object :< cls) =>
            cls -> Float -> IO CallbackTweener
set_delay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCallbackTweener_set_delay (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod CallbackTweener "set_delay" '[Float]
           (IO CallbackTweener)
         where
        nodeMethod = Godot.Core.CallbackTweener.set_delay