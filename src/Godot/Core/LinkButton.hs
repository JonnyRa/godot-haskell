{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.LinkButton
       (Godot.Core.LinkButton._UNDERLINE_MODE_ALWAYS,
        Godot.Core.LinkButton._UNDERLINE_MODE_NEVER,
        Godot.Core.LinkButton._UNDERLINE_MODE_ON_HOVER,
        Godot.Core.LinkButton.get_text,
        Godot.Core.LinkButton.get_underline_mode,
        Godot.Core.LinkButton.get_uri, Godot.Core.LinkButton.set_text,
        Godot.Core.LinkButton.set_underline_mode,
        Godot.Core.LinkButton.set_uri)
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
import Godot.Core.BaseButton()

_UNDERLINE_MODE_ALWAYS :: Int
_UNDERLINE_MODE_ALWAYS = 0

_UNDERLINE_MODE_NEVER :: Int
_UNDERLINE_MODE_NEVER = 2

_UNDERLINE_MODE_ON_HOVER :: Int
_UNDERLINE_MODE_ON_HOVER = 1

instance NodeProperty LinkButton "text" GodotString 'False where
        nodeProperty = (get_text, wrapDroppingSetter set_text, Nothing)

instance NodeProperty LinkButton "underline" Int 'False where
        nodeProperty
          = (get_underline_mode, wrapDroppingSetter set_underline_mode,
             Nothing)

instance NodeProperty LinkButton "uri" GodotString 'False where
        nodeProperty = (get_uri, wrapDroppingSetter set_uri, Nothing)

{-# NOINLINE bindLinkButton_get_text #-}

-- | The button's text that will be displayed inside the button's area.
bindLinkButton_get_text :: MethodBind
bindLinkButton_get_text
  = unsafePerformIO $
      withCString "LinkButton" $
        \ clsNamePtr ->
          withCString "get_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's text that will be displayed inside the button's area.
get_text ::
           (LinkButton :< cls, Object :< cls) => cls -> IO GodotString
get_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLinkButton_get_text (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod LinkButton "get_text" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.LinkButton.get_text

{-# NOINLINE bindLinkButton_get_underline_mode #-}

-- | The underline mode to use for the text. See @enum LinkButton.UnderlineMode@ for the available modes.
bindLinkButton_get_underline_mode :: MethodBind
bindLinkButton_get_underline_mode
  = unsafePerformIO $
      withCString "LinkButton" $
        \ clsNamePtr ->
          withCString "get_underline_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The underline mode to use for the text. See @enum LinkButton.UnderlineMode@ for the available modes.
get_underline_mode ::
                     (LinkButton :< cls, Object :< cls) => cls -> IO Int
get_underline_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLinkButton_get_underline_mode
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod LinkButton "get_underline_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.LinkButton.get_underline_mode

{-# NOINLINE bindLinkButton_get_uri #-}

-- | The @url=https://en.wikipedia.org/wiki/Uniform_Resource_Identifier@URI@/url@ for this @LinkButton@. If set to a valid URI, pressing the button opens the URI using the operating system's default program for the protocol (via @method OS.shell_open@). HTTP and HTTPS URLs open the default web browser.
--   			__Examples:__
--   			
--   @
--   
--   			uri = "https://godotengine.org"  # Opens the URL in the default web browser.
--   			uri = "C:\SomeFolder"  # Opens the file explorer at the given path.
--   			uri = "C:\SomeImage.png"  # Opens the given image in the default viewing app.
--   			
--   @
bindLinkButton_get_uri :: MethodBind
bindLinkButton_get_uri
  = unsafePerformIO $
      withCString "LinkButton" $
        \ clsNamePtr ->
          withCString "get_uri" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @url=https://en.wikipedia.org/wiki/Uniform_Resource_Identifier@URI@/url@ for this @LinkButton@. If set to a valid URI, pressing the button opens the URI using the operating system's default program for the protocol (via @method OS.shell_open@). HTTP and HTTPS URLs open the default web browser.
--   			__Examples:__
--   			
--   @
--   
--   			uri = "https://godotengine.org"  # Opens the URL in the default web browser.
--   			uri = "C:\SomeFolder"  # Opens the file explorer at the given path.
--   			uri = "C:\SomeImage.png"  # Opens the given image in the default viewing app.
--   			
--   @
get_uri ::
          (LinkButton :< cls, Object :< cls) => cls -> IO GodotString
get_uri cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLinkButton_get_uri (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod LinkButton "get_uri" '[] (IO GodotString) where
        nodeMethod = Godot.Core.LinkButton.get_uri

{-# NOINLINE bindLinkButton_set_text #-}

-- | The button's text that will be displayed inside the button's area.
bindLinkButton_set_text :: MethodBind
bindLinkButton_set_text
  = unsafePerformIO $
      withCString "LinkButton" $
        \ clsNamePtr ->
          withCString "set_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's text that will be displayed inside the button's area.
set_text ::
           (LinkButton :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLinkButton_set_text (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod LinkButton "set_text" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.LinkButton.set_text

{-# NOINLINE bindLinkButton_set_underline_mode #-}

-- | The underline mode to use for the text. See @enum LinkButton.UnderlineMode@ for the available modes.
bindLinkButton_set_underline_mode :: MethodBind
bindLinkButton_set_underline_mode
  = unsafePerformIO $
      withCString "LinkButton" $
        \ clsNamePtr ->
          withCString "set_underline_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The underline mode to use for the text. See @enum LinkButton.UnderlineMode@ for the available modes.
set_underline_mode ::
                     (LinkButton :< cls, Object :< cls) => cls -> Int -> IO ()
set_underline_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLinkButton_set_underline_mode
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod LinkButton "set_underline_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.LinkButton.set_underline_mode

{-# NOINLINE bindLinkButton_set_uri #-}

-- | The @url=https://en.wikipedia.org/wiki/Uniform_Resource_Identifier@URI@/url@ for this @LinkButton@. If set to a valid URI, pressing the button opens the URI using the operating system's default program for the protocol (via @method OS.shell_open@). HTTP and HTTPS URLs open the default web browser.
--   			__Examples:__
--   			
--   @
--   
--   			uri = "https://godotengine.org"  # Opens the URL in the default web browser.
--   			uri = "C:\SomeFolder"  # Opens the file explorer at the given path.
--   			uri = "C:\SomeImage.png"  # Opens the given image in the default viewing app.
--   			
--   @
bindLinkButton_set_uri :: MethodBind
bindLinkButton_set_uri
  = unsafePerformIO $
      withCString "LinkButton" $
        \ clsNamePtr ->
          withCString "set_uri" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @url=https://en.wikipedia.org/wiki/Uniform_Resource_Identifier@URI@/url@ for this @LinkButton@. If set to a valid URI, pressing the button opens the URI using the operating system's default program for the protocol (via @method OS.shell_open@). HTTP and HTTPS URLs open the default web browser.
--   			__Examples:__
--   			
--   @
--   
--   			uri = "https://godotengine.org"  # Opens the URL in the default web browser.
--   			uri = "C:\SomeFolder"  # Opens the file explorer at the given path.
--   			uri = "C:\SomeImage.png"  # Opens the given image in the default viewing app.
--   			
--   @
set_uri ::
          (LinkButton :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_uri cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLinkButton_set_uri (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod LinkButton "set_uri" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.LinkButton.set_uri