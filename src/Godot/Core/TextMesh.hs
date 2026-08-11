{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.TextMesh
       (Godot.Core.TextMesh._ALIGN_RIGHT, Godot.Core.TextMesh._ALIGN_LEFT,
        Godot.Core.TextMesh._ALIGN_CENTER,
        Godot.Core.TextMesh._font_changed,
        Godot.Core.TextMesh.get_curve_step, Godot.Core.TextMesh.get_depth,
        Godot.Core.TextMesh.get_font,
        Godot.Core.TextMesh.get_horizontal_alignment,
        Godot.Core.TextMesh.get_pixel_size, Godot.Core.TextMesh.get_text,
        Godot.Core.TextMesh.is_uppercase,
        Godot.Core.TextMesh.set_curve_step, Godot.Core.TextMesh.set_depth,
        Godot.Core.TextMesh.set_font,
        Godot.Core.TextMesh.set_horizontal_alignment,
        Godot.Core.TextMesh.set_pixel_size, Godot.Core.TextMesh.set_text,
        Godot.Core.TextMesh.set_uppercase)
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
import Godot.Core.PrimitiveMesh()

_ALIGN_RIGHT :: Int
_ALIGN_RIGHT = 2

_ALIGN_LEFT :: Int
_ALIGN_LEFT = 0

_ALIGN_CENTER :: Int
_ALIGN_CENTER = 1

instance NodeProperty TextMesh "curve_step" Float 'False where
        nodeProperty
          = (get_curve_step, wrapDroppingSetter set_curve_step, Nothing)

instance NodeProperty TextMesh "depth" Float 'False where
        nodeProperty = (get_depth, wrapDroppingSetter set_depth, Nothing)

instance NodeProperty TextMesh "font" Font 'False where
        nodeProperty = (get_font, wrapDroppingSetter set_font, Nothing)

instance NodeProperty TextMesh "horizontal_alignment" Int 'False
         where
        nodeProperty
          = (get_horizontal_alignment,
             wrapDroppingSetter set_horizontal_alignment, Nothing)

instance NodeProperty TextMesh "pixel_size" Float 'False where
        nodeProperty
          = (get_pixel_size, wrapDroppingSetter set_pixel_size, Nothing)

instance NodeProperty TextMesh "text" GodotString 'False where
        nodeProperty = (get_text, wrapDroppingSetter set_text, Nothing)

instance NodeProperty TextMesh "uppercase" Bool 'False where
        nodeProperty
          = (is_uppercase, wrapDroppingSetter set_uppercase, Nothing)

{-# NOINLINE bindTextMesh__font_changed #-}

bindTextMesh__font_changed :: MethodBind
bindTextMesh__font_changed
  = unsafePerformIO $
      withCString "TextMesh" $
        \ clsNamePtr ->
          withCString "_font_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_font_changed :: (TextMesh :< cls, Object :< cls) => cls -> IO ()
_font_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextMesh__font_changed (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TextMesh "_font_changed" '[] (IO ()) where
        nodeMethod = Godot.Core.TextMesh._font_changed

{-# NOINLINE bindTextMesh_get_curve_step #-}

-- | Step (in pixels) used to approximate Bézier curves.
bindTextMesh_get_curve_step :: MethodBind
bindTextMesh_get_curve_step
  = unsafePerformIO $
      withCString "TextMesh" $
        \ clsNamePtr ->
          withCString "get_curve_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Step (in pixels) used to approximate Bézier curves.
get_curve_step ::
                 (TextMesh :< cls, Object :< cls) => cls -> IO Float
get_curve_step cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextMesh_get_curve_step (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TextMesh "get_curve_step" '[] (IO Float) where
        nodeMethod = Godot.Core.TextMesh.get_curve_step

{-# NOINLINE bindTextMesh_get_depth #-}

-- | Depths of the mesh, if set to @0.0@ only front surface, is generated, and UV layout is changed to use full texture for the front face only.
bindTextMesh_get_depth :: MethodBind
bindTextMesh_get_depth
  = unsafePerformIO $
      withCString "TextMesh" $
        \ clsNamePtr ->
          withCString "get_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Depths of the mesh, if set to @0.0@ only front surface, is generated, and UV layout is changed to use full texture for the front face only.
get_depth :: (TextMesh :< cls, Object :< cls) => cls -> IO Float
get_depth cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextMesh_get_depth (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TextMesh "get_depth" '[] (IO Float) where
        nodeMethod = Godot.Core.TextMesh.get_depth

{-# NOINLINE bindTextMesh_get_font #-}

-- | @Font@ used for the @TextMesh@'s text.
bindTextMesh_get_font :: MethodBind
bindTextMesh_get_font
  = unsafePerformIO $
      withCString "TextMesh" $
        \ clsNamePtr ->
          withCString "get_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Font@ used for the @TextMesh@'s text.
get_font :: (TextMesh :< cls, Object :< cls) => cls -> IO Font
get_font cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextMesh_get_font (upcast cls) arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod TextMesh "get_font" '[] (IO Font) where
        nodeMethod = Godot.Core.TextMesh.get_font

{-# NOINLINE bindTextMesh_get_horizontal_alignment #-}

-- | Controls the text's horizontal alignment. Supports left, center and right. Set it to one of the @enum Align@ constants.
bindTextMesh_get_horizontal_alignment :: MethodBind
bindTextMesh_get_horizontal_alignment
  = unsafePerformIO $
      withCString "TextMesh" $
        \ clsNamePtr ->
          withCString "get_horizontal_alignment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the text's horizontal alignment. Supports left, center and right. Set it to one of the @enum Align@ constants.
get_horizontal_alignment ::
                           (TextMesh :< cls, Object :< cls) => cls -> IO Int
get_horizontal_alignment cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextMesh_get_horizontal_alignment
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TextMesh "get_horizontal_alignment" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.TextMesh.get_horizontal_alignment

{-# NOINLINE bindTextMesh_get_pixel_size #-}

-- | The size of one pixel's width on the text to scale it in 3D.
bindTextMesh_get_pixel_size :: MethodBind
bindTextMesh_get_pixel_size
  = unsafePerformIO $
      withCString "TextMesh" $
        \ clsNamePtr ->
          withCString "get_pixel_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of one pixel's width on the text to scale it in 3D.
get_pixel_size ::
                 (TextMesh :< cls, Object :< cls) => cls -> IO Float
get_pixel_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextMesh_get_pixel_size (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TextMesh "get_pixel_size" '[] (IO Float) where
        nodeMethod = Godot.Core.TextMesh.get_pixel_size

{-# NOINLINE bindTextMesh_get_text #-}

-- | The text to generate mesh from.
bindTextMesh_get_text :: MethodBind
bindTextMesh_get_text
  = unsafePerformIO $
      withCString "TextMesh" $
        \ clsNamePtr ->
          withCString "get_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The text to generate mesh from.
get_text ::
           (TextMesh :< cls, Object :< cls) => cls -> IO GodotString
get_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextMesh_get_text (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TextMesh "get_text" '[] (IO GodotString) where
        nodeMethod = Godot.Core.TextMesh.get_text

{-# NOINLINE bindTextMesh_is_uppercase #-}

-- | If @true@, all the text displays as UPPERCASE.
bindTextMesh_is_uppercase :: MethodBind
bindTextMesh_is_uppercase
  = unsafePerformIO $
      withCString "TextMesh" $
        \ clsNamePtr ->
          withCString "is_uppercase" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, all the text displays as UPPERCASE.
is_uppercase :: (TextMesh :< cls, Object :< cls) => cls -> IO Bool
is_uppercase cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextMesh_is_uppercase (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TextMesh "is_uppercase" '[] (IO Bool) where
        nodeMethod = Godot.Core.TextMesh.is_uppercase

{-# NOINLINE bindTextMesh_set_curve_step #-}

-- | Step (in pixels) used to approximate Bézier curves.
bindTextMesh_set_curve_step :: MethodBind
bindTextMesh_set_curve_step
  = unsafePerformIO $
      withCString "TextMesh" $
        \ clsNamePtr ->
          withCString "set_curve_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Step (in pixels) used to approximate Bézier curves.
set_curve_step ::
                 (TextMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_curve_step cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextMesh_set_curve_step (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TextMesh "set_curve_step" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.TextMesh.set_curve_step

{-# NOINLINE bindTextMesh_set_depth #-}

-- | Depths of the mesh, if set to @0.0@ only front surface, is generated, and UV layout is changed to use full texture for the front face only.
bindTextMesh_set_depth :: MethodBind
bindTextMesh_set_depth
  = unsafePerformIO $
      withCString "TextMesh" $
        \ clsNamePtr ->
          withCString "set_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Depths of the mesh, if set to @0.0@ only front surface, is generated, and UV layout is changed to use full texture for the front face only.
set_depth ::
            (TextMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_depth cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextMesh_set_depth (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TextMesh "set_depth" '[Float] (IO ()) where
        nodeMethod = Godot.Core.TextMesh.set_depth

{-# NOINLINE bindTextMesh_set_font #-}

-- | @Font@ used for the @TextMesh@'s text.
bindTextMesh_set_font :: MethodBind
bindTextMesh_set_font
  = unsafePerformIO $
      withCString "TextMesh" $
        \ clsNamePtr ->
          withCString "set_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Font@ used for the @TextMesh@'s text.
set_font ::
           (TextMesh :< cls, Object :< cls) => cls -> Font -> IO ()
set_font cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextMesh_set_font (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TextMesh "set_font" '[Font] (IO ()) where
        nodeMethod = Godot.Core.TextMesh.set_font

{-# NOINLINE bindTextMesh_set_horizontal_alignment #-}

-- | Controls the text's horizontal alignment. Supports left, center and right. Set it to one of the @enum Align@ constants.
bindTextMesh_set_horizontal_alignment :: MethodBind
bindTextMesh_set_horizontal_alignment
  = unsafePerformIO $
      withCString "TextMesh" $
        \ clsNamePtr ->
          withCString "set_horizontal_alignment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the text's horizontal alignment. Supports left, center and right. Set it to one of the @enum Align@ constants.
set_horizontal_alignment ::
                           (TextMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_horizontal_alignment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextMesh_set_horizontal_alignment
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TextMesh "set_horizontal_alignment" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TextMesh.set_horizontal_alignment

{-# NOINLINE bindTextMesh_set_pixel_size #-}

-- | The size of one pixel's width on the text to scale it in 3D.
bindTextMesh_set_pixel_size :: MethodBind
bindTextMesh_set_pixel_size
  = unsafePerformIO $
      withCString "TextMesh" $
        \ clsNamePtr ->
          withCString "set_pixel_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of one pixel's width on the text to scale it in 3D.
set_pixel_size ::
                 (TextMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_pixel_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextMesh_set_pixel_size (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TextMesh "set_pixel_size" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.TextMesh.set_pixel_size

{-# NOINLINE bindTextMesh_set_text #-}

-- | The text to generate mesh from.
bindTextMesh_set_text :: MethodBind
bindTextMesh_set_text
  = unsafePerformIO $
      withCString "TextMesh" $
        \ clsNamePtr ->
          withCString "set_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The text to generate mesh from.
set_text ::
           (TextMesh :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextMesh_set_text (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TextMesh "set_text" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.TextMesh.set_text

{-# NOINLINE bindTextMesh_set_uppercase #-}

-- | If @true@, all the text displays as UPPERCASE.
bindTextMesh_set_uppercase :: MethodBind
bindTextMesh_set_uppercase
  = unsafePerformIO $
      withCString "TextMesh" $
        \ clsNamePtr ->
          withCString "set_uppercase" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, all the text displays as UPPERCASE.
set_uppercase ::
                (TextMesh :< cls, Object :< cls) => cls -> Bool -> IO ()
set_uppercase cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextMesh_set_uppercase (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TextMesh "set_uppercase" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.TextMesh.set_uppercase