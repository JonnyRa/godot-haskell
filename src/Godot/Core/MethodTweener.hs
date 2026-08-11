{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.MethodTweener
       (Godot.Core.MethodTweener.set_delay,
        Godot.Core.MethodTweener.set_ease,
        Godot.Core.MethodTweener.set_trans)
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
import Godot.Core.Tweener()

{-# NOINLINE bindMethodTweener_set_delay #-}

-- | Sets the time in seconds after which the @MethodTweener@ will start interpolating. By default there's no delay.
bindMethodTweener_set_delay :: MethodBind
bindMethodTweener_set_delay
  = unsafePerformIO $
      withCString "MethodTweener" $
        \ clsNamePtr ->
          withCString "set_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the time in seconds after which the @MethodTweener@ will start interpolating. By default there's no delay.
set_delay ::
            (MethodTweener :< cls, Object :< cls) =>
            cls -> Float -> IO MethodTweener
set_delay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMethodTweener_set_delay (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod MethodTweener "set_delay" '[Float]
           (IO MethodTweener)
         where
        nodeMethod = Godot.Core.MethodTweener.set_delay

{-# NOINLINE bindMethodTweener_set_ease #-}

-- | Sets the type of used easing from @enum Tween.EaseType@. If not set, the default easing is used from the @SceneTreeTween@ that contains this Tweener.
bindMethodTweener_set_ease :: MethodBind
bindMethodTweener_set_ease
  = unsafePerformIO $
      withCString "MethodTweener" $
        \ clsNamePtr ->
          withCString "set_ease" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the type of used easing from @enum Tween.EaseType@. If not set, the default easing is used from the @SceneTreeTween@ that contains this Tweener.
set_ease ::
           (MethodTweener :< cls, Object :< cls) =>
           cls -> Int -> IO MethodTweener
set_ease cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMethodTweener_set_ease (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod MethodTweener "set_ease" '[Int]
           (IO MethodTweener)
         where
        nodeMethod = Godot.Core.MethodTweener.set_ease

{-# NOINLINE bindMethodTweener_set_trans #-}

-- | Sets the type of used transition from @enum Tween.TransitionType@. If not set, the default transition is used from the @SceneTreeTween@ that contains this Tweener.
bindMethodTweener_set_trans :: MethodBind
bindMethodTweener_set_trans
  = unsafePerformIO $
      withCString "MethodTweener" $
        \ clsNamePtr ->
          withCString "set_trans" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the type of used transition from @enum Tween.TransitionType@. If not set, the default transition is used from the @SceneTreeTween@ that contains this Tweener.
set_trans ::
            (MethodTweener :< cls, Object :< cls) =>
            cls -> Int -> IO MethodTweener
set_trans cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMethodTweener_set_trans (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod MethodTweener "set_trans" '[Int]
           (IO MethodTweener)
         where
        nodeMethod = Godot.Core.MethodTweener.set_trans