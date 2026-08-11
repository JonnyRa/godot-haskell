{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Label3D
       (Godot.Core.Label3D._FLAG_DISABLE_DEPTH_TEST,
        Godot.Core.Label3D._FLAG_SHADED, Godot.Core.Label3D._VALIGN_TOP,
        Godot.Core.Label3D._ALIGN_RIGHT, Godot.Core.Label3D._ALIGN_FILL,
        Godot.Core.Label3D._ALPHA_CUT_OPAQUE_PREPASS,
        Godot.Core.Label3D._VALIGN_FILL,
        Godot.Core.Label3D._FLAG_DOUBLE_SIDED,
        Godot.Core.Label3D._ALPHA_CUT_DISABLED,
        Godot.Core.Label3D._ALPHA_CUT_DISCARD,
        Godot.Core.Label3D._VALIGN_CENTER, Godot.Core.Label3D._FLAG_MAX,
        Godot.Core.Label3D._FLAG_FIXED_SIZE,
        Godot.Core.Label3D._VALIGN_BOTTOM, Godot.Core.Label3D._ALIGN_LEFT,
        Godot.Core.Label3D._ALIGN_CENTER, Godot.Core.Label3D._font_changed,
        Godot.Core.Label3D._im_update, Godot.Core.Label3D._queue_update,
        Godot.Core.Label3D.generate_triangle_mesh,
        Godot.Core.Label3D.get_alpha_cut_mode,
        Godot.Core.Label3D.get_alpha_scissor_threshold,
        Godot.Core.Label3D.get_autowrap,
        Godot.Core.Label3D.get_billboard_mode,
        Godot.Core.Label3D.get_draw_flag, Godot.Core.Label3D.get_font,
        Godot.Core.Label3D.get_horizontal_alignment,
        Godot.Core.Label3D.get_line_spacing,
        Godot.Core.Label3D.get_modulate, Godot.Core.Label3D.get_offset,
        Godot.Core.Label3D.get_outline_modulate,
        Godot.Core.Label3D.get_outline_render_priority,
        Godot.Core.Label3D.get_pixel_size,
        Godot.Core.Label3D.get_render_priority,
        Godot.Core.Label3D.get_text,
        Godot.Core.Label3D.get_vertical_alignment,
        Godot.Core.Label3D.get_width, Godot.Core.Label3D.is_uppercase,
        Godot.Core.Label3D.set_alpha_cut_mode,
        Godot.Core.Label3D.set_alpha_scissor_threshold,
        Godot.Core.Label3D.set_autowrap,
        Godot.Core.Label3D.set_billboard_mode,
        Godot.Core.Label3D.set_draw_flag, Godot.Core.Label3D.set_font,
        Godot.Core.Label3D.set_horizontal_alignment,
        Godot.Core.Label3D.set_line_spacing,
        Godot.Core.Label3D.set_modulate, Godot.Core.Label3D.set_offset,
        Godot.Core.Label3D.set_outline_modulate,
        Godot.Core.Label3D.set_outline_render_priority,
        Godot.Core.Label3D.set_pixel_size,
        Godot.Core.Label3D.set_render_priority,
        Godot.Core.Label3D.set_text, Godot.Core.Label3D.set_uppercase,
        Godot.Core.Label3D.set_vertical_alignment,
        Godot.Core.Label3D.set_width)
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
import Godot.Core.GeometryInstance()

_FLAG_DISABLE_DEPTH_TEST :: Int
_FLAG_DISABLE_DEPTH_TEST = 2

_FLAG_SHADED :: Int
_FLAG_SHADED = 0

_VALIGN_TOP :: Int
_VALIGN_TOP = 0

_ALIGN_RIGHT :: Int
_ALIGN_RIGHT = 2

_ALIGN_FILL :: Int
_ALIGN_FILL = 3

_ALPHA_CUT_OPAQUE_PREPASS :: Int
_ALPHA_CUT_OPAQUE_PREPASS = 2

_VALIGN_FILL :: Int
_VALIGN_FILL = 3

_FLAG_DOUBLE_SIDED :: Int
_FLAG_DOUBLE_SIDED = 1

_ALPHA_CUT_DISABLED :: Int
_ALPHA_CUT_DISABLED = 0

_ALPHA_CUT_DISCARD :: Int
_ALPHA_CUT_DISCARD = 1

_VALIGN_CENTER :: Int
_VALIGN_CENTER = 1

_FLAG_MAX :: Int
_FLAG_MAX = 4

_FLAG_FIXED_SIZE :: Int
_FLAG_FIXED_SIZE = 3

_VALIGN_BOTTOM :: Int
_VALIGN_BOTTOM = 2

_ALIGN_LEFT :: Int
_ALIGN_LEFT = 0

_ALIGN_CENTER :: Int
_ALIGN_CENTER = 1

instance NodeProperty Label3D "alpha_cut" Int 'False where
        nodeProperty
          = (get_alpha_cut_mode, wrapDroppingSetter set_alpha_cut_mode,
             Nothing)

instance NodeProperty Label3D "alpha_scissor_threshold" Float
           'False
         where
        nodeProperty
          = (get_alpha_scissor_threshold,
             wrapDroppingSetter set_alpha_scissor_threshold, Nothing)

instance NodeProperty Label3D "autowrap" Bool 'False where
        nodeProperty
          = (get_autowrap, wrapDroppingSetter set_autowrap, Nothing)

instance NodeProperty Label3D "billboard" Int 'False where
        nodeProperty
          = (get_billboard_mode, wrapDroppingSetter set_billboard_mode,
             Nothing)

instance NodeProperty Label3D "double_sided" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 1 get_draw_flag,
             wrapIndexedSetter 1 set_draw_flag, Nothing)

instance NodeProperty Label3D "fixed_size" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 3 get_draw_flag,
             wrapIndexedSetter 3 set_draw_flag, Nothing)

instance NodeProperty Label3D "font" Font 'False where
        nodeProperty = (get_font, wrapDroppingSetter set_font, Nothing)

instance NodeProperty Label3D "horizontal_alignment" Int 'False
         where
        nodeProperty
          = (get_horizontal_alignment,
             wrapDroppingSetter set_horizontal_alignment, Nothing)

instance NodeProperty Label3D "line_spacing" Float 'False where
        nodeProperty
          = (get_line_spacing, wrapDroppingSetter set_line_spacing, Nothing)

instance NodeProperty Label3D "modulate" Color 'False where
        nodeProperty
          = (get_modulate, wrapDroppingSetter set_modulate, Nothing)

instance NodeProperty Label3D "no_depth_test" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 2 get_draw_flag,
             wrapIndexedSetter 2 set_draw_flag, Nothing)

instance NodeProperty Label3D "offset" Vector2 'False where
        nodeProperty = (get_offset, wrapDroppingSetter set_offset, Nothing)

instance NodeProperty Label3D "outline_modulate" Color 'False where
        nodeProperty
          = (get_outline_modulate, wrapDroppingSetter set_outline_modulate,
             Nothing)

instance NodeProperty Label3D "outline_render_priority" Int 'False
         where
        nodeProperty
          = (get_outline_render_priority,
             wrapDroppingSetter set_outline_render_priority, Nothing)

instance NodeProperty Label3D "pixel_size" Float 'False where
        nodeProperty
          = (get_pixel_size, wrapDroppingSetter set_pixel_size, Nothing)

instance NodeProperty Label3D "render_priority" Int 'False where
        nodeProperty
          = (get_render_priority, wrapDroppingSetter set_render_priority,
             Nothing)

instance NodeProperty Label3D "shaded" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 0 get_draw_flag,
             wrapIndexedSetter 0 set_draw_flag, Nothing)

instance NodeProperty Label3D "text" GodotString 'False where
        nodeProperty = (get_text, wrapDroppingSetter set_text, Nothing)

instance NodeProperty Label3D "uppercase" Bool 'False where
        nodeProperty
          = (is_uppercase, wrapDroppingSetter set_uppercase, Nothing)

instance NodeProperty Label3D "vertical_alignment" Int 'False where
        nodeProperty
          = (get_vertical_alignment,
             wrapDroppingSetter set_vertical_alignment, Nothing)

instance NodeProperty Label3D "width" Float 'False where
        nodeProperty = (get_width, wrapDroppingSetter set_width, Nothing)

{-# NOINLINE bindLabel3D__font_changed #-}

bindLabel3D__font_changed :: MethodBind
bindLabel3D__font_changed
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "_font_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_font_changed :: (Label3D :< cls, Object :< cls) => cls -> IO ()
_font_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D__font_changed (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "_font_changed" '[] (IO ()) where
        nodeMethod = Godot.Core.Label3D._font_changed

{-# NOINLINE bindLabel3D__im_update #-}

bindLabel3D__im_update :: MethodBind
bindLabel3D__im_update
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "_im_update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_im_update :: (Label3D :< cls, Object :< cls) => cls -> IO ()
_im_update cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D__im_update (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "_im_update" '[] (IO ()) where
        nodeMethod = Godot.Core.Label3D._im_update

{-# NOINLINE bindLabel3D__queue_update #-}

bindLabel3D__queue_update :: MethodBind
bindLabel3D__queue_update
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "_queue_update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_queue_update :: (Label3D :< cls, Object :< cls) => cls -> IO ()
_queue_update cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D__queue_update (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "_queue_update" '[] (IO ()) where
        nodeMethod = Godot.Core.Label3D._queue_update

{-# NOINLINE bindLabel3D_generate_triangle_mesh #-}

-- | Returns a @TriangleMesh@ with the label's vertices following its current configuration (such as its @pixel_size@).
bindLabel3D_generate_triangle_mesh :: MethodBind
bindLabel3D_generate_triangle_mesh
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "generate_triangle_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a @TriangleMesh@ with the label's vertices following its current configuration (such as its @pixel_size@).
generate_triangle_mesh ::
                         (Label3D :< cls, Object :< cls) => cls -> IO TriangleMesh
generate_triangle_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_generate_triangle_mesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod Label3D "generate_triangle_mesh" '[]
           (IO TriangleMesh)
         where
        nodeMethod = Godot.Core.Label3D.generate_triangle_mesh

{-# NOINLINE bindLabel3D_get_alpha_cut_mode #-}

-- | The alpha cutting mode to use for the sprite. See @enum AlphaCutMode@ for possible values.
bindLabel3D_get_alpha_cut_mode :: MethodBind
bindLabel3D_get_alpha_cut_mode
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_alpha_cut_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The alpha cutting mode to use for the sprite. See @enum AlphaCutMode@ for possible values.
get_alpha_cut_mode ::
                     (Label3D :< cls, Object :< cls) => cls -> IO Int
get_alpha_cut_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_alpha_cut_mode (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "get_alpha_cut_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.Label3D.get_alpha_cut_mode

{-# NOINLINE bindLabel3D_get_alpha_scissor_threshold #-}

-- | Threshold at which the alpha scissor will discard values.
bindLabel3D_get_alpha_scissor_threshold :: MethodBind
bindLabel3D_get_alpha_scissor_threshold
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_alpha_scissor_threshold" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Threshold at which the alpha scissor will discard values.
get_alpha_scissor_threshold ::
                              (Label3D :< cls, Object :< cls) => cls -> IO Float
get_alpha_scissor_threshold cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_alpha_scissor_threshold
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "get_alpha_scissor_threshold" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Label3D.get_alpha_scissor_threshold

{-# NOINLINE bindLabel3D_get_autowrap #-}

-- | If @true@, wraps the text to the @width@.
bindLabel3D_get_autowrap :: MethodBind
bindLabel3D_get_autowrap
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_autowrap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, wraps the text to the @width@.
get_autowrap :: (Label3D :< cls, Object :< cls) => cls -> IO Bool
get_autowrap cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_autowrap (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "get_autowrap" '[] (IO Bool) where
        nodeMethod = Godot.Core.Label3D.get_autowrap

{-# NOINLINE bindLabel3D_get_billboard_mode #-}

-- | The billboard mode to use for the label. See @enum Material3D.BillboardMode@ for possible values.
bindLabel3D_get_billboard_mode :: MethodBind
bindLabel3D_get_billboard_mode
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_billboard_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The billboard mode to use for the label. See @enum Material3D.BillboardMode@ for possible values.
get_billboard_mode ::
                     (Label3D :< cls, Object :< cls) => cls -> IO Int
get_billboard_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_billboard_mode (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "get_billboard_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.Label3D.get_billboard_mode

{-# NOINLINE bindLabel3D_get_draw_flag #-}

-- | Returns the value of the specified flag.
bindLabel3D_get_draw_flag :: MethodBind
bindLabel3D_get_draw_flag
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_draw_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of the specified flag.
get_draw_flag ::
                (Label3D :< cls, Object :< cls) => cls -> Int -> IO Bool
get_draw_flag cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_draw_flag (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "get_draw_flag" '[Int] (IO Bool) where
        nodeMethod = Godot.Core.Label3D.get_draw_flag

{-# NOINLINE bindLabel3D_get_font #-}

-- | @Font@ used for the @Label3D@'s text.
bindLabel3D_get_font :: MethodBind
bindLabel3D_get_font
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Font@ used for the @Label3D@'s text.
get_font :: (Label3D :< cls, Object :< cls) => cls -> IO Font
get_font cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_font (upcast cls) arrPtr len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod Label3D "get_font" '[] (IO Font) where
        nodeMethod = Godot.Core.Label3D.get_font

{-# NOINLINE bindLabel3D_get_horizontal_alignment #-}

-- | Controls the text's horizontal alignment. Supports left, center, right. Set it to one of the @enum Align@ constants.
bindLabel3D_get_horizontal_alignment :: MethodBind
bindLabel3D_get_horizontal_alignment
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_horizontal_alignment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the text's horizontal alignment. Supports left, center, right. Set it to one of the @enum Align@ constants.
get_horizontal_alignment ::
                           (Label3D :< cls, Object :< cls) => cls -> IO Int
get_horizontal_alignment cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_horizontal_alignment
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "get_horizontal_alignment" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Label3D.get_horizontal_alignment

{-# NOINLINE bindLabel3D_get_line_spacing #-}

-- | Vertical space between lines in multiline @Label3D@.
bindLabel3D_get_line_spacing :: MethodBind
bindLabel3D_get_line_spacing
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_line_spacing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Vertical space between lines in multiline @Label3D@.
get_line_spacing ::
                   (Label3D :< cls, Object :< cls) => cls -> IO Float
get_line_spacing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_line_spacing (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "get_line_spacing" '[] (IO Float) where
        nodeMethod = Godot.Core.Label3D.get_line_spacing

{-# NOINLINE bindLabel3D_get_modulate #-}

-- | Text @Color@ of the @Label3D@.
bindLabel3D_get_modulate :: MethodBind
bindLabel3D_get_modulate
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Text @Color@ of the @Label3D@.
get_modulate :: (Label3D :< cls, Object :< cls) => cls -> IO Color
get_modulate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_modulate (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "get_modulate" '[] (IO Color) where
        nodeMethod = Godot.Core.Label3D.get_modulate

{-# NOINLINE bindLabel3D_get_offset #-}

-- | The text drawing offset (in pixels).
bindLabel3D_get_offset :: MethodBind
bindLabel3D_get_offset
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The text drawing offset (in pixels).
get_offset :: (Label3D :< cls, Object :< cls) => cls -> IO Vector2
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_offset (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "get_offset" '[] (IO Vector2) where
        nodeMethod = Godot.Core.Label3D.get_offset

{-# NOINLINE bindLabel3D_get_outline_modulate #-}

-- | The tint of @Font@'s outline.
bindLabel3D_get_outline_modulate :: MethodBind
bindLabel3D_get_outline_modulate
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_outline_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The tint of @Font@'s outline.
get_outline_modulate ::
                       (Label3D :< cls, Object :< cls) => cls -> IO Color
get_outline_modulate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_outline_modulate
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "get_outline_modulate" '[] (IO Color)
         where
        nodeMethod = Godot.Core.Label3D.get_outline_modulate

{-# NOINLINE bindLabel3D_get_outline_render_priority #-}

-- | Sets the render priority for the text outline. Higher priority objects will be sorted in front of lower priority objects.
--   			__Note:__ This only applies if @alpha_cut@ is set to @ALPHA_CUT_DISABLED@ (default value).
--   			__Note:__ This only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are not sorted, while transparent objects are sorted from back to front (subject to priority).
bindLabel3D_get_outline_render_priority :: MethodBind
bindLabel3D_get_outline_render_priority
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_outline_render_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the render priority for the text outline. Higher priority objects will be sorted in front of lower priority objects.
--   			__Note:__ This only applies if @alpha_cut@ is set to @ALPHA_CUT_DISABLED@ (default value).
--   			__Note:__ This only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are not sorted, while transparent objects are sorted from back to front (subject to priority).
get_outline_render_priority ::
                              (Label3D :< cls, Object :< cls) => cls -> IO Int
get_outline_render_priority cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_outline_render_priority
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "get_outline_render_priority" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.Label3D.get_outline_render_priority

{-# NOINLINE bindLabel3D_get_pixel_size #-}

-- | The size of one pixel's width on the label to scale it in 3D.
bindLabel3D_get_pixel_size :: MethodBind
bindLabel3D_get_pixel_size
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_pixel_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of one pixel's width on the label to scale it in 3D.
get_pixel_size ::
                 (Label3D :< cls, Object :< cls) => cls -> IO Float
get_pixel_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_pixel_size (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "get_pixel_size" '[] (IO Float) where
        nodeMethod = Godot.Core.Label3D.get_pixel_size

{-# NOINLINE bindLabel3D_get_render_priority #-}

-- | Sets the render priority for the text. Higher priority objects will be sorted in front of lower priority objects.
--   			__Note:__ This only applies if @alpha_cut@ is set to @ALPHA_CUT_DISABLED@ (default value).
--   			__Note:__ This only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are not sorted, while transparent objects are sorted from back to front (subject to priority).
bindLabel3D_get_render_priority :: MethodBind
bindLabel3D_get_render_priority
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_render_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the render priority for the text. Higher priority objects will be sorted in front of lower priority objects.
--   			__Note:__ This only applies if @alpha_cut@ is set to @ALPHA_CUT_DISABLED@ (default value).
--   			__Note:__ This only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are not sorted, while transparent objects are sorted from back to front (subject to priority).
get_render_priority ::
                      (Label3D :< cls, Object :< cls) => cls -> IO Int
get_render_priority cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_render_priority (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "get_render_priority" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Label3D.get_render_priority

{-# NOINLINE bindLabel3D_get_text #-}

-- | The text to display on screen.
bindLabel3D_get_text :: MethodBind
bindLabel3D_get_text
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The text to display on screen.
get_text ::
           (Label3D :< cls, Object :< cls) => cls -> IO GodotString
get_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_text (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "get_text" '[] (IO GodotString) where
        nodeMethod = Godot.Core.Label3D.get_text

{-# NOINLINE bindLabel3D_get_vertical_alignment #-}

-- | Controls the text's vertical alignment. Supports top, center, bottom. Set it to one of the @enum VAlign@ constants.
bindLabel3D_get_vertical_alignment :: MethodBind
bindLabel3D_get_vertical_alignment
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_vertical_alignment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the text's vertical alignment. Supports top, center, bottom. Set it to one of the @enum VAlign@ constants.
get_vertical_alignment ::
                         (Label3D :< cls, Object :< cls) => cls -> IO Int
get_vertical_alignment cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_vertical_alignment
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "get_vertical_alignment" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Label3D.get_vertical_alignment

{-# NOINLINE bindLabel3D_get_width #-}

-- | Text width (in pixels), used for autowrap and fill alignment.
bindLabel3D_get_width :: MethodBind
bindLabel3D_get_width
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "get_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Text width (in pixels), used for autowrap and fill alignment.
get_width :: (Label3D :< cls, Object :< cls) => cls -> IO Float
get_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_get_width (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "get_width" '[] (IO Float) where
        nodeMethod = Godot.Core.Label3D.get_width

{-# NOINLINE bindLabel3D_is_uppercase #-}

-- | If @true@, all the text displays as UPPERCASE.
bindLabel3D_is_uppercase :: MethodBind
bindLabel3D_is_uppercase
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "is_uppercase" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, all the text displays as UPPERCASE.
is_uppercase :: (Label3D :< cls, Object :< cls) => cls -> IO Bool
is_uppercase cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_is_uppercase (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "is_uppercase" '[] (IO Bool) where
        nodeMethod = Godot.Core.Label3D.is_uppercase

{-# NOINLINE bindLabel3D_set_alpha_cut_mode #-}

-- | The alpha cutting mode to use for the sprite. See @enum AlphaCutMode@ for possible values.
bindLabel3D_set_alpha_cut_mode :: MethodBind
bindLabel3D_set_alpha_cut_mode
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_alpha_cut_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The alpha cutting mode to use for the sprite. See @enum AlphaCutMode@ for possible values.
set_alpha_cut_mode ::
                     (Label3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_alpha_cut_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_alpha_cut_mode (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_alpha_cut_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Label3D.set_alpha_cut_mode

{-# NOINLINE bindLabel3D_set_alpha_scissor_threshold #-}

-- | Threshold at which the alpha scissor will discard values.
bindLabel3D_set_alpha_scissor_threshold :: MethodBind
bindLabel3D_set_alpha_scissor_threshold
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_alpha_scissor_threshold" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Threshold at which the alpha scissor will discard values.
set_alpha_scissor_threshold ::
                              (Label3D :< cls, Object :< cls) => cls -> Float -> IO ()
set_alpha_scissor_threshold cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_alpha_scissor_threshold
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_alpha_scissor_threshold" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Label3D.set_alpha_scissor_threshold

{-# NOINLINE bindLabel3D_set_autowrap #-}

-- | If @true@, wraps the text to the @width@.
bindLabel3D_set_autowrap :: MethodBind
bindLabel3D_set_autowrap
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_autowrap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, wraps the text to the @width@.
set_autowrap ::
               (Label3D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_autowrap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_autowrap (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_autowrap" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Label3D.set_autowrap

{-# NOINLINE bindLabel3D_set_billboard_mode #-}

-- | The billboard mode to use for the label. See @enum Material3D.BillboardMode@ for possible values.
bindLabel3D_set_billboard_mode :: MethodBind
bindLabel3D_set_billboard_mode
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_billboard_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The billboard mode to use for the label. See @enum Material3D.BillboardMode@ for possible values.
set_billboard_mode ::
                     (Label3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_billboard_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_billboard_mode (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_billboard_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Label3D.set_billboard_mode

{-# NOINLINE bindLabel3D_set_draw_flag #-}

-- | If @true@, the specified flag will be enabled. See @enum Label3D.DrawFlags@ for a list of flags.
bindLabel3D_set_draw_flag :: MethodBind
bindLabel3D_set_draw_flag
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_draw_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the specified flag will be enabled. See @enum Label3D.DrawFlags@ for a list of flags.
set_draw_flag ::
                (Label3D :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_draw_flag cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_draw_flag (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_draw_flag" '[Int, Bool] (IO ())
         where
        nodeMethod = Godot.Core.Label3D.set_draw_flag

{-# NOINLINE bindLabel3D_set_font #-}

-- | @Font@ used for the @Label3D@'s text.
bindLabel3D_set_font :: MethodBind
bindLabel3D_set_font
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Font@ used for the @Label3D@'s text.
set_font :: (Label3D :< cls, Object :< cls) => cls -> Font -> IO ()
set_font cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_font (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_font" '[Font] (IO ()) where
        nodeMethod = Godot.Core.Label3D.set_font

{-# NOINLINE bindLabel3D_set_horizontal_alignment #-}

-- | Controls the text's horizontal alignment. Supports left, center, right. Set it to one of the @enum Align@ constants.
bindLabel3D_set_horizontal_alignment :: MethodBind
bindLabel3D_set_horizontal_alignment
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_horizontal_alignment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the text's horizontal alignment. Supports left, center, right. Set it to one of the @enum Align@ constants.
set_horizontal_alignment ::
                           (Label3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_horizontal_alignment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_horizontal_alignment
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_horizontal_alignment" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Label3D.set_horizontal_alignment

{-# NOINLINE bindLabel3D_set_line_spacing #-}

-- | Vertical space between lines in multiline @Label3D@.
bindLabel3D_set_line_spacing :: MethodBind
bindLabel3D_set_line_spacing
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_line_spacing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Vertical space between lines in multiline @Label3D@.
set_line_spacing ::
                   (Label3D :< cls, Object :< cls) => cls -> Float -> IO ()
set_line_spacing cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_line_spacing (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_line_spacing" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Label3D.set_line_spacing

{-# NOINLINE bindLabel3D_set_modulate #-}

-- | Text @Color@ of the @Label3D@.
bindLabel3D_set_modulate :: MethodBind
bindLabel3D_set_modulate
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Text @Color@ of the @Label3D@.
set_modulate ::
               (Label3D :< cls, Object :< cls) => cls -> Color -> IO ()
set_modulate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_modulate (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_modulate" '[Color] (IO ()) where
        nodeMethod = Godot.Core.Label3D.set_modulate

{-# NOINLINE bindLabel3D_set_offset #-}

-- | The text drawing offset (in pixels).
bindLabel3D_set_offset :: MethodBind
bindLabel3D_set_offset
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The text drawing offset (in pixels).
set_offset ::
             (Label3D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_offset (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_offset" '[Vector2] (IO ()) where
        nodeMethod = Godot.Core.Label3D.set_offset

{-# NOINLINE bindLabel3D_set_outline_modulate #-}

-- | The tint of @Font@'s outline.
bindLabel3D_set_outline_modulate :: MethodBind
bindLabel3D_set_outline_modulate
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_outline_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The tint of @Font@'s outline.
set_outline_modulate ::
                       (Label3D :< cls, Object :< cls) => cls -> Color -> IO ()
set_outline_modulate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_outline_modulate
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_outline_modulate" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.Label3D.set_outline_modulate

{-# NOINLINE bindLabel3D_set_outline_render_priority #-}

-- | Sets the render priority for the text outline. Higher priority objects will be sorted in front of lower priority objects.
--   			__Note:__ This only applies if @alpha_cut@ is set to @ALPHA_CUT_DISABLED@ (default value).
--   			__Note:__ This only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are not sorted, while transparent objects are sorted from back to front (subject to priority).
bindLabel3D_set_outline_render_priority :: MethodBind
bindLabel3D_set_outline_render_priority
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_outline_render_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the render priority for the text outline. Higher priority objects will be sorted in front of lower priority objects.
--   			__Note:__ This only applies if @alpha_cut@ is set to @ALPHA_CUT_DISABLED@ (default value).
--   			__Note:__ This only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are not sorted, while transparent objects are sorted from back to front (subject to priority).
set_outline_render_priority ::
                              (Label3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_outline_render_priority cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_outline_render_priority
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_outline_render_priority" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Label3D.set_outline_render_priority

{-# NOINLINE bindLabel3D_set_pixel_size #-}

-- | The size of one pixel's width on the label to scale it in 3D.
bindLabel3D_set_pixel_size :: MethodBind
bindLabel3D_set_pixel_size
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_pixel_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of one pixel's width on the label to scale it in 3D.
set_pixel_size ::
                 (Label3D :< cls, Object :< cls) => cls -> Float -> IO ()
set_pixel_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_pixel_size (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_pixel_size" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Label3D.set_pixel_size

{-# NOINLINE bindLabel3D_set_render_priority #-}

-- | Sets the render priority for the text. Higher priority objects will be sorted in front of lower priority objects.
--   			__Note:__ This only applies if @alpha_cut@ is set to @ALPHA_CUT_DISABLED@ (default value).
--   			__Note:__ This only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are not sorted, while transparent objects are sorted from back to front (subject to priority).
bindLabel3D_set_render_priority :: MethodBind
bindLabel3D_set_render_priority
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_render_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the render priority for the text. Higher priority objects will be sorted in front of lower priority objects.
--   			__Note:__ This only applies if @alpha_cut@ is set to @ALPHA_CUT_DISABLED@ (default value).
--   			__Note:__ This only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are not sorted, while transparent objects are sorted from back to front (subject to priority).
set_render_priority ::
                      (Label3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_render_priority cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_render_priority (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_render_priority" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Label3D.set_render_priority

{-# NOINLINE bindLabel3D_set_text #-}

-- | The text to display on screen.
bindLabel3D_set_text :: MethodBind
bindLabel3D_set_text
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The text to display on screen.
set_text ::
           (Label3D :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_text (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_text" '[GodotString] (IO ()) where
        nodeMethod = Godot.Core.Label3D.set_text

{-# NOINLINE bindLabel3D_set_uppercase #-}

-- | If @true@, all the text displays as UPPERCASE.
bindLabel3D_set_uppercase :: MethodBind
bindLabel3D_set_uppercase
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_uppercase" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, all the text displays as UPPERCASE.
set_uppercase ::
                (Label3D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_uppercase cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_uppercase (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_uppercase" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Label3D.set_uppercase

{-# NOINLINE bindLabel3D_set_vertical_alignment #-}

-- | Controls the text's vertical alignment. Supports top, center, bottom. Set it to one of the @enum VAlign@ constants.
bindLabel3D_set_vertical_alignment :: MethodBind
bindLabel3D_set_vertical_alignment
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_vertical_alignment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the text's vertical alignment. Supports top, center, bottom. Set it to one of the @enum VAlign@ constants.
set_vertical_alignment ::
                         (Label3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_vertical_alignment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_vertical_alignment
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_vertical_alignment" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Label3D.set_vertical_alignment

{-# NOINLINE bindLabel3D_set_width #-}

-- | Text width (in pixels), used for autowrap and fill alignment.
bindLabel3D_set_width :: MethodBind
bindLabel3D_set_width
  = unsafePerformIO $
      withCString "Label3D" $
        \ clsNamePtr ->
          withCString "set_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Text width (in pixels), used for autowrap and fill alignment.
set_width ::
            (Label3D :< cls, Object :< cls) => cls -> Float -> IO ()
set_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel3D_set_width (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Label3D "set_width" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Label3D.set_width