{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.SceneTreeTween
       (Godot.Core.SceneTreeTween._TWEEN_PAUSE_PROCESS,
        Godot.Core.SceneTreeTween._TWEEN_PAUSE_STOP,
        Godot.Core.SceneTreeTween._TWEEN_PAUSE_BOUND,
        Godot.Core.SceneTreeTween.sig_finished,
        Godot.Core.SceneTreeTween.sig_loop_finished,
        Godot.Core.SceneTreeTween.sig_step_finished,
        Godot.Core.SceneTreeTween.bind_node,
        Godot.Core.SceneTreeTween.chain,
        Godot.Core.SceneTreeTween.custom_step,
        Godot.Core.SceneTreeTween.get_total_elapsed_time,
        Godot.Core.SceneTreeTween.interpolate_value,
        Godot.Core.SceneTreeTween.is_running,
        Godot.Core.SceneTreeTween.is_valid, Godot.Core.SceneTreeTween.kill,
        Godot.Core.SceneTreeTween.parallel,
        Godot.Core.SceneTreeTween.pause, Godot.Core.SceneTreeTween.play,
        Godot.Core.SceneTreeTween.set_ease,
        Godot.Core.SceneTreeTween.set_loops,
        Godot.Core.SceneTreeTween.set_parallel,
        Godot.Core.SceneTreeTween.set_pause_mode,
        Godot.Core.SceneTreeTween.set_process_mode,
        Godot.Core.SceneTreeTween.set_speed_scale,
        Godot.Core.SceneTreeTween.set_trans,
        Godot.Core.SceneTreeTween.stop,
        Godot.Core.SceneTreeTween.tween_callback,
        Godot.Core.SceneTreeTween.tween_interval,
        Godot.Core.SceneTreeTween.tween_method,
        Godot.Core.SceneTreeTween.tween_property)
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

_TWEEN_PAUSE_PROCESS :: Int
_TWEEN_PAUSE_PROCESS = 2

_TWEEN_PAUSE_STOP :: Int
_TWEEN_PAUSE_STOP = 1

_TWEEN_PAUSE_BOUND :: Int
_TWEEN_PAUSE_BOUND = 0

-- | Emitted when the @SceneTreeTween@ has finished all tweening. Never emitted when the @SceneTreeTween@ is set to infinite looping (see @method set_loops@).
--   				__Note:__ The @SceneTreeTween@ is removed (invalidated) in the next processing frame after this signal is emitted. Calling @method stop@ inside the signal callback will prevent the @SceneTreeTween@ from being removed.
sig_finished :: Godot.Internal.Dispatch.Signal SceneTreeTween
sig_finished = Godot.Internal.Dispatch.Signal "finished"

instance NodeSignal SceneTreeTween "finished" '[]

-- | Emitted when a full loop is complete (see @method set_loops@), providing the loop index. This signal is not emitted after the final loop, use @signal finished@ instead for this case.
sig_loop_finished :: Godot.Internal.Dispatch.Signal SceneTreeTween
sig_loop_finished = Godot.Internal.Dispatch.Signal "loop_finished"

instance NodeSignal SceneTreeTween "loop_finished" '[Int]

-- | Emitted when one step of the @SceneTreeTween@ is complete, providing the step index. One step is either a single @Tweener@ or a group of @Tweener@s running in parallel.
sig_step_finished :: Godot.Internal.Dispatch.Signal SceneTreeTween
sig_step_finished = Godot.Internal.Dispatch.Signal "step_finished"

instance NodeSignal SceneTreeTween "step_finished" '[Int]

{-# NOINLINE bindSceneTreeTween_bind_node #-}

-- | Binds this @SceneTreeTween@ with the given @node@. @SceneTreeTween@s are processed directly by the @SceneTree@, so they run independently of the animated nodes. When you bind a @Node@ with the @SceneTreeTween@, the @SceneTreeTween@ will halt the animation when the object is not inside tree and the @SceneTreeTween@ will be automatically killed when the bound object is freed. Also @TWEEN_PAUSE_BOUND@ will make the pausing behavior dependent on the bound node.
--   				For a shorter way to create and bind a @SceneTreeTween@, you can use @method Node.create_tween@.
bindSceneTreeTween_bind_node :: MethodBind
bindSceneTreeTween_bind_node
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "bind_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Binds this @SceneTreeTween@ with the given @node@. @SceneTreeTween@s are processed directly by the @SceneTree@, so they run independently of the animated nodes. When you bind a @Node@ with the @SceneTreeTween@, the @SceneTreeTween@ will halt the animation when the object is not inside tree and the @SceneTreeTween@ will be automatically killed when the bound object is freed. Also @TWEEN_PAUSE_BOUND@ will make the pausing behavior dependent on the bound node.
--   				For a shorter way to create and bind a @SceneTreeTween@, you can use @method Node.create_tween@.
bind_node ::
            (SceneTreeTween :< cls, Object :< cls) =>
            cls -> Node -> IO SceneTreeTween
bind_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_bind_node (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod SceneTreeTween "bind_node" '[Node]
           (IO SceneTreeTween)
         where
        nodeMethod = Godot.Core.SceneTreeTween.bind_node

{-# NOINLINE bindSceneTreeTween_chain #-}

-- | Used to chain two @Tweener@s after @method set_parallel@ is called with @true@.
--   				
--   @
--   
--   				var tween = create_tween().set_parallel(true)
--   				tween.tween_property(...)
--   				tween.tween_property(...) # Will run parallelly with above.
--   				tween.chain().tween_property(...) # Will run after two above are finished.
--   				
--   @
bindSceneTreeTween_chain :: MethodBind
bindSceneTreeTween_chain
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "chain" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Used to chain two @Tweener@s after @method set_parallel@ is called with @true@.
--   				
--   @
--   
--   				var tween = create_tween().set_parallel(true)
--   				tween.tween_property(...)
--   				tween.tween_property(...) # Will run parallelly with above.
--   				tween.chain().tween_property(...) # Will run after two above are finished.
--   				
--   @
chain ::
        (SceneTreeTween :< cls, Object :< cls) => cls -> IO SceneTreeTween
chain cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_chain (upcast cls) arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod SceneTreeTween "chain" '[] (IO SceneTreeTween)
         where
        nodeMethod = Godot.Core.SceneTreeTween.chain

{-# NOINLINE bindSceneTreeTween_custom_step #-}

-- | Processes the @SceneTreeTween@ by the given @delta@ value, in seconds. This is mostly useful for manual control when the @SceneTreeTween@ is paused. It can also be used to end the @SceneTreeTween@ animation immediately, by setting @delta@ longer than the whole duration of the @SceneTreeTween@ animation.
--   				Returns @true@ if the @SceneTreeTween@ still has @Tweener@s that haven't finished.
--   				__Note:__ The @SceneTreeTween@ will become invalid in the next processing frame after its animation finishes. Calling @method stop@ after performing @method custom_step@ instead keeps and resets the @SceneTreeTween@.
bindSceneTreeTween_custom_step :: MethodBind
bindSceneTreeTween_custom_step
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "custom_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Processes the @SceneTreeTween@ by the given @delta@ value, in seconds. This is mostly useful for manual control when the @SceneTreeTween@ is paused. It can also be used to end the @SceneTreeTween@ animation immediately, by setting @delta@ longer than the whole duration of the @SceneTreeTween@ animation.
--   				Returns @true@ if the @SceneTreeTween@ still has @Tweener@s that haven't finished.
--   				__Note:__ The @SceneTreeTween@ will become invalid in the next processing frame after its animation finishes. Calling @method stop@ after performing @method custom_step@ instead keeps and resets the @SceneTreeTween@.
custom_step ::
              (SceneTreeTween :< cls, Object :< cls) => cls -> Float -> IO Bool
custom_step cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_custom_step (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod SceneTreeTween "custom_step" '[Float] (IO Bool)
         where
        nodeMethod = Godot.Core.SceneTreeTween.custom_step

{-# NOINLINE bindSceneTreeTween_get_total_elapsed_time #-}

-- | Returns the total time in seconds the @SceneTreeTween@ has been animating (i.e. the time since it started, not counting pauses etc.). The time is affected by @method set_speed_scale@, and @method stop@ will reset it to @0@.
--   				__Note:__ As it results from accumulating frame deltas, the time returned after the @SceneTreeTween@ has finished animating will be slightly greater than the actual @SceneTreeTween@ duration.
bindSceneTreeTween_get_total_elapsed_time :: MethodBind
bindSceneTreeTween_get_total_elapsed_time
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "get_total_elapsed_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total time in seconds the @SceneTreeTween@ has been animating (i.e. the time since it started, not counting pauses etc.). The time is affected by @method set_speed_scale@, and @method stop@ will reset it to @0@.
--   				__Note:__ As it results from accumulating frame deltas, the time returned after the @SceneTreeTween@ has finished animating will be slightly greater than the actual @SceneTreeTween@ duration.
get_total_elapsed_time ::
                         (SceneTreeTween :< cls, Object :< cls) => cls -> IO Float
get_total_elapsed_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_get_total_elapsed_time
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod SceneTreeTween "get_total_elapsed_time" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.SceneTreeTween.get_total_elapsed_time

{-# NOINLINE bindSceneTreeTween_interpolate_value #-}

-- | This method can be used for manual interpolation of a value, when you don't want @SceneTreeTween@ to do animating for you. It's similar to @method @GDScript.lerp@, but with support for custom transition and easing.
--   				@initial_value@ is the starting value of the interpolation.
--   				@delta_value@ is the change of the value in the interpolation, i.e. it's equal to @final_value - initial_value@.
--   				@elapsed_time@ is the time in seconds that passed after the interpolation started and it's used to control the position of the interpolation. E.g. when it's equal to half of the @duration@, the interpolated value will be halfway between initial and final values. This value can also be greater than @duration@ or lower than 0, which will extrapolate the value.
--   				@duration@ is the total time of the interpolation.
--   				__Note:__ If @duration@ is equal to @0@, the method will always return the final value, regardless of @elapsed_time@ provided.
bindSceneTreeTween_interpolate_value :: MethodBind
bindSceneTreeTween_interpolate_value
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "interpolate_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This method can be used for manual interpolation of a value, when you don't want @SceneTreeTween@ to do animating for you. It's similar to @method @GDScript.lerp@, but with support for custom transition and easing.
--   				@initial_value@ is the starting value of the interpolation.
--   				@delta_value@ is the change of the value in the interpolation, i.e. it's equal to @final_value - initial_value@.
--   				@elapsed_time@ is the time in seconds that passed after the interpolation started and it's used to control the position of the interpolation. E.g. when it's equal to half of the @duration@, the interpolated value will be halfway between initial and final values. This value can also be greater than @duration@ or lower than 0, which will extrapolate the value.
--   				@duration@ is the total time of the interpolation.
--   				__Note:__ If @duration@ is equal to @0@, the method will always return the final value, regardless of @elapsed_time@ provided.
interpolate_value ::
                    (SceneTreeTween :< cls, Object :< cls) =>
                    cls ->
                      GodotVariant ->
                        GodotVariant -> Float -> Float -> Int -> Int -> IO GodotVariant
interpolate_value cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_interpolate_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> return var)

instance NodeMethod SceneTreeTween "interpolate_value"
           '[GodotVariant, GodotVariant, Float, Float, Int, Int]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.SceneTreeTween.interpolate_value

{-# NOINLINE bindSceneTreeTween_is_running #-}

-- | Returns whether the @SceneTreeTween@ is currently running, i.e. it wasn't paused and it's not finished.
bindSceneTreeTween_is_running :: MethodBind
bindSceneTreeTween_is_running
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "is_running" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the @SceneTreeTween@ is currently running, i.e. it wasn't paused and it's not finished.
is_running ::
             (SceneTreeTween :< cls, Object :< cls) => cls -> IO Bool
is_running cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_is_running (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod SceneTreeTween "is_running" '[] (IO Bool) where
        nodeMethod = Godot.Core.SceneTreeTween.is_running

{-# NOINLINE bindSceneTreeTween_is_valid #-}

-- | Returns whether the @SceneTreeTween@ is valid. A valid @SceneTreeTween@ is a @SceneTreeTween@ contained by the scene tree (i.e. the array from @method SceneTree.get_processed_tweens@ will contain this @SceneTreeTween@). A @SceneTreeTween@ might become invalid when it has finished tweening, is killed, or when created with @SceneTreeTween.new()@. Invalid @SceneTreeTween@s can't have @Tweener@s appended. You can however still use @method interpolate_value@.
bindSceneTreeTween_is_valid :: MethodBind
bindSceneTreeTween_is_valid
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "is_valid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the @SceneTreeTween@ is valid. A valid @SceneTreeTween@ is a @SceneTreeTween@ contained by the scene tree (i.e. the array from @method SceneTree.get_processed_tweens@ will contain this @SceneTreeTween@). A @SceneTreeTween@ might become invalid when it has finished tweening, is killed, or when created with @SceneTreeTween.new()@. Invalid @SceneTreeTween@s can't have @Tweener@s appended. You can however still use @method interpolate_value@.
is_valid ::
           (SceneTreeTween :< cls, Object :< cls) => cls -> IO Bool
is_valid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_is_valid (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod SceneTreeTween "is_valid" '[] (IO Bool) where
        nodeMethod = Godot.Core.SceneTreeTween.is_valid

{-# NOINLINE bindSceneTreeTween_kill #-}

-- | Aborts all tweening operations and invalidates the @SceneTreeTween@.
bindSceneTreeTween_kill :: MethodBind
bindSceneTreeTween_kill
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "kill" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Aborts all tweening operations and invalidates the @SceneTreeTween@.
kill :: (SceneTreeTween :< cls, Object :< cls) => cls -> IO ()
kill cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_kill (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod SceneTreeTween "kill" '[] (IO ()) where
        nodeMethod = Godot.Core.SceneTreeTween.kill

{-# NOINLINE bindSceneTreeTween_parallel #-}

-- | Makes the next @Tweener@ run parallelly to the previous one. Example:
--   				
--   @
--   
--   				var tween = create_tween()
--   				tween.tween_property(...)
--   				tween.parallel().tween_property(...)
--   				tween.parallel().tween_property(...)
--   				
--   @
--   
--   				All @Tweener@s in the example will run at the same time.
--   				You can make the @SceneTreeTween@ parallel by default by using @method set_parallel@.
bindSceneTreeTween_parallel :: MethodBind
bindSceneTreeTween_parallel
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "parallel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Makes the next @Tweener@ run parallelly to the previous one. Example:
--   				
--   @
--   
--   				var tween = create_tween()
--   				tween.tween_property(...)
--   				tween.parallel().tween_property(...)
--   				tween.parallel().tween_property(...)
--   				
--   @
--   
--   				All @Tweener@s in the example will run at the same time.
--   				You can make the @SceneTreeTween@ parallel by default by using @method set_parallel@.
parallel ::
           (SceneTreeTween :< cls, Object :< cls) => cls -> IO SceneTreeTween
parallel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_parallel (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod SceneTreeTween "parallel" '[]
           (IO SceneTreeTween)
         where
        nodeMethod = Godot.Core.SceneTreeTween.parallel

{-# NOINLINE bindSceneTreeTween_pause #-}

-- | Pauses the tweening. The animation can be resumed by using @method play@.
bindSceneTreeTween_pause :: MethodBind
bindSceneTreeTween_pause
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "pause" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pauses the tweening. The animation can be resumed by using @method play@.
pause :: (SceneTreeTween :< cls, Object :< cls) => cls -> IO ()
pause cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_pause (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod SceneTreeTween "pause" '[] (IO ()) where
        nodeMethod = Godot.Core.SceneTreeTween.pause

{-# NOINLINE bindSceneTreeTween_play #-}

-- | Resumes a paused or stopped @SceneTreeTween@.
bindSceneTreeTween_play :: MethodBind
bindSceneTreeTween_play
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "play" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Resumes a paused or stopped @SceneTreeTween@.
play :: (SceneTreeTween :< cls, Object :< cls) => cls -> IO ()
play cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_play (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod SceneTreeTween "play" '[] (IO ()) where
        nodeMethod = Godot.Core.SceneTreeTween.play

{-# NOINLINE bindSceneTreeTween_set_ease #-}

-- | Sets the default ease type for @PropertyTweener@s and @MethodTweener@s animated by this @SceneTreeTween@.
bindSceneTreeTween_set_ease :: MethodBind
bindSceneTreeTween_set_ease
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "set_ease" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the default ease type for @PropertyTweener@s and @MethodTweener@s animated by this @SceneTreeTween@.
set_ease ::
           (SceneTreeTween :< cls, Object :< cls) =>
           cls -> Int -> IO SceneTreeTween
set_ease cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_set_ease (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod SceneTreeTween "set_ease" '[Int]
           (IO SceneTreeTween)
         where
        nodeMethod = Godot.Core.SceneTreeTween.set_ease

{-# NOINLINE bindSceneTreeTween_set_loops #-}

-- | Sets the number of times the tweening sequence will be repeated, i.e. @set_loops(2)@ will run the animation twice.
--   				Calling this method without arguments will make the @SceneTreeTween@ run infinitely, until either it is killed with @method kill@, the @SceneTreeTween@'s bound node is freed, or all the animated objects have been freed (which makes further animation impossible).
--   				__Warning:__ Make sure to always add some duration/delay when using infinite loops. To prevent the game freezing, 0-duration looped animations (e.g. a single @CallbackTweener@ with no delay) are stopped after a small number of loops, which may produce unexpected results. If a @SceneTreeTween@'s lifetime depends on some node, always use @method bind_node@.
bindSceneTreeTween_set_loops :: MethodBind
bindSceneTreeTween_set_loops
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "set_loops" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the number of times the tweening sequence will be repeated, i.e. @set_loops(2)@ will run the animation twice.
--   				Calling this method without arguments will make the @SceneTreeTween@ run infinitely, until either it is killed with @method kill@, the @SceneTreeTween@'s bound node is freed, or all the animated objects have been freed (which makes further animation impossible).
--   				__Warning:__ Make sure to always add some duration/delay when using infinite loops. To prevent the game freezing, 0-duration looped animations (e.g. a single @CallbackTweener@ with no delay) are stopped after a small number of loops, which may produce unexpected results. If a @SceneTreeTween@'s lifetime depends on some node, always use @method bind_node@.
set_loops ::
            (SceneTreeTween :< cls, Object :< cls) =>
            cls -> Maybe Int -> IO SceneTreeTween
set_loops cls arg1
  = withVariantArray [maybe (VariantInt (0)) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_set_loops (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod SceneTreeTween "set_loops" '[Maybe Int]
           (IO SceneTreeTween)
         where
        nodeMethod = Godot.Core.SceneTreeTween.set_loops

{-# NOINLINE bindSceneTreeTween_set_parallel #-}

-- | If @parallel@ is @true@, the @Tweener@s appended after this method will by default run simultaneously, as opposed to sequentially.
bindSceneTreeTween_set_parallel :: MethodBind
bindSceneTreeTween_set_parallel
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "set_parallel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @parallel@ is @true@, the @Tweener@s appended after this method will by default run simultaneously, as opposed to sequentially.
set_parallel ::
               (SceneTreeTween :< cls, Object :< cls) =>
               cls -> Maybe Bool -> IO SceneTreeTween
set_parallel cls arg1
  = withVariantArray [maybe (VariantBool True) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_set_parallel (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod SceneTreeTween "set_parallel" '[Maybe Bool]
           (IO SceneTreeTween)
         where
        nodeMethod = Godot.Core.SceneTreeTween.set_parallel

{-# NOINLINE bindSceneTreeTween_set_pause_mode #-}

-- | Determines the behavior of the @SceneTreeTween@ when the @SceneTree@ is paused. Check @enum TweenPauseMode@ for options.
--   				Default value is @TWEEN_PAUSE_BOUND@.
bindSceneTreeTween_set_pause_mode :: MethodBind
bindSceneTreeTween_set_pause_mode
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "set_pause_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines the behavior of the @SceneTreeTween@ when the @SceneTree@ is paused. Check @enum TweenPauseMode@ for options.
--   				Default value is @TWEEN_PAUSE_BOUND@.
set_pause_mode ::
                 (SceneTreeTween :< cls, Object :< cls) =>
                 cls -> Int -> IO SceneTreeTween
set_pause_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_set_pause_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod SceneTreeTween "set_pause_mode" '[Int]
           (IO SceneTreeTween)
         where
        nodeMethod = Godot.Core.SceneTreeTween.set_pause_mode

{-# NOINLINE bindSceneTreeTween_set_process_mode #-}

-- | Determines whether the @SceneTreeTween@ should run during idle frame (see @method Node._process@) or physics frame (see @method Node._physics_process@.
--   				Default value is @Tween.TWEEN_PROCESS_IDLE@.
bindSceneTreeTween_set_process_mode :: MethodBind
bindSceneTreeTween_set_process_mode
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "set_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines whether the @SceneTreeTween@ should run during idle frame (see @method Node._process@) or physics frame (see @method Node._physics_process@.
--   				Default value is @Tween.TWEEN_PROCESS_IDLE@.
set_process_mode ::
                   (SceneTreeTween :< cls, Object :< cls) =>
                   cls -> Int -> IO SceneTreeTween
set_process_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_set_process_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod SceneTreeTween "set_process_mode" '[Int]
           (IO SceneTreeTween)
         where
        nodeMethod = Godot.Core.SceneTreeTween.set_process_mode

{-# NOINLINE bindSceneTreeTween_set_speed_scale #-}

-- | Scales the speed of tweening. This affects all @Tweener@s and their delays.
bindSceneTreeTween_set_speed_scale :: MethodBind
bindSceneTreeTween_set_speed_scale
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "set_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Scales the speed of tweening. This affects all @Tweener@s and their delays.
set_speed_scale ::
                  (SceneTreeTween :< cls, Object :< cls) =>
                  cls -> Float -> IO SceneTreeTween
set_speed_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_set_speed_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod SceneTreeTween "set_speed_scale" '[Float]
           (IO SceneTreeTween)
         where
        nodeMethod = Godot.Core.SceneTreeTween.set_speed_scale

{-# NOINLINE bindSceneTreeTween_set_trans #-}

-- | Sets the default transition type for @PropertyTweener@s and @MethodTweener@s animated by this @SceneTreeTween@.
bindSceneTreeTween_set_trans :: MethodBind
bindSceneTreeTween_set_trans
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "set_trans" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the default transition type for @PropertyTweener@s and @MethodTweener@s animated by this @SceneTreeTween@.
set_trans ::
            (SceneTreeTween :< cls, Object :< cls) =>
            cls -> Int -> IO SceneTreeTween
set_trans cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_set_trans (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod SceneTreeTween "set_trans" '[Int]
           (IO SceneTreeTween)
         where
        nodeMethod = Godot.Core.SceneTreeTween.set_trans

{-# NOINLINE bindSceneTreeTween_stop #-}

-- | Stops the tweening and resets the @SceneTreeTween@ to its initial state. This will not remove any appended @Tweener@s.
bindSceneTreeTween_stop :: MethodBind
bindSceneTreeTween_stop
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops the tweening and resets the @SceneTreeTween@ to its initial state. This will not remove any appended @Tweener@s.
stop :: (SceneTreeTween :< cls, Object :< cls) => cls -> IO ()
stop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_stop (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod SceneTreeTween "stop" '[] (IO ()) where
        nodeMethod = Godot.Core.SceneTreeTween.stop

{-# NOINLINE bindSceneTreeTween_tween_callback #-}

-- | Creates and appends a @CallbackTweener@. This method can be used to call an arbitrary method in any object. Use @binds@ to bind additional arguments for the call.
--   				Example: object that keeps shooting every 1 second.
--   				
--   @
--   
--   				var tween = get_tree().create_tween().set_loops()
--   				tween.tween_callback(self, "shoot").set_delay(1)
--   				
--   @
--   
--   				Example: turning a sprite red and then blue, with 2 second delay.
--   				
--   @
--   
--   				var tween = get_tree().create_tween()
--   				tween.tween_callback($Sprite, "set_modulate", @Color.red@).set_delay(2)
--   				tween.tween_callback($Sprite, "set_modulate", @Color.blue@).set_delay(2)
--   				
--   @
bindSceneTreeTween_tween_callback :: MethodBind
bindSceneTreeTween_tween_callback
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "tween_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates and appends a @CallbackTweener@. This method can be used to call an arbitrary method in any object. Use @binds@ to bind additional arguments for the call.
--   				Example: object that keeps shooting every 1 second.
--   				
--   @
--   
--   				var tween = get_tree().create_tween().set_loops()
--   				tween.tween_callback(self, "shoot").set_delay(1)
--   				
--   @
--   
--   				Example: turning a sprite red and then blue, with 2 second delay.
--   				
--   @
--   
--   				var tween = get_tree().create_tween()
--   				tween.tween_callback($Sprite, "set_modulate", @Color.red@).set_delay(2)
--   				tween.tween_callback($Sprite, "set_modulate", @Color.blue@).set_delay(2)
--   				
--   @
tween_callback ::
                 (SceneTreeTween :< cls, Object :< cls) =>
                 cls -> Object -> GodotString -> Maybe Array -> IO CallbackTweener
tween_callback cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantArray V.empty arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_tween_callback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod SceneTreeTween "tween_callback"
           '[Object, GodotString, Maybe Array]
           (IO CallbackTweener)
         where
        nodeMethod = Godot.Core.SceneTreeTween.tween_callback

{-# NOINLINE bindSceneTreeTween_tween_interval #-}

-- | Creates and appends an @IntervalTweener@. This method can be used to create delays in the tween animation, as an alternative to using the delay in other @Tweener@s, or when there's no animation (in which case the @SceneTreeTween@ acts as a timer). @time@ is the length of the interval, in seconds.
--   				Example: creating an interval in code execution.
--   				
--   @
--   
--   				# ... some code
--   				yield(create_tween().tween_interval(2), "finished")
--   				# ... more code
--   				
--   @
--   
--   				Example: creating an object that moves back and forth and jumps every few seconds.
--   				
--   @
--   
--   				var tween = create_tween().set_loops()
--   				tween.tween_property($Sprite, "position:x", 200.0, 1).as_relative()
--   				tween.tween_callback(self, "jump")
--   				tween.tween_interval(2)
--   				tween.tween_property($Sprite, "position:x", -200.0, 1).as_relative()
--   				tween.tween_callback(self, "jump")
--   				tween.tween_interval(2)
--   				
--   @
bindSceneTreeTween_tween_interval :: MethodBind
bindSceneTreeTween_tween_interval
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "tween_interval" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates and appends an @IntervalTweener@. This method can be used to create delays in the tween animation, as an alternative to using the delay in other @Tweener@s, or when there's no animation (in which case the @SceneTreeTween@ acts as a timer). @time@ is the length of the interval, in seconds.
--   				Example: creating an interval in code execution.
--   				
--   @
--   
--   				# ... some code
--   				yield(create_tween().tween_interval(2), "finished")
--   				# ... more code
--   				
--   @
--   
--   				Example: creating an object that moves back and forth and jumps every few seconds.
--   				
--   @
--   
--   				var tween = create_tween().set_loops()
--   				tween.tween_property($Sprite, "position:x", 200.0, 1).as_relative()
--   				tween.tween_callback(self, "jump")
--   				tween.tween_interval(2)
--   				tween.tween_property($Sprite, "position:x", -200.0, 1).as_relative()
--   				tween.tween_callback(self, "jump")
--   				tween.tween_interval(2)
--   				
--   @
tween_interval ::
                 (SceneTreeTween :< cls, Object :< cls) =>
                 cls -> Float -> IO IntervalTweener
tween_interval cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_tween_interval
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod SceneTreeTween "tween_interval" '[Float]
           (IO IntervalTweener)
         where
        nodeMethod = Godot.Core.SceneTreeTween.tween_interval

{-# NOINLINE bindSceneTreeTween_tween_method #-}

-- | Creates and appends a @MethodTweener@. This method is similar to a combination of @method tween_callback@ and @method tween_property@. It calls a method over time with a tweened value provided as an argument. The value is tweened between @from@ and @to@ over the time specified by @duration@, in seconds. Use @binds@ to bind additional arguments for the call. You can use @method MethodTweener.set_ease@ and @method MethodTweener.set_trans@ to tweak the easing and transition of the value or @method MethodTweener.set_delay@ to delay the tweening.
--   				Example: making a 3D object look from one point to another point.
--   				
--   @
--   
--   				var tween = create_tween()
--   				tween.tween_method(self, "look_at", Vector3(-1, 0, -1), Vector3(1, 0, -1), 1, @Vector3.UP@) # The look_at() method takes up vector as second argument.
--   				
--   @
--   
--   				Example: setting a text of a @Label@, using an intermediate method and after a delay.
--   				
--   @
--   
--   				func _ready():
--   				    var tween = create_tween()
--   				    tween.tween_method(self, "set_label_text", 0, 10, 1).set_delay(1)
--   
--   				func set_label_text(value: int):
--   				    $Label.text = "Counting " + str(value)
--   				
--   @
bindSceneTreeTween_tween_method :: MethodBind
bindSceneTreeTween_tween_method
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "tween_method" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates and appends a @MethodTweener@. This method is similar to a combination of @method tween_callback@ and @method tween_property@. It calls a method over time with a tweened value provided as an argument. The value is tweened between @from@ and @to@ over the time specified by @duration@, in seconds. Use @binds@ to bind additional arguments for the call. You can use @method MethodTweener.set_ease@ and @method MethodTweener.set_trans@ to tweak the easing and transition of the value or @method MethodTweener.set_delay@ to delay the tweening.
--   				Example: making a 3D object look from one point to another point.
--   				
--   @
--   
--   				var tween = create_tween()
--   				tween.tween_method(self, "look_at", Vector3(-1, 0, -1), Vector3(1, 0, -1), 1, @Vector3.UP@) # The look_at() method takes up vector as second argument.
--   				
--   @
--   
--   				Example: setting a text of a @Label@, using an intermediate method and after a delay.
--   				
--   @
--   
--   				func _ready():
--   				    var tween = create_tween()
--   				    tween.tween_method(self, "set_label_text", 0, 10, 1).set_delay(1)
--   
--   				func set_label_text(value: int):
--   				    $Label.text = "Counting " + str(value)
--   				
--   @
tween_method ::
               (SceneTreeTween :< cls, Object :< cls) =>
               cls ->
                 Object ->
                   GodotString ->
                     GodotVariant ->
                       GodotVariant -> Float -> Maybe Array -> IO MethodTweener
tween_method cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, defaultedVariant VariantArray V.empty arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_tween_method (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod SceneTreeTween "tween_method"
           '[Object, GodotString, GodotVariant, GodotVariant, Float,
             Maybe Array]
           (IO MethodTweener)
         where
        nodeMethod = Godot.Core.SceneTreeTween.tween_method

{-# NOINLINE bindSceneTreeTween_tween_property #-}

-- | Creates and appends a @PropertyTweener@. This method tweens a @property@ of an @object@ between an initial value and @final_val@ in a span of time equal to @duration@, in seconds. The initial value by default is the property's value at the time the tweening of the @PropertyTweener@ starts. For example:
--   				
--   @
--   
--   				var tween = create_tween()
--   				tween.tween_property($Sprite, "position", Vector2(100, 200), 1)
--   				tween.tween_property($Sprite, "position", Vector2(200, 300), 1)
--   				
--   @
--   
--   				will move the sprite to position (100, 200) and then to (200, 300). If you use @method PropertyTweener.from@ or @method PropertyTweener.from_current@, the starting position will be overwritten by the given value instead. See other methods in @PropertyTweener@ to see how the tweening can be tweaked further.
--   				__Note:__ You can find the correct property name by hovering over the property in the Inspector. You can also provide the components of a property directly by using @"property:component"@ (eg. @position:x@), where it would only apply to that particular component.
--   				Example: moving object twice from the same position, with different transition types.
--   				
--   @
--   
--   				var tween = create_tween()
--   				tween.tween_property($Sprite, "position", Vector2.RIGHT * 300, 1).as_relative().set_trans(Tween.TRANS_SINE)
--   				tween.tween_property($Sprite, "position", Vector2.RIGHT * 300, 1).as_relative().from_current().set_trans(Tween.TRANS_EXPO)
--   				
--   @
bindSceneTreeTween_tween_property :: MethodBind
bindSceneTreeTween_tween_property
  = unsafePerformIO $
      withCString "SceneTreeTween" $
        \ clsNamePtr ->
          withCString "tween_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates and appends a @PropertyTweener@. This method tweens a @property@ of an @object@ between an initial value and @final_val@ in a span of time equal to @duration@, in seconds. The initial value by default is the property's value at the time the tweening of the @PropertyTweener@ starts. For example:
--   				
--   @
--   
--   				var tween = create_tween()
--   				tween.tween_property($Sprite, "position", Vector2(100, 200), 1)
--   				tween.tween_property($Sprite, "position", Vector2(200, 300), 1)
--   				
--   @
--   
--   				will move the sprite to position (100, 200) and then to (200, 300). If you use @method PropertyTweener.from@ or @method PropertyTweener.from_current@, the starting position will be overwritten by the given value instead. See other methods in @PropertyTweener@ to see how the tweening can be tweaked further.
--   				__Note:__ You can find the correct property name by hovering over the property in the Inspector. You can also provide the components of a property directly by using @"property:component"@ (eg. @position:x@), where it would only apply to that particular component.
--   				Example: moving object twice from the same position, with different transition types.
--   				
--   @
--   
--   				var tween = create_tween()
--   				tween.tween_property($Sprite, "position", Vector2.RIGHT * 300, 1).as_relative().set_trans(Tween.TRANS_SINE)
--   				tween.tween_property($Sprite, "position", Vector2.RIGHT * 300, 1).as_relative().from_current().set_trans(Tween.TRANS_EXPO)
--   				
--   @
tween_property ::
                 (SceneTreeTween :< cls, Object :< cls) =>
                 cls ->
                   Object -> NodePath -> GodotVariant -> Float -> IO PropertyTweener
tween_property cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTween_tween_property
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod SceneTreeTween "tween_property"
           '[Object, NodePath, GodotVariant, Float]
           (IO PropertyTweener)
         where
        nodeMethod = Godot.Core.SceneTreeTween.tween_property