{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.JavaScript
       (Godot.Core.JavaScript.create_callback,
        Godot.Core.JavaScript.create_object,
        Godot.Core.JavaScript.download_buffer, Godot.Core.JavaScript.eval,
        Godot.Core.JavaScript.get_interface)
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

{-# NOINLINE bindJavaScript_create_callback #-}

-- | Creates a reference to a script function that can be used as a callback by JavaScript. The reference must be kept until the callback happens, or it won't be called at all. See @JavaScriptObject@ for usage.
bindJavaScript_create_callback :: MethodBind
bindJavaScript_create_callback
  = unsafePerformIO $
      withCString "JavaScript" $
        \ clsNamePtr ->
          withCString "create_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a reference to a script function that can be used as a callback by JavaScript. The reference must be kept until the callback happens, or it won't be called at all. See @JavaScriptObject@ for usage.
create_callback ::
                  (JavaScript :< cls, Object :< cls) =>
                  cls -> Object -> GodotString -> IO JavaScriptObject
create_callback cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJavaScript_create_callback (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod JavaScript "create_callback"
           '[Object, GodotString]
           (IO JavaScriptObject)
         where
        nodeMethod = Godot.Core.JavaScript.create_callback

{-# NOINLINE bindJavaScript_create_object #-}

-- | Creates a new JavaScript object using the @new@ constructor. The @object@ must a valid property of the JavaScript @window@. See @JavaScriptObject@ for usage.
bindJavaScript_create_object :: MethodBind
bindJavaScript_create_object
  = unsafePerformIO $
      withCString "JavaScript" $
        \ clsNamePtr ->
          withCString "create_object" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new JavaScript object using the @new@ constructor. The @object@ must a valid property of the JavaScript @window@. See @JavaScriptObject@ for usage.
create_object ::
                (JavaScript :< cls, Object :< cls) =>
                cls -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant
create_object cls arg1 varargs
  = withVariantArray ([toVariant arg1] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJavaScript_create_object (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> return var)

instance NodeMethod JavaScript "create_object"
           '[GodotString, [Variant 'GodotTy]]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.JavaScript.create_object

{-# NOINLINE bindJavaScript_download_buffer #-}

-- | Prompts the user to download a file containing the specified @buffer@. The file will have the given @name@ and @mime@ type.
--   				__Note:__ The browser may override the @url=https://en.wikipedia.org/wiki/Media_type@MIME type@/url@ provided based on the file @name@'s extension.
--   				__Note:__ Browsers might block the download if @method download_buffer@ is not being called from a user interaction (e.g. button click).
--   				__Note:__ Browsers might ask the user for permission or block the download if multiple download requests are made in a quick succession.
bindJavaScript_download_buffer :: MethodBind
bindJavaScript_download_buffer
  = unsafePerformIO $
      withCString "JavaScript" $
        \ clsNamePtr ->
          withCString "download_buffer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Prompts the user to download a file containing the specified @buffer@. The file will have the given @name@ and @mime@ type.
--   				__Note:__ The browser may override the @url=https://en.wikipedia.org/wiki/Media_type@MIME type@/url@ provided based on the file @name@'s extension.
--   				__Note:__ Browsers might block the download if @method download_buffer@ is not being called from a user interaction (e.g. button click).
--   				__Note:__ Browsers might ask the user for permission or block the download if multiple download requests are made in a quick succession.
download_buffer ::
                  (JavaScript :< cls, Object :< cls) =>
                  cls -> PoolByteArray -> GodotString -> Maybe GodotString -> IO ()
download_buffer cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantString "application/octet-stream" arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJavaScript_download_buffer (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod JavaScript "download_buffer"
           '[PoolByteArray, GodotString, Maybe GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.JavaScript.download_buffer

{-# NOINLINE bindJavaScript_eval #-}

-- | Execute the string @code@ as JavaScript code within the browser window. This is a call to the actual global JavaScript function @eval()@.
--   				If @use_global_execution_context@ is @true@, the code will be evaluated in the global execution context. Otherwise, it is evaluated in the execution context of a function within the engine's runtime environment.
bindJavaScript_eval :: MethodBind
bindJavaScript_eval
  = unsafePerformIO $
      withCString "JavaScript" $
        \ clsNamePtr ->
          withCString "eval" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Execute the string @code@ as JavaScript code within the browser window. This is a call to the actual global JavaScript function @eval()@.
--   				If @use_global_execution_context@ is @true@, the code will be evaluated in the global execution context. Otherwise, it is evaluated in the execution context of a function within the engine's runtime environment.
eval ::
       (JavaScript :< cls, Object :< cls) =>
       cls -> GodotString -> Maybe Bool -> IO GodotVariant
eval cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJavaScript_eval (upcast cls) arrPtr len
           >>= \ (err, var) -> throwIfErr err >> return var)

instance NodeMethod JavaScript "eval" '[GodotString, Maybe Bool]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.JavaScript.eval

{-# NOINLINE bindJavaScript_get_interface #-}

-- | Returns an interface to a JavaScript object that can be used by scripts. The @interface@ must be a valid property of the JavaScript @window@. The callback must accept a single @Array@ argument, which will contain the JavaScript @arguments@. See @JavaScriptObject@ for usage.
bindJavaScript_get_interface :: MethodBind
bindJavaScript_get_interface
  = unsafePerformIO $
      withCString "JavaScript" $
        \ clsNamePtr ->
          withCString "get_interface" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an interface to a JavaScript object that can be used by scripts. The @interface@ must be a valid property of the JavaScript @window@. The callback must accept a single @Array@ argument, which will contain the JavaScript @arguments@. See @JavaScriptObject@ for usage.
get_interface ::
                (JavaScript :< cls, Object :< cls) =>
                cls -> GodotString -> IO JavaScriptObject
get_interface cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJavaScript_get_interface (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod JavaScript "get_interface" '[GodotString]
           (IO JavaScriptObject)
         where
        nodeMethod = Godot.Core.JavaScript.get_interface