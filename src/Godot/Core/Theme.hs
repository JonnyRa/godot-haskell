{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Theme
       (Godot.Core.Theme._DATA_TYPE_MAX,
        Godot.Core.Theme._DATA_TYPE_COLOR,
        Godot.Core.Theme._DATA_TYPE_ICON,
        Godot.Core.Theme._DATA_TYPE_STYLEBOX,
        Godot.Core.Theme._DATA_TYPE_FONT,
        Godot.Core.Theme._DATA_TYPE_CONSTANT,
        Godot.Core.Theme._emit_theme_changed, Godot.Core.Theme.add_type,
        Godot.Core.Theme.clear, Godot.Core.Theme.clear_color,
        Godot.Core.Theme.clear_constant, Godot.Core.Theme.clear_font,
        Godot.Core.Theme.clear_icon, Godot.Core.Theme.clear_stylebox,
        Godot.Core.Theme.clear_theme_item,
        Godot.Core.Theme.clear_type_variation,
        Godot.Core.Theme.copy_default_theme, Godot.Core.Theme.copy_theme,
        Godot.Core.Theme.get_color, Godot.Core.Theme.get_color_list,
        Godot.Core.Theme.get_color_types, Godot.Core.Theme.get_constant,
        Godot.Core.Theme.get_constant_list,
        Godot.Core.Theme.get_constant_types,
        Godot.Core.Theme.get_default_font, Godot.Core.Theme.get_font,
        Godot.Core.Theme.get_font_list, Godot.Core.Theme.get_font_types,
        Godot.Core.Theme.get_icon, Godot.Core.Theme.get_icon_list,
        Godot.Core.Theme.get_icon_types, Godot.Core.Theme.get_stylebox,
        Godot.Core.Theme.get_stylebox_list,
        Godot.Core.Theme.get_stylebox_types,
        Godot.Core.Theme.get_theme_item,
        Godot.Core.Theme.get_theme_item_list,
        Godot.Core.Theme.get_theme_item_types,
        Godot.Core.Theme.get_type_list,
        Godot.Core.Theme.get_type_variation_base,
        Godot.Core.Theme.get_type_variation_list,
        Godot.Core.Theme.has_color, Godot.Core.Theme.has_constant,
        Godot.Core.Theme.has_default_font, Godot.Core.Theme.has_font,
        Godot.Core.Theme.has_icon, Godot.Core.Theme.has_stylebox,
        Godot.Core.Theme.has_theme_item,
        Godot.Core.Theme.is_type_variation, Godot.Core.Theme.merge_with,
        Godot.Core.Theme.remove_type, Godot.Core.Theme.rename_color,
        Godot.Core.Theme.rename_constant, Godot.Core.Theme.rename_font,
        Godot.Core.Theme.rename_icon, Godot.Core.Theme.rename_stylebox,
        Godot.Core.Theme.rename_theme_item, Godot.Core.Theme.set_color,
        Godot.Core.Theme.set_constant, Godot.Core.Theme.set_default_font,
        Godot.Core.Theme.set_font, Godot.Core.Theme.set_icon,
        Godot.Core.Theme.set_stylebox, Godot.Core.Theme.set_theme_item,
        Godot.Core.Theme.set_type_variation)
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
import Godot.Core.Resource()

_DATA_TYPE_MAX :: Int
_DATA_TYPE_MAX = 5

_DATA_TYPE_COLOR :: Int
_DATA_TYPE_COLOR = 0

_DATA_TYPE_ICON :: Int
_DATA_TYPE_ICON = 3

_DATA_TYPE_STYLEBOX :: Int
_DATA_TYPE_STYLEBOX = 4

_DATA_TYPE_FONT :: Int
_DATA_TYPE_FONT = 2

_DATA_TYPE_CONSTANT :: Int
_DATA_TYPE_CONSTANT = 1

instance NodeProperty Theme "default_font" Font 'False where
        nodeProperty
          = (get_default_font, wrapDroppingSetter set_default_font, Nothing)

{-# NOINLINE bindTheme__emit_theme_changed #-}

bindTheme__emit_theme_changed :: MethodBind
bindTheme__emit_theme_changed
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "_emit_theme_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_emit_theme_changed ::
                      (Theme :< cls, Object :< cls) => cls -> Maybe Bool -> IO ()
_emit_theme_changed cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme__emit_theme_changed (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "_emit_theme_changed" '[Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme._emit_theme_changed

{-# NOINLINE bindTheme_add_type #-}

-- | Adds an empty theme type for every valid data type.
--   				__Note:__ Empty types are not saved with the theme. This method only exists to perform in-memory changes to the resource. Use available @set_*@ methods to add theme items.
bindTheme_add_type :: MethodBind
bindTheme_add_type
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "add_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an empty theme type for every valid data type.
--   				__Note:__ Empty types are not saved with the theme. This method only exists to perform in-memory changes to the resource. Use available @set_*@ methods to add theme items.
add_type ::
           (Theme :< cls, Object :< cls) => cls -> GodotString -> IO ()
add_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_add_type (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "add_type" '[GodotString] (IO ()) where
        nodeMethod = Godot.Core.Theme.add_type

{-# NOINLINE bindTheme_clear #-}

-- | Clears all values on the theme.
bindTheme_clear :: MethodBind
bindTheme_clear
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears all values on the theme.
clear :: (Theme :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_clear (upcast cls) arrPtr len >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "clear" '[] (IO ()) where
        nodeMethod = Godot.Core.Theme.clear

{-# NOINLINE bindTheme_clear_color #-}

-- | Clears the @Color@ at @name@ if the theme has @theme_type@.
bindTheme_clear_color :: MethodBind
bindTheme_clear_color
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "clear_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the @Color@ at @name@ if the theme has @theme_type@.
clear_color ::
              (Theme :< cls, Object :< cls) =>
              cls -> GodotString -> GodotString -> IO ()
clear_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_clear_color (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "clear_color" '[GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.clear_color

{-# NOINLINE bindTheme_clear_constant #-}

-- | Clears the constant at @name@ if the theme has @theme_type@.
bindTheme_clear_constant :: MethodBind
bindTheme_clear_constant
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "clear_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the constant at @name@ if the theme has @theme_type@.
clear_constant ::
                 (Theme :< cls, Object :< cls) =>
                 cls -> GodotString -> GodotString -> IO ()
clear_constant cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_clear_constant (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "clear_constant"
           '[GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.clear_constant

{-# NOINLINE bindTheme_clear_font #-}

-- | Clears the @Font@ at @name@ if the theme has @theme_type@.
bindTheme_clear_font :: MethodBind
bindTheme_clear_font
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "clear_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the @Font@ at @name@ if the theme has @theme_type@.
clear_font ::
             (Theme :< cls, Object :< cls) =>
             cls -> GodotString -> GodotString -> IO ()
clear_font cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_clear_font (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "clear_font" '[GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.clear_font

{-# NOINLINE bindTheme_clear_icon #-}

-- | Clears the icon at @name@ if the theme has @theme_type@.
bindTheme_clear_icon :: MethodBind
bindTheme_clear_icon
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "clear_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the icon at @name@ if the theme has @theme_type@.
clear_icon ::
             (Theme :< cls, Object :< cls) =>
             cls -> GodotString -> GodotString -> IO ()
clear_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_clear_icon (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "clear_icon" '[GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.clear_icon

{-# NOINLINE bindTheme_clear_stylebox #-}

-- | Clears @StyleBox@ at @name@ if the theme has @theme_type@.
bindTheme_clear_stylebox :: MethodBind
bindTheme_clear_stylebox
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "clear_stylebox" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears @StyleBox@ at @name@ if the theme has @theme_type@.
clear_stylebox ::
                 (Theme :< cls, Object :< cls) =>
                 cls -> GodotString -> GodotString -> IO ()
clear_stylebox cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_clear_stylebox (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "clear_stylebox"
           '[GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.clear_stylebox

{-# NOINLINE bindTheme_clear_theme_item #-}

-- | Clears the theme item of @data_type@ at @name@ if the theme has @theme_type@.
bindTheme_clear_theme_item :: MethodBind
bindTheme_clear_theme_item
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "clear_theme_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the theme item of @data_type@ at @name@ if the theme has @theme_type@.
clear_theme_item ::
                   (Theme :< cls, Object :< cls) =>
                   cls -> Int -> GodotString -> GodotString -> IO ()
clear_theme_item cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_clear_theme_item (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "clear_theme_item"
           '[Int, GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.clear_theme_item

{-# NOINLINE bindTheme_clear_type_variation #-}

-- | Unmarks @theme_type@ as being a variation of another theme type. See @method set_type_variation@.
bindTheme_clear_type_variation :: MethodBind
bindTheme_clear_type_variation
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "clear_type_variation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Unmarks @theme_type@ as being a variation of another theme type. See @method set_type_variation@.
clear_type_variation ::
                       (Theme :< cls, Object :< cls) => cls -> GodotString -> IO ()
clear_type_variation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_clear_type_variation (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "clear_type_variation" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.clear_type_variation

{-# NOINLINE bindTheme_copy_default_theme #-}

-- | Sets the theme's values to a copy of the default theme values.
bindTheme_copy_default_theme :: MethodBind
bindTheme_copy_default_theme
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "copy_default_theme" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the theme's values to a copy of the default theme values.
copy_default_theme :: (Theme :< cls, Object :< cls) => cls -> IO ()
copy_default_theme cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_copy_default_theme (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "copy_default_theme" '[] (IO ()) where
        nodeMethod = Godot.Core.Theme.copy_default_theme

{-# NOINLINE bindTheme_copy_theme #-}

-- | Sets the theme's values to a copy of a given theme.
bindTheme_copy_theme :: MethodBind
bindTheme_copy_theme
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "copy_theme" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the theme's values to a copy of a given theme.
copy_theme ::
             (Theme :< cls, Object :< cls) => cls -> Theme -> IO ()
copy_theme cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_copy_theme (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "copy_theme" '[Theme] (IO ()) where
        nodeMethod = Godot.Core.Theme.copy_theme

{-# NOINLINE bindTheme_get_color #-}

-- | Returns the @Color@ at @name@ if the theme has @theme_type@.
bindTheme_get_color :: MethodBind
bindTheme_get_color
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Color@ at @name@ if the theme has @theme_type@.
get_color ::
            (Theme :< cls, Object :< cls) =>
            cls -> GodotString -> GodotString -> IO Color
get_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_color (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_color" '[GodotString, GodotString]
           (IO Color)
         where
        nodeMethod = Godot.Core.Theme.get_color

{-# NOINLINE bindTheme_get_color_list #-}

-- | Returns all the @Color@s as a @PoolStringArray@ filled with each @Color@'s name, for use in @method get_color@, if the theme has @theme_type@.
bindTheme_get_color_list :: MethodBind
bindTheme_get_color_list
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_color_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the @Color@s as a @PoolStringArray@ filled with each @Color@'s name, for use in @method get_color@, if the theme has @theme_type@.
get_color_list ::
                 (Theme :< cls, Object :< cls) =>
                 cls -> GodotString -> IO PoolStringArray
get_color_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_color_list (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_color_list" '[GodotString]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.Theme.get_color_list

{-# NOINLINE bindTheme_get_color_types #-}

-- | Returns all the @Color@ types as a @PoolStringArray@ filled with unique type names, for use in @method get_color@ and/or @method get_color_list@.
bindTheme_get_color_types :: MethodBind
bindTheme_get_color_types
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_color_types" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the @Color@ types as a @PoolStringArray@ filled with unique type names, for use in @method get_color@ and/or @method get_color_list@.
get_color_types ::
                  (Theme :< cls, Object :< cls) => cls -> IO PoolStringArray
get_color_types cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_color_types (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_color_types" '[]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.Theme.get_color_types

{-# NOINLINE bindTheme_get_constant #-}

-- | Returns the constant at @name@ if the theme has @theme_type@.
bindTheme_get_constant :: MethodBind
bindTheme_get_constant
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the constant at @name@ if the theme has @theme_type@.
get_constant ::
               (Theme :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> IO Int
get_constant cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_constant (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_constant"
           '[GodotString, GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.Theme.get_constant

{-# NOINLINE bindTheme_get_constant_list #-}

-- | Returns all the constants as a @PoolStringArray@ filled with each constant's name, for use in @method get_constant@, if the theme has @theme_type@.
bindTheme_get_constant_list :: MethodBind
bindTheme_get_constant_list
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_constant_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the constants as a @PoolStringArray@ filled with each constant's name, for use in @method get_constant@, if the theme has @theme_type@.
get_constant_list ::
                    (Theme :< cls, Object :< cls) =>
                    cls -> GodotString -> IO PoolStringArray
get_constant_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_constant_list (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_constant_list" '[GodotString]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.Theme.get_constant_list

{-# NOINLINE bindTheme_get_constant_types #-}

-- | Returns all the constant types as a @PoolStringArray@ filled with unique type names, for use in @method get_constant@ and/or @method get_constant_list@.
bindTheme_get_constant_types :: MethodBind
bindTheme_get_constant_types
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_constant_types" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the constant types as a @PoolStringArray@ filled with unique type names, for use in @method get_constant@ and/or @method get_constant_list@.
get_constant_types ::
                     (Theme :< cls, Object :< cls) => cls -> IO PoolStringArray
get_constant_types cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_constant_types (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_constant_types" '[]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.Theme.get_constant_types

{-# NOINLINE bindTheme_get_default_font #-}

-- | The default font of this @Theme@ resource. Used as a fallback value for font items defined in this theme, but having invalid values. If this value is also invalid, the global default value is used.
--   			Use @method has_default_font@ to check if this value is valid.
bindTheme_get_default_font :: MethodBind
bindTheme_get_default_font
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_default_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The default font of this @Theme@ resource. Used as a fallback value for font items defined in this theme, but having invalid values. If this value is also invalid, the global default value is used.
--   			Use @method has_default_font@ to check if this value is valid.
get_default_font :: (Theme :< cls, Object :< cls) => cls -> IO Font
get_default_font cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_default_font (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod Theme "get_default_font" '[] (IO Font) where
        nodeMethod = Godot.Core.Theme.get_default_font

{-# NOINLINE bindTheme_get_font #-}

-- | Returns the @Font@ at @name@ if the theme has @theme_type@. If such item does not exist and @default_font@ is set on the theme, the default font will be returned.
bindTheme_get_font :: MethodBind
bindTheme_get_font
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Font@ at @name@ if the theme has @theme_type@. If such item does not exist and @default_font@ is set on the theme, the default font will be returned.
get_font ::
           (Theme :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> IO Font
get_font cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_font (upcast cls) arrPtr len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod Theme "get_font" '[GodotString, GodotString]
           (IO Font)
         where
        nodeMethod = Godot.Core.Theme.get_font

{-# NOINLINE bindTheme_get_font_list #-}

-- | Returns all the @Font@s as a @PoolStringArray@ filled with each @Font@'s name, for use in @method get_font@, if the theme has @theme_type@.
bindTheme_get_font_list :: MethodBind
bindTheme_get_font_list
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_font_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the @Font@s as a @PoolStringArray@ filled with each @Font@'s name, for use in @method get_font@, if the theme has @theme_type@.
get_font_list ::
                (Theme :< cls, Object :< cls) =>
                cls -> GodotString -> IO PoolStringArray
get_font_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_font_list (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_font_list" '[GodotString]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.Theme.get_font_list

{-# NOINLINE bindTheme_get_font_types #-}

-- | Returns all the @Font@ types as a @PoolStringArray@ filled with unique type names, for use in @method get_font@ and/or @method get_font_list@.
bindTheme_get_font_types :: MethodBind
bindTheme_get_font_types
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_font_types" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the @Font@ types as a @PoolStringArray@ filled with unique type names, for use in @method get_font@ and/or @method get_font_list@.
get_font_types ::
                 (Theme :< cls, Object :< cls) => cls -> IO PoolStringArray
get_font_types cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_font_types (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_font_types" '[] (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.Theme.get_font_types

{-# NOINLINE bindTheme_get_icon #-}

-- | Returns the icon @Texture@ at @name@ if the theme has @theme_type@.
bindTheme_get_icon :: MethodBind
bindTheme_get_icon
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the icon @Texture@ at @name@ if the theme has @theme_type@.
get_icon ::
           (Theme :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> IO Texture
get_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_icon (upcast cls) arrPtr len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod Theme "get_icon" '[GodotString, GodotString]
           (IO Texture)
         where
        nodeMethod = Godot.Core.Theme.get_icon

{-# NOINLINE bindTheme_get_icon_list #-}

-- | Returns all the icons as a @PoolStringArray@ filled with each @Texture@'s name, for use in @method get_icon@, if the theme has @theme_type@.
bindTheme_get_icon_list :: MethodBind
bindTheme_get_icon_list
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_icon_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the icons as a @PoolStringArray@ filled with each @Texture@'s name, for use in @method get_icon@, if the theme has @theme_type@.
get_icon_list ::
                (Theme :< cls, Object :< cls) =>
                cls -> GodotString -> IO PoolStringArray
get_icon_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_icon_list (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_icon_list" '[GodotString]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.Theme.get_icon_list

{-# NOINLINE bindTheme_get_icon_types #-}

-- | Returns all the icon types as a @PoolStringArray@ filled with unique type names, for use in @method get_icon@ and/or @method get_icon_list@.
bindTheme_get_icon_types :: MethodBind
bindTheme_get_icon_types
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_icon_types" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the icon types as a @PoolStringArray@ filled with unique type names, for use in @method get_icon@ and/or @method get_icon_list@.
get_icon_types ::
                 (Theme :< cls, Object :< cls) => cls -> IO PoolStringArray
get_icon_types cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_icon_types (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_icon_types" '[] (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.Theme.get_icon_types

{-# NOINLINE bindTheme_get_stylebox #-}

-- | Returns the @StyleBox@ at @name@ if the theme has @theme_type@.
--   				Valid @name@s may be found using @method get_stylebox_list@. Valid @theme_type@s may be found using @method get_stylebox_types@.
bindTheme_get_stylebox :: MethodBind
bindTheme_get_stylebox
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_stylebox" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @StyleBox@ at @name@ if the theme has @theme_type@.
--   				Valid @name@s may be found using @method get_stylebox_list@. Valid @theme_type@s may be found using @method get_stylebox_types@.
get_stylebox ::
               (Theme :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> IO StyleBox
get_stylebox cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_stylebox (upcast cls) arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod Theme "get_stylebox"
           '[GodotString, GodotString]
           (IO StyleBox)
         where
        nodeMethod = Godot.Core.Theme.get_stylebox

{-# NOINLINE bindTheme_get_stylebox_list #-}

-- | Returns all the @StyleBox@s as a @PoolStringArray@ filled with each @StyleBox@'s name, for use in @method get_stylebox@, if the theme has @theme_type@.
--   				Valid @theme_type@s may be found using @method get_stylebox_types@.
bindTheme_get_stylebox_list :: MethodBind
bindTheme_get_stylebox_list
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_stylebox_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the @StyleBox@s as a @PoolStringArray@ filled with each @StyleBox@'s name, for use in @method get_stylebox@, if the theme has @theme_type@.
--   				Valid @theme_type@s may be found using @method get_stylebox_types@.
get_stylebox_list ::
                    (Theme :< cls, Object :< cls) =>
                    cls -> GodotString -> IO PoolStringArray
get_stylebox_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_stylebox_list (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_stylebox_list" '[GodotString]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.Theme.get_stylebox_list

{-# NOINLINE bindTheme_get_stylebox_types #-}

-- | Returns all the @StyleBox@ types as a @PoolStringArray@ filled with unique type names, for use in @method get_stylebox@ and/or @method get_stylebox_list@.
bindTheme_get_stylebox_types :: MethodBind
bindTheme_get_stylebox_types
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_stylebox_types" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the @StyleBox@ types as a @PoolStringArray@ filled with unique type names, for use in @method get_stylebox@ and/or @method get_stylebox_list@.
get_stylebox_types ::
                     (Theme :< cls, Object :< cls) => cls -> IO PoolStringArray
get_stylebox_types cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_stylebox_types (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_stylebox_types" '[]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.Theme.get_stylebox_types

{-# NOINLINE bindTheme_get_theme_item #-}

-- | Returns the theme item of @data_type@ at @name@ if the theme has @theme_type@.
--   				Valid @name@s may be found using @method get_theme_item_list@ or a data type specific method. Valid @theme_type@s may be found using @method get_theme_item_types@ or a data type specific method.
bindTheme_get_theme_item :: MethodBind
bindTheme_get_theme_item
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_theme_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the theme item of @data_type@ at @name@ if the theme has @theme_type@.
--   				Valid @name@s may be found using @method get_theme_item_list@ or a data type specific method. Valid @theme_type@s may be found using @method get_theme_item_types@ or a data type specific method.
get_theme_item ::
                 (Theme :< cls, Object :< cls) =>
                 cls -> Int -> GodotString -> GodotString -> IO GodotVariant
get_theme_item cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_theme_item (upcast cls) arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> return var)

instance NodeMethod Theme "get_theme_item"
           '[Int, GodotString, GodotString]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Theme.get_theme_item

{-# NOINLINE bindTheme_get_theme_item_list #-}

-- | Returns all the theme items of @data_type@ as a @PoolStringArray@ filled with each theme items's name, for use in @method get_theme_item@ or a data type specific method, if the theme has @theme_type@.
--   				Valid @theme_type@s may be found using @method get_theme_item_types@ or a data type specific method.
bindTheme_get_theme_item_list :: MethodBind
bindTheme_get_theme_item_list
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_theme_item_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the theme items of @data_type@ as a @PoolStringArray@ filled with each theme items's name, for use in @method get_theme_item@ or a data type specific method, if the theme has @theme_type@.
--   				Valid @theme_type@s may be found using @method get_theme_item_types@ or a data type specific method.
get_theme_item_list ::
                      (Theme :< cls, Object :< cls) =>
                      cls -> Int -> GodotString -> IO PoolStringArray
get_theme_item_list cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_theme_item_list (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_theme_item_list" '[Int, GodotString]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.Theme.get_theme_item_list

{-# NOINLINE bindTheme_get_theme_item_types #-}

-- | Returns all the theme items of @data_type@ types as a @PoolStringArray@ filled with unique type names, for use in @method get_theme_item@, @method get_theme_item_list@ or data type specific methods.
bindTheme_get_theme_item_types :: MethodBind
bindTheme_get_theme_item_types
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_theme_item_types" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the theme items of @data_type@ types as a @PoolStringArray@ filled with unique type names, for use in @method get_theme_item@, @method get_theme_item_list@ or data type specific methods.
get_theme_item_types ::
                       (Theme :< cls, Object :< cls) => cls -> Int -> IO PoolStringArray
get_theme_item_types cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_theme_item_types (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_theme_item_types" '[Int]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.Theme.get_theme_item_types

{-# NOINLINE bindTheme_get_type_list #-}

-- | Returns all the theme types as a @PoolStringArray@ filled with unique type names, for use in other @get_*@ functions of this theme.
--   				__Note:__ @theme_type@ has no effect and will be removed in future version.
bindTheme_get_type_list :: MethodBind
bindTheme_get_type_list
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_type_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the theme types as a @PoolStringArray@ filled with unique type names, for use in other @get_*@ functions of this theme.
--   				__Note:__ @theme_type@ has no effect and will be removed in future version.
get_type_list ::
                (Theme :< cls, Object :< cls) =>
                cls -> GodotString -> IO PoolStringArray
get_type_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_type_list (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_type_list" '[GodotString]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.Theme.get_type_list

{-# NOINLINE bindTheme_get_type_variation_base #-}

-- | Returns the name of the base theme type if @theme_type@ is a valid variation type. Returns an empty string otherwise.
bindTheme_get_type_variation_base :: MethodBind
bindTheme_get_type_variation_base
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_type_variation_base" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the base theme type if @theme_type@ is a valid variation type. Returns an empty string otherwise.
get_type_variation_base ::
                          (Theme :< cls, Object :< cls) =>
                          cls -> GodotString -> IO GodotString
get_type_variation_base cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_type_variation_base
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_type_variation_base" '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Theme.get_type_variation_base

{-# NOINLINE bindTheme_get_type_variation_list #-}

-- | Returns a list of all type variations for the given @base_type@.
bindTheme_get_type_variation_list :: MethodBind
bindTheme_get_type_variation_list
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_type_variation_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of all type variations for the given @base_type@.
get_type_variation_list ::
                          (Theme :< cls, Object :< cls) =>
                          cls -> GodotString -> IO PoolStringArray
get_type_variation_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_type_variation_list
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "get_type_variation_list" '[GodotString]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.Theme.get_type_variation_list

{-# NOINLINE bindTheme_has_color #-}

-- | Returns @true@ if @Color@ with @name@ is in @theme_type@.
--   				Returns @false@ if the theme does not have @theme_type@.
bindTheme_has_color :: MethodBind
bindTheme_has_color
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "has_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if @Color@ with @name@ is in @theme_type@.
--   				Returns @false@ if the theme does not have @theme_type@.
has_color ::
            (Theme :< cls, Object :< cls) =>
            cls -> GodotString -> GodotString -> IO Bool
has_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_has_color (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "has_color" '[GodotString, GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Theme.has_color

{-# NOINLINE bindTheme_has_constant #-}

-- | Returns @true@ if constant with @name@ is in @theme_type@.
--   				Returns @false@ if the theme does not have @theme_type@.
bindTheme_has_constant :: MethodBind
bindTheme_has_constant
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "has_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if constant with @name@ is in @theme_type@.
--   				Returns @false@ if the theme does not have @theme_type@.
has_constant ::
               (Theme :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> IO Bool
has_constant cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_has_constant (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "has_constant"
           '[GodotString, GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Theme.has_constant

{-# NOINLINE bindTheme_has_default_font #-}

-- | Returns @true@ if this theme has a valid @default_font@ value.
bindTheme_has_default_font :: MethodBind
bindTheme_has_default_font
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "has_default_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if this theme has a valid @default_font@ value.
has_default_font :: (Theme :< cls, Object :< cls) => cls -> IO Bool
has_default_font cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_has_default_font (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "has_default_font" '[] (IO Bool) where
        nodeMethod = Godot.Core.Theme.has_default_font

{-# NOINLINE bindTheme_has_font #-}

-- | Returns @true@ if @Font@ with @name@ is in @theme_type@.
--   				Returns @false@ if the theme does not have @theme_type@.
bindTheme_has_font :: MethodBind
bindTheme_has_font
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "has_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if @Font@ with @name@ is in @theme_type@.
--   				Returns @false@ if the theme does not have @theme_type@.
has_font ::
           (Theme :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> IO Bool
has_font cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_has_font (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "has_font" '[GodotString, GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Theme.has_font

{-# NOINLINE bindTheme_has_icon #-}

-- | Returns @true@ if icon @Texture@ with @name@ is in @theme_type@.
--   				Returns @false@ if the theme does not have @theme_type@.
bindTheme_has_icon :: MethodBind
bindTheme_has_icon
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "has_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if icon @Texture@ with @name@ is in @theme_type@.
--   				Returns @false@ if the theme does not have @theme_type@.
has_icon ::
           (Theme :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> IO Bool
has_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_has_icon (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "has_icon" '[GodotString, GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Theme.has_icon

{-# NOINLINE bindTheme_has_stylebox #-}

-- | Returns @true@ if @StyleBox@ with @name@ is in @theme_type@.
--   				Returns @false@ if the theme does not have @theme_type@.
bindTheme_has_stylebox :: MethodBind
bindTheme_has_stylebox
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "has_stylebox" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if @StyleBox@ with @name@ is in @theme_type@.
--   				Returns @false@ if the theme does not have @theme_type@.
has_stylebox ::
               (Theme :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> IO Bool
has_stylebox cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_has_stylebox (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "has_stylebox"
           '[GodotString, GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Theme.has_stylebox

{-# NOINLINE bindTheme_has_theme_item #-}

-- | Returns @true@ if a theme item of @data_type@ with @name@ is in @theme_type@.
--   				Returns @false@ if the theme does not have @theme_type@.
bindTheme_has_theme_item :: MethodBind
bindTheme_has_theme_item
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "has_theme_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if a theme item of @data_type@ with @name@ is in @theme_type@.
--   				Returns @false@ if the theme does not have @theme_type@.
has_theme_item ::
                 (Theme :< cls, Object :< cls) =>
                 cls -> Int -> GodotString -> GodotString -> IO Bool
has_theme_item cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_has_theme_item (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "has_theme_item"
           '[Int, GodotString, GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Theme.has_theme_item

{-# NOINLINE bindTheme_is_type_variation #-}

-- | Returns @true@ if @theme_type@ is marked as a variation of @base_type@.
bindTheme_is_type_variation :: MethodBind
bindTheme_is_type_variation
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "is_type_variation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if @theme_type@ is marked as a variation of @base_type@.
is_type_variation ::
                    (Theme :< cls, Object :< cls) =>
                    cls -> GodotString -> GodotString -> IO Bool
is_type_variation cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_is_type_variation (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "is_type_variation"
           '[GodotString, GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Theme.is_type_variation

{-# NOINLINE bindTheme_merge_with #-}

-- | Adds missing and overrides existing definitions with values from the @other@ @Theme@.
--   				__Note:__ This modifies the current theme. If you want to merge two themes together without modifying either one, create a new empty theme and merge the other two into it one after another.
bindTheme_merge_with :: MethodBind
bindTheme_merge_with
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "merge_with" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds missing and overrides existing definitions with values from the @other@ @Theme@.
--   				__Note:__ This modifies the current theme. If you want to merge two themes together without modifying either one, create a new empty theme and merge the other two into it one after another.
merge_with ::
             (Theme :< cls, Object :< cls) => cls -> Theme -> IO ()
merge_with cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_merge_with (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "merge_with" '[Theme] (IO ()) where
        nodeMethod = Godot.Core.Theme.merge_with

{-# NOINLINE bindTheme_remove_type #-}

-- | Removes the theme type, gracefully discarding defined theme items. If the type is a variation, this information is also erased. If the type is a base for type variations, those variations lose their base.
bindTheme_remove_type :: MethodBind
bindTheme_remove_type
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "remove_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the theme type, gracefully discarding defined theme items. If the type is a variation, this information is also erased. If the type is a base for type variations, those variations lose their base.
remove_type ::
              (Theme :< cls, Object :< cls) => cls -> GodotString -> IO ()
remove_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_remove_type (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "remove_type" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.Theme.remove_type

{-# NOINLINE bindTheme_rename_color #-}

-- | Renames the @Color@ at @old_name@ to @name@ if the theme has @theme_type@. If @name@ is already taken, this method fails.
bindTheme_rename_color :: MethodBind
bindTheme_rename_color
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "rename_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Renames the @Color@ at @old_name@ to @name@ if the theme has @theme_type@. If @name@ is already taken, this method fails.
rename_color ::
               (Theme :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> GodotString -> IO ()
rename_color cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_rename_color (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "rename_color"
           '[GodotString, GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.rename_color

{-# NOINLINE bindTheme_rename_constant #-}

-- | Renames the constant at @old_name@ to @name@ if the theme has @theme_type@. If @name@ is already taken, this method fails.
bindTheme_rename_constant :: MethodBind
bindTheme_rename_constant
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "rename_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Renames the constant at @old_name@ to @name@ if the theme has @theme_type@. If @name@ is already taken, this method fails.
rename_constant ::
                  (Theme :< cls, Object :< cls) =>
                  cls -> GodotString -> GodotString -> GodotString -> IO ()
rename_constant cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_rename_constant (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "rename_constant"
           '[GodotString, GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.rename_constant

{-# NOINLINE bindTheme_rename_font #-}

-- | Renames the @Font@ at @old_name@ to @name@ if the theme has @theme_type@. If @name@ is already taken, this method fails.
bindTheme_rename_font :: MethodBind
bindTheme_rename_font
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "rename_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Renames the @Font@ at @old_name@ to @name@ if the theme has @theme_type@. If @name@ is already taken, this method fails.
rename_font ::
              (Theme :< cls, Object :< cls) =>
              cls -> GodotString -> GodotString -> GodotString -> IO ()
rename_font cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_rename_font (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "rename_font"
           '[GodotString, GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.rename_font

{-# NOINLINE bindTheme_rename_icon #-}

-- | Renames the icon at @old_name@ to @name@ if the theme has @theme_type@. If @name@ is already taken, this method fails.
bindTheme_rename_icon :: MethodBind
bindTheme_rename_icon
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "rename_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Renames the icon at @old_name@ to @name@ if the theme has @theme_type@. If @name@ is already taken, this method fails.
rename_icon ::
              (Theme :< cls, Object :< cls) =>
              cls -> GodotString -> GodotString -> GodotString -> IO ()
rename_icon cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_rename_icon (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "rename_icon"
           '[GodotString, GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.rename_icon

{-# NOINLINE bindTheme_rename_stylebox #-}

-- | Renames @StyleBox@ at @old_name@ to @name@ if the theme has @theme_type@. If @name@ is already taken, this method fails.
bindTheme_rename_stylebox :: MethodBind
bindTheme_rename_stylebox
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "rename_stylebox" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Renames @StyleBox@ at @old_name@ to @name@ if the theme has @theme_type@. If @name@ is already taken, this method fails.
rename_stylebox ::
                  (Theme :< cls, Object :< cls) =>
                  cls -> GodotString -> GodotString -> GodotString -> IO ()
rename_stylebox cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_rename_stylebox (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "rename_stylebox"
           '[GodotString, GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.rename_stylebox

{-# NOINLINE bindTheme_rename_theme_item #-}

-- | Renames the theme item of @data_type@ at @old_name@ to @name@ if the theme has @theme_type@. If @name@ is already taken, this method fails.
bindTheme_rename_theme_item :: MethodBind
bindTheme_rename_theme_item
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "rename_theme_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Renames the theme item of @data_type@ at @old_name@ to @name@ if the theme has @theme_type@. If @name@ is already taken, this method fails.
rename_theme_item ::
                    (Theme :< cls, Object :< cls) =>
                    cls -> Int -> GodotString -> GodotString -> GodotString -> IO ()
rename_theme_item cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_rename_theme_item (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "rename_theme_item"
           '[Int, GodotString, GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.rename_theme_item

{-# NOINLINE bindTheme_set_color #-}

-- | Sets the theme's @Color@ to @color@ at @name@ in @theme_type@.
--   				Creates @theme_type@ if the theme does not have it.
bindTheme_set_color :: MethodBind
bindTheme_set_color
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the theme's @Color@ to @color@ at @name@ in @theme_type@.
--   				Creates @theme_type@ if the theme does not have it.
set_color ::
            (Theme :< cls, Object :< cls) =>
            cls -> GodotString -> GodotString -> Color -> IO ()
set_color cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_set_color (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "set_color"
           '[GodotString, GodotString, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.set_color

{-# NOINLINE bindTheme_set_constant #-}

-- | Sets the theme's constant to @constant@ at @name@ in @theme_type@.
--   				Creates @theme_type@ if the theme does not have it.
bindTheme_set_constant :: MethodBind
bindTheme_set_constant
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "set_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the theme's constant to @constant@ at @name@ in @theme_type@.
--   				Creates @theme_type@ if the theme does not have it.
set_constant ::
               (Theme :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> Int -> IO ()
set_constant cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_set_constant (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "set_constant"
           '[GodotString, GodotString, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.set_constant

{-# NOINLINE bindTheme_set_default_font #-}

-- | The default font of this @Theme@ resource. Used as a fallback value for font items defined in this theme, but having invalid values. If this value is also invalid, the global default value is used.
--   			Use @method has_default_font@ to check if this value is valid.
bindTheme_set_default_font :: MethodBind
bindTheme_set_default_font
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "set_default_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The default font of this @Theme@ resource. Used as a fallback value for font items defined in this theme, but having invalid values. If this value is also invalid, the global default value is used.
--   			Use @method has_default_font@ to check if this value is valid.
set_default_font ::
                   (Theme :< cls, Object :< cls) => cls -> Font -> IO ()
set_default_font cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_set_default_font (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "set_default_font" '[Font] (IO ()) where
        nodeMethod = Godot.Core.Theme.set_default_font

{-# NOINLINE bindTheme_set_font #-}

-- | Sets the theme's @Font@ to @font@ at @name@ in @theme_type@.
--   				Creates @theme_type@ if the theme does not have it.
bindTheme_set_font :: MethodBind
bindTheme_set_font
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "set_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the theme's @Font@ to @font@ at @name@ in @theme_type@.
--   				Creates @theme_type@ if the theme does not have it.
set_font ::
           (Theme :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> Font -> IO ()
set_font cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_set_font (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "set_font"
           '[GodotString, GodotString, Font]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.set_font

{-# NOINLINE bindTheme_set_icon #-}

-- | Sets the theme's icon @Texture@ to @texture@ at @name@ in @theme_type@.
--   				Creates @theme_type@ if the theme does not have it.
bindTheme_set_icon :: MethodBind
bindTheme_set_icon
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "set_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the theme's icon @Texture@ to @texture@ at @name@ in @theme_type@.
--   				Creates @theme_type@ if the theme does not have it.
set_icon ::
           (Theme :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> Texture -> IO ()
set_icon cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_set_icon (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "set_icon"
           '[GodotString, GodotString, Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.set_icon

{-# NOINLINE bindTheme_set_stylebox #-}

-- | Sets theme's @StyleBox@ to @stylebox@ at @name@ in @theme_type@.
--   				Creates @theme_type@ if the theme does not have it.
bindTheme_set_stylebox :: MethodBind
bindTheme_set_stylebox
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "set_stylebox" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets theme's @StyleBox@ to @stylebox@ at @name@ in @theme_type@.
--   				Creates @theme_type@ if the theme does not have it.
set_stylebox ::
               (Theme :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> StyleBox -> IO ()
set_stylebox cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_set_stylebox (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "set_stylebox"
           '[GodotString, GodotString, StyleBox]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.set_stylebox

{-# NOINLINE bindTheme_set_theme_item #-}

-- | Sets the theme item of @data_type@ to @value@ at @name@ in @theme_type@.
--   				Does nothing if the @value@ type does not match @data_type@.
--   				Creates @theme_type@ if the theme does not have it.
bindTheme_set_theme_item :: MethodBind
bindTheme_set_theme_item
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "set_theme_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the theme item of @data_type@ to @value@ at @name@ in @theme_type@.
--   				Does nothing if the @value@ type does not match @data_type@.
--   				Creates @theme_type@ if the theme does not have it.
set_theme_item ::
                 (Theme :< cls, Object :< cls) =>
                 cls -> Int -> GodotString -> GodotString -> GodotVariant -> IO ()
set_theme_item cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_set_theme_item (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "set_theme_item"
           '[Int, GodotString, GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.set_theme_item

{-# NOINLINE bindTheme_set_type_variation #-}

-- | Marks @theme_type@ as a variation of @base_type@.
--   				This adds @theme_type@ as a suggested option for @Control.theme_type_variation@ on a @Control@ that is of the @base_type@ class.
--   				Variations can also be nested, i.e. @base_type@ can be another variation. If a chain of variations ends with a @base_type@ matching the class of the @Control@, the whole chain is going to be suggested as options.
--   				__Note:__ Suggestions only show up if this theme resource is set as the project default theme. See @ProjectSettings.gui/theme/custom@.
bindTheme_set_type_variation :: MethodBind
bindTheme_set_type_variation
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "set_type_variation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Marks @theme_type@ as a variation of @base_type@.
--   				This adds @theme_type@ as a suggested option for @Control.theme_type_variation@ on a @Control@ that is of the @base_type@ class.
--   				Variations can also be nested, i.e. @base_type@ can be another variation. If a chain of variations ends with a @base_type@ matching the class of the @Control@, the whole chain is going to be suggested as options.
--   				__Note:__ Suggestions only show up if this theme resource is set as the project default theme. See @ProjectSettings.gui/theme/custom@.
set_type_variation ::
                     (Theme :< cls, Object :< cls) =>
                     cls -> GodotString -> GodotString -> IO ()
set_type_variation cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_set_type_variation (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Theme "set_type_variation"
           '[GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Theme.set_type_variation