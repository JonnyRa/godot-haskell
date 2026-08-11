{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PropertyTweener
       (Godot.Core.PropertyTweener.as_relative,
        Godot.Core.PropertyTweener.from,
        Godot.Core.PropertyTweener.from_current,
        Godot.Core.PropertyTweener.set_delay,
        Godot.Core.PropertyTweener.set_ease,
        Godot.Core.PropertyTweener.set_trans)
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

{-# NOINLINE bindPropertyTweener_as_relative #-}

-- | When called, the final value will be used as a relative value instead. Example:
--   				
--   @
--   
--   				var tween = get_tree().create_tween()
--   				tween.tween_property(self, "position", Vector2.RIGHT * 100, 1).as_relative() #the node will move by 100 pixels to the right
--   				
--   @
bindPropertyTweener_as_relative :: MethodBind
bindPropertyTweener_as_relative
  = unsafePerformIO $
      withCString "PropertyTweener" $
        \ clsNamePtr ->
          withCString "as_relative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When called, the final value will be used as a relative value instead. Example:
--   				
--   @
--   
--   				var tween = get_tree().create_tween()
--   				tween.tween_property(self, "position", Vector2.RIGHT * 100, 1).as_relative() #the node will move by 100 pixels to the right
--   				
--   @
as_relative ::
              (PropertyTweener :< cls, Object :< cls) =>
              cls -> IO PropertyTweener
as_relative cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPropertyTweener_as_relative (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod PropertyTweener "as_relative" '[]
           (IO PropertyTweener)
         where
        nodeMethod = Godot.Core.PropertyTweener.as_relative

{-# NOINLINE bindPropertyTweener_from #-}

-- | Sets a custom initial value to the @PropertyTweener@. Example:
--   				
--   @
--   
--   				var tween = get_tree().create_tween()
--   				tween.tween_property(self, "position", Vector2(200, 100), 1).from(Vector2(100, 100) #this will move the node from position (100, 100) to (200, 100)
--   				
--   @
bindPropertyTweener_from :: MethodBind
bindPropertyTweener_from
  = unsafePerformIO $
      withCString "PropertyTweener" $
        \ clsNamePtr ->
          withCString "from" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a custom initial value to the @PropertyTweener@. Example:
--   				
--   @
--   
--   				var tween = get_tree().create_tween()
--   				tween.tween_property(self, "position", Vector2(200, 100), 1).from(Vector2(100, 100) #this will move the node from position (100, 100) to (200, 100)
--   				
--   @
from ::
       (PropertyTweener :< cls, Object :< cls) =>
       cls -> GodotVariant -> IO PropertyTweener
from cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPropertyTweener_from (upcast cls) arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod PropertyTweener "from" '[GodotVariant]
           (IO PropertyTweener)
         where
        nodeMethod = Godot.Core.PropertyTweener.from

{-# NOINLINE bindPropertyTweener_from_current #-}

-- | Makes the @PropertyTweener@ use the current property value (i.e. at the time of creating this @PropertyTweener@) as a starting point. This is equivalent of using @method from@ with the current value. These two calls will do the same:
--   				
--   @
--   
--   				tween.tween_property(self, "position", Vector2(200, 100), 1).from(position)
--   				tween.tween_property(self, "position", Vector2(200, 100), 1).from_current()
--   				
--   @
bindPropertyTweener_from_current :: MethodBind
bindPropertyTweener_from_current
  = unsafePerformIO $
      withCString "PropertyTweener" $
        \ clsNamePtr ->
          withCString "from_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Makes the @PropertyTweener@ use the current property value (i.e. at the time of creating this @PropertyTweener@) as a starting point. This is equivalent of using @method from@ with the current value. These two calls will do the same:
--   				
--   @
--   
--   				tween.tween_property(self, "position", Vector2(200, 100), 1).from(position)
--   				tween.tween_property(self, "position", Vector2(200, 100), 1).from_current()
--   				
--   @
from_current ::
               (PropertyTweener :< cls, Object :< cls) =>
               cls -> IO PropertyTweener
from_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPropertyTweener_from_current
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod PropertyTweener "from_current" '[]
           (IO PropertyTweener)
         where
        nodeMethod = Godot.Core.PropertyTweener.from_current

{-# NOINLINE bindPropertyTweener_set_delay #-}

-- | Sets the time in seconds after which the @PropertyTweener@ will start interpolating. By default there's no delay.
bindPropertyTweener_set_delay :: MethodBind
bindPropertyTweener_set_delay
  = unsafePerformIO $
      withCString "PropertyTweener" $
        \ clsNamePtr ->
          withCString "set_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the time in seconds after which the @PropertyTweener@ will start interpolating. By default there's no delay.
set_delay ::
            (PropertyTweener :< cls, Object :< cls) =>
            cls -> Float -> IO PropertyTweener
set_delay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPropertyTweener_set_delay (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod PropertyTweener "set_delay" '[Float]
           (IO PropertyTweener)
         where
        nodeMethod = Godot.Core.PropertyTweener.set_delay

{-# NOINLINE bindPropertyTweener_set_ease #-}

-- | Sets the type of used easing from @enum Tween.EaseType@. If not set, the default easing is used from the @SceneTreeTween@ that contains this Tweener.
bindPropertyTweener_set_ease :: MethodBind
bindPropertyTweener_set_ease
  = unsafePerformIO $
      withCString "PropertyTweener" $
        \ clsNamePtr ->
          withCString "set_ease" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the type of used easing from @enum Tween.EaseType@. If not set, the default easing is used from the @SceneTreeTween@ that contains this Tweener.
set_ease ::
           (PropertyTweener :< cls, Object :< cls) =>
           cls -> Int -> IO PropertyTweener
set_ease cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPropertyTweener_set_ease (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod PropertyTweener "set_ease" '[Int]
           (IO PropertyTweener)
         where
        nodeMethod = Godot.Core.PropertyTweener.set_ease

{-# NOINLINE bindPropertyTweener_set_trans #-}

-- | Sets the type of used transition from @enum Tween.TransitionType@. If not set, the default transition is used from the @SceneTreeTween@ that contains this Tweener.
bindPropertyTweener_set_trans :: MethodBind
bindPropertyTweener_set_trans
  = unsafePerformIO $
      withCString "PropertyTweener" $
        \ clsNamePtr ->
          withCString "set_trans" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the type of used transition from @enum Tween.TransitionType@. If not set, the default transition is used from the @SceneTreeTween@ that contains this Tweener.
set_trans ::
            (PropertyTweener :< cls, Object :< cls) =>
            cls -> Int -> IO PropertyTweener
set_trans cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPropertyTweener_set_trans (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod PropertyTweener "set_trans" '[Int]
           (IO PropertyTweener)
         where
        nodeMethod = Godot.Core.PropertyTweener.set_trans