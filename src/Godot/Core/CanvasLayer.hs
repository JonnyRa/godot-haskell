{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CanvasLayer
       (Godot.Core.CanvasLayer.sig_visibility_changed,
        Godot.Core.CanvasLayer.get_canvas,
        Godot.Core.CanvasLayer.get_custom_viewport,
        Godot.Core.CanvasLayer.get_final_transform,
        Godot.Core.CanvasLayer.get_follow_viewport_scale,
        Godot.Core.CanvasLayer.get_layer,
        Godot.Core.CanvasLayer.get_offset,
        Godot.Core.CanvasLayer.get_rotation,
        Godot.Core.CanvasLayer.get_rotation_degrees,
        Godot.Core.CanvasLayer.get_scale,
        Godot.Core.CanvasLayer.get_transform, Godot.Core.CanvasLayer.hide,
        Godot.Core.CanvasLayer.is_following_viewport,
        Godot.Core.CanvasLayer.is_visible,
        Godot.Core.CanvasLayer.set_custom_viewport,
        Godot.Core.CanvasLayer.set_follow_viewport,
        Godot.Core.CanvasLayer.set_follow_viewport_scale,
        Godot.Core.CanvasLayer.set_layer,
        Godot.Core.CanvasLayer.set_offset,
        Godot.Core.CanvasLayer.set_rotation,
        Godot.Core.CanvasLayer.set_rotation_degrees,
        Godot.Core.CanvasLayer.set_scale,
        Godot.Core.CanvasLayer.set_transform,
        Godot.Core.CanvasLayer.set_visible, Godot.Core.CanvasLayer.show)
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
import Godot.Core.Node()

-- | Emitted when visibility of the layer is changed. See @visible@.
sig_visibility_changed ::
                       Godot.Internal.Dispatch.Signal CanvasLayer
sig_visibility_changed
  = Godot.Internal.Dispatch.Signal "visibility_changed"

instance NodeSignal CanvasLayer "visibility_changed" '[]

instance NodeProperty CanvasLayer "custom_viewport" Node 'False
         where
        nodeProperty
          = (get_custom_viewport, wrapDroppingSetter set_custom_viewport,
             Nothing)

instance NodeProperty CanvasLayer "follow_viewport_enable" Bool
           'False
         where
        nodeProperty
          = (is_following_viewport, wrapDroppingSetter set_follow_viewport,
             Nothing)

instance NodeProperty CanvasLayer "follow_viewport_scale" Float
           'False
         where
        nodeProperty
          = (get_follow_viewport_scale,
             wrapDroppingSetter set_follow_viewport_scale, Nothing)

instance NodeProperty CanvasLayer "layer" Int 'False where
        nodeProperty = (get_layer, wrapDroppingSetter set_layer, Nothing)

instance NodeProperty CanvasLayer "offset" Vector2 'False where
        nodeProperty = (get_offset, wrapDroppingSetter set_offset, Nothing)

instance NodeProperty CanvasLayer "rotation" Float 'False where
        nodeProperty
          = (get_rotation, wrapDroppingSetter set_rotation, Nothing)

instance NodeProperty CanvasLayer "rotation_degrees" Float 'False
         where
        nodeProperty
          = (get_rotation_degrees, wrapDroppingSetter set_rotation_degrees,
             Nothing)

instance NodeProperty CanvasLayer "scale" Vector2 'False where
        nodeProperty = (get_scale, wrapDroppingSetter set_scale, Nothing)

instance NodeProperty CanvasLayer "transform" Transform2d 'False
         where
        nodeProperty
          = (get_transform, wrapDroppingSetter set_transform, Nothing)

instance NodeProperty CanvasLayer "visible" Bool 'False where
        nodeProperty
          = (is_visible, wrapDroppingSetter set_visible, Nothing)

{-# NOINLINE bindCanvasLayer_get_canvas #-}

-- | Returns the RID of the canvas used by this layer.
bindCanvasLayer_get_canvas :: MethodBind
bindCanvasLayer_get_canvas
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the RID of the canvas used by this layer.
get_canvas :: (CanvasLayer :< cls, Object :< cls) => cls -> IO Rid
get_canvas cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_canvas (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "get_canvas" '[] (IO Rid) where
        nodeMethod = Godot.Core.CanvasLayer.get_canvas

{-# NOINLINE bindCanvasLayer_get_custom_viewport #-}

-- | The custom @Viewport@ node assigned to the @CanvasLayer@. If @null@, uses the default viewport instead.
bindCanvasLayer_get_custom_viewport :: MethodBind
bindCanvasLayer_get_custom_viewport
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_custom_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom @Viewport@ node assigned to the @CanvasLayer@. If @null@, uses the default viewport instead.
get_custom_viewport ::
                      (CanvasLayer :< cls, Object :< cls) => cls -> IO Node
get_custom_viewport cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_custom_viewport
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod CanvasLayer "get_custom_viewport" '[] (IO Node)
         where
        nodeMethod = Godot.Core.CanvasLayer.get_custom_viewport

{-# NOINLINE bindCanvasLayer_get_final_transform #-}

-- | Returns the transform from the @CanvasLayer@s coordinate system to the @Viewport@s coordinate system.
bindCanvasLayer_get_final_transform :: MethodBind
bindCanvasLayer_get_final_transform
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_final_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the transform from the @CanvasLayer@s coordinate system to the @Viewport@s coordinate system.
get_final_transform ::
                      (CanvasLayer :< cls, Object :< cls) => cls -> IO Transform2d
get_final_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_final_transform
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "get_final_transform" '[]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.CanvasLayer.get_final_transform

{-# NOINLINE bindCanvasLayer_get_follow_viewport_scale #-}

-- | Scales the layer when using @follow_viewport_enable@. Layers moving into the foreground should have increasing scales, while layers moving into the background should have decreasing scales.
bindCanvasLayer_get_follow_viewport_scale :: MethodBind
bindCanvasLayer_get_follow_viewport_scale
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_follow_viewport_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Scales the layer when using @follow_viewport_enable@. Layers moving into the foreground should have increasing scales, while layers moving into the background should have decreasing scales.
get_follow_viewport_scale ::
                            (CanvasLayer :< cls, Object :< cls) => cls -> IO Float
get_follow_viewport_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_follow_viewport_scale
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "get_follow_viewport_scale" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.CanvasLayer.get_follow_viewport_scale

{-# NOINLINE bindCanvasLayer_get_layer #-}

-- | Layer index for draw order. Lower values are drawn behind higher values.
bindCanvasLayer_get_layer :: MethodBind
bindCanvasLayer_get_layer
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Layer index for draw order. Lower values are drawn behind higher values.
get_layer :: (CanvasLayer :< cls, Object :< cls) => cls -> IO Int
get_layer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_layer (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "get_layer" '[] (IO Int) where
        nodeMethod = Godot.Core.CanvasLayer.get_layer

{-# NOINLINE bindCanvasLayer_get_offset #-}

-- | The layer's base offset.
bindCanvasLayer_get_offset :: MethodBind
bindCanvasLayer_get_offset
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's base offset.
get_offset ::
             (CanvasLayer :< cls, Object :< cls) => cls -> IO Vector2
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_offset (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "get_offset" '[] (IO Vector2) where
        nodeMethod = Godot.Core.CanvasLayer.get_offset

{-# NOINLINE bindCanvasLayer_get_rotation #-}

-- | The layer's rotation in radians.
bindCanvasLayer_get_rotation :: MethodBind
bindCanvasLayer_get_rotation
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's rotation in radians.
get_rotation ::
               (CanvasLayer :< cls, Object :< cls) => cls -> IO Float
get_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_rotation (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "get_rotation" '[] (IO Float) where
        nodeMethod = Godot.Core.CanvasLayer.get_rotation

{-# NOINLINE bindCanvasLayer_get_rotation_degrees #-}

-- | The layer's rotation in degrees.
bindCanvasLayer_get_rotation_degrees :: MethodBind
bindCanvasLayer_get_rotation_degrees
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's rotation in degrees.
get_rotation_degrees ::
                       (CanvasLayer :< cls, Object :< cls) => cls -> IO Float
get_rotation_degrees cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_rotation_degrees
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "get_rotation_degrees" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.CanvasLayer.get_rotation_degrees

{-# NOINLINE bindCanvasLayer_get_scale #-}

-- | The layer's scale.
bindCanvasLayer_get_scale :: MethodBind
bindCanvasLayer_get_scale
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's scale.
get_scale ::
            (CanvasLayer :< cls, Object :< cls) => cls -> IO Vector2
get_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_scale (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "get_scale" '[] (IO Vector2) where
        nodeMethod = Godot.Core.CanvasLayer.get_scale

{-# NOINLINE bindCanvasLayer_get_transform #-}

-- | The layer's transform.
bindCanvasLayer_get_transform :: MethodBind
bindCanvasLayer_get_transform
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's transform.
get_transform ::
                (CanvasLayer :< cls, Object :< cls) => cls -> IO Transform2d
get_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_transform (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "get_transform" '[]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.CanvasLayer.get_transform

{-# NOINLINE bindCanvasLayer_hide #-}

-- | Hides any @CanvasItem@ under this @CanvasLayer@. This is equivalent to setting @visible@ to @false@.
bindCanvasLayer_hide :: MethodBind
bindCanvasLayer_hide
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "hide" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Hides any @CanvasItem@ under this @CanvasLayer@. This is equivalent to setting @visible@ to @false@.
hide :: (CanvasLayer :< cls, Object :< cls) => cls -> IO ()
hide cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_hide (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "hide" '[] (IO ()) where
        nodeMethod = Godot.Core.CanvasLayer.hide

{-# NOINLINE bindCanvasLayer_is_following_viewport #-}

-- | If enabled, the @CanvasLayer@ will use the viewport's transform, so it will move when camera moves instead of being anchored in a fixed position on the screen.
--   			Together with @follow_viewport_scale@ it can be used for a pseudo 3D effect.
bindCanvasLayer_is_following_viewport :: MethodBind
bindCanvasLayer_is_following_viewport
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "is_following_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If enabled, the @CanvasLayer@ will use the viewport's transform, so it will move when camera moves instead of being anchored in a fixed position on the screen.
--   			Together with @follow_viewport_scale@ it can be used for a pseudo 3D effect.
is_following_viewport ::
                        (CanvasLayer :< cls, Object :< cls) => cls -> IO Bool
is_following_viewport cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_is_following_viewport
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "is_following_viewport" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.CanvasLayer.is_following_viewport

{-# NOINLINE bindCanvasLayer_is_visible #-}

-- | If @false@, any @CanvasItem@ under this @CanvasLayer@ will be hidden.
--   			Unlike @CanvasItem.visible@, visibility of a @CanvasLayer@ isn't propagated to underlying layers.
bindCanvasLayer_is_visible :: MethodBind
bindCanvasLayer_is_visible
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "is_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @false@, any @CanvasItem@ under this @CanvasLayer@ will be hidden.
--   			Unlike @CanvasItem.visible@, visibility of a @CanvasLayer@ isn't propagated to underlying layers.
is_visible :: (CanvasLayer :< cls, Object :< cls) => cls -> IO Bool
is_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_is_visible (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "is_visible" '[] (IO Bool) where
        nodeMethod = Godot.Core.CanvasLayer.is_visible

{-# NOINLINE bindCanvasLayer_set_custom_viewport #-}

-- | The custom @Viewport@ node assigned to the @CanvasLayer@. If @null@, uses the default viewport instead.
bindCanvasLayer_set_custom_viewport :: MethodBind
bindCanvasLayer_set_custom_viewport
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_custom_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom @Viewport@ node assigned to the @CanvasLayer@. If @null@, uses the default viewport instead.
set_custom_viewport ::
                      (CanvasLayer :< cls, Object :< cls) => cls -> Node -> IO ()
set_custom_viewport cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_custom_viewport
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "set_custom_viewport" '[Node]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasLayer.set_custom_viewport

{-# NOINLINE bindCanvasLayer_set_follow_viewport #-}

-- | If enabled, the @CanvasLayer@ will use the viewport's transform, so it will move when camera moves instead of being anchored in a fixed position on the screen.
--   			Together with @follow_viewport_scale@ it can be used for a pseudo 3D effect.
bindCanvasLayer_set_follow_viewport :: MethodBind
bindCanvasLayer_set_follow_viewport
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_follow_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If enabled, the @CanvasLayer@ will use the viewport's transform, so it will move when camera moves instead of being anchored in a fixed position on the screen.
--   			Together with @follow_viewport_scale@ it can be used for a pseudo 3D effect.
set_follow_viewport ::
                      (CanvasLayer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_follow_viewport cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_follow_viewport
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "set_follow_viewport" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasLayer.set_follow_viewport

{-# NOINLINE bindCanvasLayer_set_follow_viewport_scale #-}

-- | Scales the layer when using @follow_viewport_enable@. Layers moving into the foreground should have increasing scales, while layers moving into the background should have decreasing scales.
bindCanvasLayer_set_follow_viewport_scale :: MethodBind
bindCanvasLayer_set_follow_viewport_scale
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_follow_viewport_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Scales the layer when using @follow_viewport_enable@. Layers moving into the foreground should have increasing scales, while layers moving into the background should have decreasing scales.
set_follow_viewport_scale ::
                            (CanvasLayer :< cls, Object :< cls) => cls -> Float -> IO ()
set_follow_viewport_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_follow_viewport_scale
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "set_follow_viewport_scale"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasLayer.set_follow_viewport_scale

{-# NOINLINE bindCanvasLayer_set_layer #-}

-- | Layer index for draw order. Lower values are drawn behind higher values.
bindCanvasLayer_set_layer :: MethodBind
bindCanvasLayer_set_layer
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Layer index for draw order. Lower values are drawn behind higher values.
set_layer ::
            (CanvasLayer :< cls, Object :< cls) => cls -> Int -> IO ()
set_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_layer (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "set_layer" '[Int] (IO ()) where
        nodeMethod = Godot.Core.CanvasLayer.set_layer

{-# NOINLINE bindCanvasLayer_set_offset #-}

-- | The layer's base offset.
bindCanvasLayer_set_offset :: MethodBind
bindCanvasLayer_set_offset
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's base offset.
set_offset ::
             (CanvasLayer :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_offset (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "set_offset" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.CanvasLayer.set_offset

{-# NOINLINE bindCanvasLayer_set_rotation #-}

-- | The layer's rotation in radians.
bindCanvasLayer_set_rotation :: MethodBind
bindCanvasLayer_set_rotation
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's rotation in radians.
set_rotation ::
               (CanvasLayer :< cls, Object :< cls) => cls -> Float -> IO ()
set_rotation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_rotation (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "set_rotation" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.CanvasLayer.set_rotation

{-# NOINLINE bindCanvasLayer_set_rotation_degrees #-}

-- | The layer's rotation in degrees.
bindCanvasLayer_set_rotation_degrees :: MethodBind
bindCanvasLayer_set_rotation_degrees
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's rotation in degrees.
set_rotation_degrees ::
                       (CanvasLayer :< cls, Object :< cls) => cls -> Float -> IO ()
set_rotation_degrees cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_rotation_degrees
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "set_rotation_degrees" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasLayer.set_rotation_degrees

{-# NOINLINE bindCanvasLayer_set_scale #-}

-- | The layer's scale.
bindCanvasLayer_set_scale :: MethodBind
bindCanvasLayer_set_scale
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's scale.
set_scale ::
            (CanvasLayer :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_scale (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "set_scale" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.CanvasLayer.set_scale

{-# NOINLINE bindCanvasLayer_set_transform #-}

-- | The layer's transform.
bindCanvasLayer_set_transform :: MethodBind
bindCanvasLayer_set_transform
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's transform.
set_transform ::
                (CanvasLayer :< cls, Object :< cls) => cls -> Transform2d -> IO ()
set_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_transform (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "set_transform" '[Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasLayer.set_transform

{-# NOINLINE bindCanvasLayer_set_visible #-}

-- | If @false@, any @CanvasItem@ under this @CanvasLayer@ will be hidden.
--   			Unlike @CanvasItem.visible@, visibility of a @CanvasLayer@ isn't propagated to underlying layers.
bindCanvasLayer_set_visible :: MethodBind
bindCanvasLayer_set_visible
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @false@, any @CanvasItem@ under this @CanvasLayer@ will be hidden.
--   			Unlike @CanvasItem.visible@, visibility of a @CanvasLayer@ isn't propagated to underlying layers.
set_visible ::
              (CanvasLayer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_visible (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "set_visible" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.CanvasLayer.set_visible

{-# NOINLINE bindCanvasLayer_show #-}

-- | Shows any @CanvasItem@ under this @CanvasLayer@. This is equivalent to setting @visible@ to @true@.
bindCanvasLayer_show :: MethodBind
bindCanvasLayer_show
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "show" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shows any @CanvasItem@ under this @CanvasLayer@. This is equivalent to setting @visible@ to @true@.
show :: (CanvasLayer :< cls, Object :< cls) => cls -> IO ()
show cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_show (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CanvasLayer "show" '[] (IO ()) where
        nodeMethod = Godot.Core.CanvasLayer.show