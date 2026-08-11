{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GradientTexture2D
       (Godot.Core.GradientTexture2D._FILL_LINEAR,
        Godot.Core.GradientTexture2D._REPEAT_MIRROR,
        Godot.Core.GradientTexture2D._REPEAT,
        Godot.Core.GradientTexture2D._REPEAT_NONE,
        Godot.Core.GradientTexture2D._FILL_RADIAL,
        Godot.Core.GradientTexture2D.get_height,
        Godot.Core.GradientTexture2D.get_width,
        Godot.Core.GradientTexture2D._queue_update,
        Godot.Core.GradientTexture2D._update,
        Godot.Core.GradientTexture2D.get_fill,
        Godot.Core.GradientTexture2D.get_fill_from,
        Godot.Core.GradientTexture2D.get_fill_to,
        Godot.Core.GradientTexture2D.get_gradient,
        Godot.Core.GradientTexture2D.get_repeat,
        Godot.Core.GradientTexture2D.is_using_hdr,
        Godot.Core.GradientTexture2D.set_fill,
        Godot.Core.GradientTexture2D.set_fill_from,
        Godot.Core.GradientTexture2D.set_fill_to,
        Godot.Core.GradientTexture2D.set_gradient,
        Godot.Core.GradientTexture2D.set_height,
        Godot.Core.GradientTexture2D.set_repeat,
        Godot.Core.GradientTexture2D.set_use_hdr,
        Godot.Core.GradientTexture2D.set_width)
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
import Godot.Core.Texture()

_FILL_LINEAR :: Int
_FILL_LINEAR = 0

_REPEAT_MIRROR :: Int
_REPEAT_MIRROR = 2

_REPEAT :: Int
_REPEAT = 1

_REPEAT_NONE :: Int
_REPEAT_NONE = 0

_FILL_RADIAL :: Int
_FILL_RADIAL = 1

instance NodeProperty GradientTexture2D "fill" Int 'False where
        nodeProperty = (get_fill, wrapDroppingSetter set_fill, Nothing)

instance NodeProperty GradientTexture2D "fill_from" Vector2 'False
         where
        nodeProperty
          = (get_fill_from, wrapDroppingSetter set_fill_from, Nothing)

instance NodeProperty GradientTexture2D "fill_to" Vector2 'False
         where
        nodeProperty
          = (get_fill_to, wrapDroppingSetter set_fill_to, Nothing)

instance NodeProperty GradientTexture2D "gradient" Gradient 'False
         where
        nodeProperty
          = (get_gradient, wrapDroppingSetter set_gradient, Nothing)

{-# NOINLINE bindGradientTexture2D_get_height #-}

-- | The number of vertical color samples that will be obtained from the @Gradient@, which also represents the texture's height.
bindGradientTexture2D_get_height :: MethodBind
bindGradientTexture2D_get_height
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of vertical color samples that will be obtained from the @Gradient@, which also represents the texture's height.
get_height ::
             (GradientTexture2D :< cls, Object :< cls) => cls -> IO Int
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D_get_height
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "get_height" '[] (IO Int)
         where
        nodeMethod = Godot.Core.GradientTexture2D.get_height

instance NodeProperty GradientTexture2D "height" Int 'False where
        nodeProperty = (get_height, wrapDroppingSetter set_height, Nothing)

instance NodeProperty GradientTexture2D "repeat" Int 'False where
        nodeProperty = (get_repeat, wrapDroppingSetter set_repeat, Nothing)

instance NodeProperty GradientTexture2D "use_hdr" Bool 'False where
        nodeProperty
          = (is_using_hdr, wrapDroppingSetter set_use_hdr, Nothing)

{-# NOINLINE bindGradientTexture2D_get_width #-}

-- | The number of horizontal color samples that will be obtained from the @Gradient@, which also represents the texture's width.
bindGradientTexture2D_get_width :: MethodBind
bindGradientTexture2D_get_width
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "get_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of horizontal color samples that will be obtained from the @Gradient@, which also represents the texture's width.
get_width ::
            (GradientTexture2D :< cls, Object :< cls) => cls -> IO Int
get_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D_get_width (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "get_width" '[] (IO Int)
         where
        nodeMethod = Godot.Core.GradientTexture2D.get_width

instance NodeProperty GradientTexture2D "width" Int 'False where
        nodeProperty = (get_width, wrapDroppingSetter set_width, Nothing)

{-# NOINLINE bindGradientTexture2D__queue_update #-}

bindGradientTexture2D__queue_update :: MethodBind
bindGradientTexture2D__queue_update
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "_queue_update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_queue_update ::
                (GradientTexture2D :< cls, Object :< cls) => cls -> IO ()
_queue_update cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D__queue_update
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "_queue_update" '[] (IO ())
         where
        nodeMethod = Godot.Core.GradientTexture2D._queue_update

{-# NOINLINE bindGradientTexture2D__update #-}

bindGradientTexture2D__update :: MethodBind
bindGradientTexture2D__update
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "_update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update ::
          (GradientTexture2D :< cls, Object :< cls) => cls -> IO ()
_update cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D__update (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "_update" '[] (IO ()) where
        nodeMethod = Godot.Core.GradientTexture2D._update

{-# NOINLINE bindGradientTexture2D_get_fill #-}

-- | The gradient fill type, one of the @enum Fill@ values. The texture is filled by interpolating colors starting from @fill_from@ to @fill_to@ offsets.
bindGradientTexture2D_get_fill :: MethodBind
bindGradientTexture2D_get_fill
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "get_fill" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The gradient fill type, one of the @enum Fill@ values. The texture is filled by interpolating colors starting from @fill_from@ to @fill_to@ offsets.
get_fill ::
           (GradientTexture2D :< cls, Object :< cls) => cls -> IO Int
get_fill cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D_get_fill (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "get_fill" '[] (IO Int) where
        nodeMethod = Godot.Core.GradientTexture2D.get_fill

{-# NOINLINE bindGradientTexture2D_get_fill_from #-}

-- | The initial offset used to fill the texture specified in UV coordinates.
bindGradientTexture2D_get_fill_from :: MethodBind
bindGradientTexture2D_get_fill_from
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "get_fill_from" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The initial offset used to fill the texture specified in UV coordinates.
get_fill_from ::
                (GradientTexture2D :< cls, Object :< cls) => cls -> IO Vector2
get_fill_from cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D_get_fill_from
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "get_fill_from" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.GradientTexture2D.get_fill_from

{-# NOINLINE bindGradientTexture2D_get_fill_to #-}

-- | The final offset used to fill the texture specified in UV coordinates.
bindGradientTexture2D_get_fill_to :: MethodBind
bindGradientTexture2D_get_fill_to
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "get_fill_to" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The final offset used to fill the texture specified in UV coordinates.
get_fill_to ::
              (GradientTexture2D :< cls, Object :< cls) => cls -> IO Vector2
get_fill_to cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D_get_fill_to
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "get_fill_to" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.GradientTexture2D.get_fill_to

{-# NOINLINE bindGradientTexture2D_get_gradient #-}

-- | The @Gradient@ used to fill the texture.
bindGradientTexture2D_get_gradient :: MethodBind
bindGradientTexture2D_get_gradient
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "get_gradient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Gradient@ used to fill the texture.
get_gradient ::
               (GradientTexture2D :< cls, Object :< cls) => cls -> IO Gradient
get_gradient cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D_get_gradient
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod GradientTexture2D "get_gradient" '[]
           (IO Gradient)
         where
        nodeMethod = Godot.Core.GradientTexture2D.get_gradient

{-# NOINLINE bindGradientTexture2D_get_repeat #-}

-- | The gradient repeat type, one of the @enum Repeat@ values. The texture is filled starting from @fill_from@ to @fill_to@ offsets by default, but the gradient fill can be repeated to cover the entire texture.
bindGradientTexture2D_get_repeat :: MethodBind
bindGradientTexture2D_get_repeat
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "get_repeat" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The gradient repeat type, one of the @enum Repeat@ values. The texture is filled starting from @fill_from@ to @fill_to@ offsets by default, but the gradient fill can be repeated to cover the entire texture.
get_repeat ::
             (GradientTexture2D :< cls, Object :< cls) => cls -> IO Int
get_repeat cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D_get_repeat
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "get_repeat" '[] (IO Int)
         where
        nodeMethod = Godot.Core.GradientTexture2D.get_repeat

{-# NOINLINE bindGradientTexture2D_is_using_hdr #-}

-- | If @true@, the generated texture will support high dynamic range (@Image.FORMAT_RGBAF@ format). This allows for glow effects to work if @Environment.glow_enabled@ is @true@. If @false@, the generated texture will use low dynamic range; overbright colors will be clamped (@Image.FORMAT_RGBA8@ format).
bindGradientTexture2D_is_using_hdr :: MethodBind
bindGradientTexture2D_is_using_hdr
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "is_using_hdr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the generated texture will support high dynamic range (@Image.FORMAT_RGBAF@ format). This allows for glow effects to work if @Environment.glow_enabled@ is @true@. If @false@, the generated texture will use low dynamic range; overbright colors will be clamped (@Image.FORMAT_RGBA8@ format).
is_using_hdr ::
               (GradientTexture2D :< cls, Object :< cls) => cls -> IO Bool
is_using_hdr cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D_is_using_hdr
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "is_using_hdr" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.GradientTexture2D.is_using_hdr

{-# NOINLINE bindGradientTexture2D_set_fill #-}

-- | The gradient fill type, one of the @enum Fill@ values. The texture is filled by interpolating colors starting from @fill_from@ to @fill_to@ offsets.
bindGradientTexture2D_set_fill :: MethodBind
bindGradientTexture2D_set_fill
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "set_fill" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The gradient fill type, one of the @enum Fill@ values. The texture is filled by interpolating colors starting from @fill_from@ to @fill_to@ offsets.
set_fill ::
           (GradientTexture2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_fill cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D_set_fill (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "set_fill" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GradientTexture2D.set_fill

{-# NOINLINE bindGradientTexture2D_set_fill_from #-}

-- | The initial offset used to fill the texture specified in UV coordinates.
bindGradientTexture2D_set_fill_from :: MethodBind
bindGradientTexture2D_set_fill_from
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "set_fill_from" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The initial offset used to fill the texture specified in UV coordinates.
set_fill_from ::
                (GradientTexture2D :< cls, Object :< cls) =>
                cls -> Vector2 -> IO ()
set_fill_from cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D_set_fill_from
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "set_fill_from" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.GradientTexture2D.set_fill_from

{-# NOINLINE bindGradientTexture2D_set_fill_to #-}

-- | The final offset used to fill the texture specified in UV coordinates.
bindGradientTexture2D_set_fill_to :: MethodBind
bindGradientTexture2D_set_fill_to
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "set_fill_to" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The final offset used to fill the texture specified in UV coordinates.
set_fill_to ::
              (GradientTexture2D :< cls, Object :< cls) =>
              cls -> Vector2 -> IO ()
set_fill_to cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D_set_fill_to
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "set_fill_to" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.GradientTexture2D.set_fill_to

{-# NOINLINE bindGradientTexture2D_set_gradient #-}

-- | The @Gradient@ used to fill the texture.
bindGradientTexture2D_set_gradient :: MethodBind
bindGradientTexture2D_set_gradient
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "set_gradient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Gradient@ used to fill the texture.
set_gradient ::
               (GradientTexture2D :< cls, Object :< cls) =>
               cls -> Gradient -> IO ()
set_gradient cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D_set_gradient
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "set_gradient" '[Gradient]
           (IO ())
         where
        nodeMethod = Godot.Core.GradientTexture2D.set_gradient

{-# NOINLINE bindGradientTexture2D_set_height #-}

-- | The number of vertical color samples that will be obtained from the @Gradient@, which also represents the texture's height.
bindGradientTexture2D_set_height :: MethodBind
bindGradientTexture2D_set_height
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "set_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of vertical color samples that will be obtained from the @Gradient@, which also represents the texture's height.
set_height ::
             (GradientTexture2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D_set_height
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "set_height" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GradientTexture2D.set_height

{-# NOINLINE bindGradientTexture2D_set_repeat #-}

-- | The gradient repeat type, one of the @enum Repeat@ values. The texture is filled starting from @fill_from@ to @fill_to@ offsets by default, but the gradient fill can be repeated to cover the entire texture.
bindGradientTexture2D_set_repeat :: MethodBind
bindGradientTexture2D_set_repeat
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "set_repeat" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The gradient repeat type, one of the @enum Repeat@ values. The texture is filled starting from @fill_from@ to @fill_to@ offsets by default, but the gradient fill can be repeated to cover the entire texture.
set_repeat ::
             (GradientTexture2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_repeat cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D_set_repeat
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "set_repeat" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GradientTexture2D.set_repeat

{-# NOINLINE bindGradientTexture2D_set_use_hdr #-}

-- | If @true@, the generated texture will support high dynamic range (@Image.FORMAT_RGBAF@ format). This allows for glow effects to work if @Environment.glow_enabled@ is @true@. If @false@, the generated texture will use low dynamic range; overbright colors will be clamped (@Image.FORMAT_RGBA8@ format).
bindGradientTexture2D_set_use_hdr :: MethodBind
bindGradientTexture2D_set_use_hdr
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "set_use_hdr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the generated texture will support high dynamic range (@Image.FORMAT_RGBAF@ format). This allows for glow effects to work if @Environment.glow_enabled@ is @true@. If @false@, the generated texture will use low dynamic range; overbright colors will be clamped (@Image.FORMAT_RGBA8@ format).
set_use_hdr ::
              (GradientTexture2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_hdr cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D_set_use_hdr
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "set_use_hdr" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.GradientTexture2D.set_use_hdr

{-# NOINLINE bindGradientTexture2D_set_width #-}

-- | The number of horizontal color samples that will be obtained from the @Gradient@, which also represents the texture's width.
bindGradientTexture2D_set_width :: MethodBind
bindGradientTexture2D_set_width
  = unsafePerformIO $
      withCString "GradientTexture2D" $
        \ clsNamePtr ->
          withCString "set_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of horizontal color samples that will be obtained from the @Gradient@, which also represents the texture's width.
set_width ::
            (GradientTexture2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture2D_set_width (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GradientTexture2D "set_width" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GradientTexture2D.set_width