{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GLTFDocument
       (Godot.Core.GLTFDocument.register_gltf_document_extension,
        Godot.Core.GLTFDocument.unregister_all_gltf_document_extensions,
        Godot.Core.GLTFDocument.unregister_gltf_document_extension)
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

{-# NOINLINE bindGLTFDocument_register_gltf_document_extension #-}

bindGLTFDocument_register_gltf_document_extension :: MethodBind
bindGLTFDocument_register_gltf_document_extension
  = unsafePerformIO $
      withCString "GLTFDocument" $
        \ clsNamePtr ->
          withCString "register_gltf_document_extension" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

register_gltf_document_extension ::
                                   (GLTFDocument :< cls, Object :< cls) =>
                                   cls -> GLTFDocumentExtension -> Maybe Bool -> IO ()
register_gltf_document_extension cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFDocument_register_gltf_document_extension
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFDocument "register_gltf_document_extension"
           '[GLTFDocumentExtension, Maybe Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.GLTFDocument.register_gltf_document_extension

{-# NOINLINE bindGLTFDocument_unregister_all_gltf_document_extensions
             #-}

bindGLTFDocument_unregister_all_gltf_document_extensions ::
                                                         MethodBind
bindGLTFDocument_unregister_all_gltf_document_extensions
  = unsafePerformIO $
      withCString "GLTFDocument" $
        \ clsNamePtr ->
          withCString "unregister_all_gltf_document_extensions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

unregister_all_gltf_document_extensions ::
                                          (GLTFDocument :< cls, Object :< cls) => cls -> IO ()
unregister_all_gltf_document_extensions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFDocument_unregister_all_gltf_document_extensions
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFDocument
           "unregister_all_gltf_document_extensions"
           '[]
           (IO ())
         where
        nodeMethod
          = Godot.Core.GLTFDocument.unregister_all_gltf_document_extensions

{-# NOINLINE bindGLTFDocument_unregister_gltf_document_extension
             #-}

bindGLTFDocument_unregister_gltf_document_extension :: MethodBind
bindGLTFDocument_unregister_gltf_document_extension
  = unsafePerformIO $
      withCString "GLTFDocument" $
        \ clsNamePtr ->
          withCString "unregister_gltf_document_extension" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

unregister_gltf_document_extension ::
                                     (GLTFDocument :< cls, Object :< cls) =>
                                     cls -> GLTFDocumentExtension -> IO ()
unregister_gltf_document_extension cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFDocument_unregister_gltf_document_extension
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFDocument
           "unregister_gltf_document_extension"
           '[GLTFDocumentExtension]
           (IO ())
         where
        nodeMethod
          = Godot.Core.GLTFDocument.unregister_gltf_document_extension