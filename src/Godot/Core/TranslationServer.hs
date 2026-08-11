{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.TranslationServer
       (Godot.Core.TranslationServer.add_translation,
        Godot.Core.TranslationServer.clear,
        Godot.Core.TranslationServer.compare_locales,
        Godot.Core.TranslationServer.get_all_countries,
        Godot.Core.TranslationServer.get_all_languages,
        Godot.Core.TranslationServer.get_all_scripts,
        Godot.Core.TranslationServer.get_country_name,
        Godot.Core.TranslationServer.get_language_name,
        Godot.Core.TranslationServer.get_loaded_locales,
        Godot.Core.TranslationServer.get_locale,
        Godot.Core.TranslationServer.get_locale_name,
        Godot.Core.TranslationServer.get_script_name,
        Godot.Core.TranslationServer.remove_translation,
        Godot.Core.TranslationServer.set_locale,
        Godot.Core.TranslationServer.standardize_locale,
        Godot.Core.TranslationServer.translate)
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
import Godot.Core.Object()

{-# NOINLINE bindTranslationServer_add_translation #-}

-- | Adds a @Translation@ resource.
bindTranslationServer_add_translation :: MethodBind
bindTranslationServer_add_translation
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "add_translation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @Translation@ resource.
add_translation ::
                  (TranslationServer :< cls, Object :< cls) =>
                  cls -> Translation -> IO ()
add_translation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_add_translation
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TranslationServer "add_translation"
           '[Translation]
           (IO ())
         where
        nodeMethod = Godot.Core.TranslationServer.add_translation

{-# NOINLINE bindTranslationServer_clear #-}

-- | Clears the server from all translations.
bindTranslationServer_clear :: MethodBind
bindTranslationServer_clear
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the server from all translations.
clear :: (TranslationServer :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_clear (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TranslationServer "clear" '[] (IO ()) where
        nodeMethod = Godot.Core.TranslationServer.clear

{-# NOINLINE bindTranslationServer_compare_locales #-}

-- | Compares two locales and return similarity score between @0@(no match) and @10@(full match).
bindTranslationServer_compare_locales :: MethodBind
bindTranslationServer_compare_locales
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "compare_locales" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Compares two locales and return similarity score between @0@(no match) and @10@(full match).
compare_locales ::
                  (TranslationServer :< cls, Object :< cls) =>
                  cls -> GodotString -> GodotString -> IO Int
compare_locales cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_compare_locales
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TranslationServer "compare_locales"
           '[GodotString, GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.TranslationServer.compare_locales

{-# NOINLINE bindTranslationServer_get_all_countries #-}

-- | Returns array of known country codes.
bindTranslationServer_get_all_countries :: MethodBind
bindTranslationServer_get_all_countries
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "get_all_countries" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns array of known country codes.
get_all_countries ::
                    (TranslationServer :< cls, Object :< cls) =>
                    cls -> IO PoolStringArray
get_all_countries cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_get_all_countries
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TranslationServer "get_all_countries" '[]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.TranslationServer.get_all_countries

{-# NOINLINE bindTranslationServer_get_all_languages #-}

-- | Returns array of known language codes.
bindTranslationServer_get_all_languages :: MethodBind
bindTranslationServer_get_all_languages
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "get_all_languages" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns array of known language codes.
get_all_languages ::
                    (TranslationServer :< cls, Object :< cls) =>
                    cls -> IO PoolStringArray
get_all_languages cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_get_all_languages
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TranslationServer "get_all_languages" '[]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.TranslationServer.get_all_languages

{-# NOINLINE bindTranslationServer_get_all_scripts #-}

-- | Returns array of known script codes.
bindTranslationServer_get_all_scripts :: MethodBind
bindTranslationServer_get_all_scripts
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "get_all_scripts" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns array of known script codes.
get_all_scripts ::
                  (TranslationServer :< cls, Object :< cls) =>
                  cls -> IO PoolStringArray
get_all_scripts cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_get_all_scripts
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TranslationServer "get_all_scripts" '[]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.TranslationServer.get_all_scripts

{-# NOINLINE bindTranslationServer_get_country_name #-}

-- | Returns readable country name for the @country@ code.
bindTranslationServer_get_country_name :: MethodBind
bindTranslationServer_get_country_name
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "get_country_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns readable country name for the @country@ code.
get_country_name ::
                   (TranslationServer :< cls, Object :< cls) =>
                   cls -> GodotString -> IO GodotString
get_country_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_get_country_name
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TranslationServer "get_country_name"
           '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.TranslationServer.get_country_name

{-# NOINLINE bindTranslationServer_get_language_name #-}

-- | Returns readable language name for the @language@ code.
bindTranslationServer_get_language_name :: MethodBind
bindTranslationServer_get_language_name
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "get_language_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns readable language name for the @language@ code.
get_language_name ::
                    (TranslationServer :< cls, Object :< cls) =>
                    cls -> GodotString -> IO GodotString
get_language_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_get_language_name
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TranslationServer "get_language_name"
           '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.TranslationServer.get_language_name

{-# NOINLINE bindTranslationServer_get_loaded_locales #-}

-- | Returns an array of all loaded locales of the project.
bindTranslationServer_get_loaded_locales :: MethodBind
bindTranslationServer_get_loaded_locales
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "get_loaded_locales" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of all loaded locales of the project.
get_loaded_locales ::
                     (TranslationServer :< cls, Object :< cls) => cls -> IO Array
get_loaded_locales cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_get_loaded_locales
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TranslationServer "get_loaded_locales" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.TranslationServer.get_loaded_locales

{-# NOINLINE bindTranslationServer_get_locale #-}

-- | Returns the current locale of the project.
--   				See also @method OS.get_locale@ and @method OS.get_locale_language@ to query the locale of the user system.
bindTranslationServer_get_locale :: MethodBind
bindTranslationServer_get_locale
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "get_locale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current locale of the project.
--   				See also @method OS.get_locale@ and @method OS.get_locale_language@ to query the locale of the user system.
get_locale ::
             (TranslationServer :< cls, Object :< cls) => cls -> IO GodotString
get_locale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_get_locale
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TranslationServer "get_locale" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.TranslationServer.get_locale

{-# NOINLINE bindTranslationServer_get_locale_name #-}

-- | Returns a locale's language and its variant (e.g. @"en_US"@ would return @"English (United States)"@).
bindTranslationServer_get_locale_name :: MethodBind
bindTranslationServer_get_locale_name
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "get_locale_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a locale's language and its variant (e.g. @"en_US"@ would return @"English (United States)"@).
get_locale_name ::
                  (TranslationServer :< cls, Object :< cls) =>
                  cls -> GodotString -> IO GodotString
get_locale_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_get_locale_name
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TranslationServer "get_locale_name"
           '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.TranslationServer.get_locale_name

{-# NOINLINE bindTranslationServer_get_script_name #-}

-- | Returns readable script name for the @script@ code.
bindTranslationServer_get_script_name :: MethodBind
bindTranslationServer_get_script_name
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "get_script_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns readable script name for the @script@ code.
get_script_name ::
                  (TranslationServer :< cls, Object :< cls) =>
                  cls -> GodotString -> IO GodotString
get_script_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_get_script_name
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TranslationServer "get_script_name"
           '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.TranslationServer.get_script_name

{-# NOINLINE bindTranslationServer_remove_translation #-}

-- | Removes the given translation from the server.
bindTranslationServer_remove_translation :: MethodBind
bindTranslationServer_remove_translation
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "remove_translation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the given translation from the server.
remove_translation ::
                     (TranslationServer :< cls, Object :< cls) =>
                     cls -> Translation -> IO ()
remove_translation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_remove_translation
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TranslationServer "remove_translation"
           '[Translation]
           (IO ())
         where
        nodeMethod = Godot.Core.TranslationServer.remove_translation

{-# NOINLINE bindTranslationServer_set_locale #-}

-- | Sets the locale of the project. The @locale@ string will be standardized to match known locales (e.g. @en-US@ would be matched to @en_US@).
--   				If translations have been loaded beforehand for the new locale, they will be applied.
bindTranslationServer_set_locale :: MethodBind
bindTranslationServer_set_locale
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "set_locale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the locale of the project. The @locale@ string will be standardized to match known locales (e.g. @en-US@ would be matched to @en_US@).
--   				If translations have been loaded beforehand for the new locale, they will be applied.
set_locale ::
             (TranslationServer :< cls, Object :< cls) =>
             cls -> GodotString -> IO ()
set_locale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_set_locale
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TranslationServer "set_locale" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.TranslationServer.set_locale

{-# NOINLINE bindTranslationServer_standardize_locale #-}

-- | Returns @locale@ string standardized to match known locales (e.g. @en-US@ would be matched to @en_US@).
bindTranslationServer_standardize_locale :: MethodBind
bindTranslationServer_standardize_locale
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "standardize_locale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @locale@ string standardized to match known locales (e.g. @en-US@ would be matched to @en_US@).
standardize_locale ::
                     (TranslationServer :< cls, Object :< cls) =>
                     cls -> GodotString -> IO GodotString
standardize_locale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_standardize_locale
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TranslationServer "standardize_locale"
           '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.TranslationServer.standardize_locale

{-# NOINLINE bindTranslationServer_translate #-}

-- | Returns the current locale's translation for the given message (key).
bindTranslationServer_translate :: MethodBind
bindTranslationServer_translate
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "translate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current locale's translation for the given message (key).
translate ::
            (TranslationServer :< cls, Object :< cls) =>
            cls -> GodotString -> IO GodotString
translate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_translate (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TranslationServer "translate" '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.TranslationServer.translate