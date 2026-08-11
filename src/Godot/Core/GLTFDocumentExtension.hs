{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GLTFDocumentExtension
       (Godot.Core.GLTFDocumentExtension._convert_scene_node,
        Godot.Core.GLTFDocumentExtension._export_node,
        Godot.Core.GLTFDocumentExtension._export_post,
        Godot.Core.GLTFDocumentExtension._export_preflight,
        Godot.Core.GLTFDocumentExtension._generate_scene_node,
        Godot.Core.GLTFDocumentExtension._get_supported_extensions,
        Godot.Core.GLTFDocumentExtension._import_node,
        Godot.Core.GLTFDocumentExtension._import_post,
        Godot.Core.GLTFDocumentExtension._import_post_parse,
        Godot.Core.GLTFDocumentExtension._import_preflight,
        Godot.Core.GLTFDocumentExtension._parse_node_extensions)
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

{-# NOINLINE bindGLTFDocumentExtension__convert_scene_node #-}

bindGLTFDocumentExtension__convert_scene_node :: MethodBind
bindGLTFDocumentExtension__convert_scene_node
  = unsafePerformIO $
      withCString "GLTFDocumentExtension" $
        \ clsNamePtr ->
          withCString "_convert_scene_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_convert_scene_node ::
                      (GLTFDocumentExtension :< cls, Object :< cls) =>
                      cls -> GLTFState -> GLTFNode -> Node -> IO ()
_convert_scene_node cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFDocumentExtension__convert_scene_node
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFDocumentExtension "_convert_scene_node"
           '[GLTFState, GLTFNode, Node]
           (IO ())
         where
        nodeMethod = Godot.Core.GLTFDocumentExtension._convert_scene_node

{-# NOINLINE bindGLTFDocumentExtension__export_node #-}

bindGLTFDocumentExtension__export_node :: MethodBind
bindGLTFDocumentExtension__export_node
  = unsafePerformIO $
      withCString "GLTFDocumentExtension" $
        \ clsNamePtr ->
          withCString "_export_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_export_node ::
               (GLTFDocumentExtension :< cls, Object :< cls) =>
               cls -> GLTFState -> GLTFNode -> Dictionary -> Node -> IO Int
_export_node cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFDocumentExtension__export_node
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFDocumentExtension "_export_node"
           '[GLTFState, GLTFNode, Dictionary, Node]
           (IO Int)
         where
        nodeMethod = Godot.Core.GLTFDocumentExtension._export_node

{-# NOINLINE bindGLTFDocumentExtension__export_post #-}

bindGLTFDocumentExtension__export_post :: MethodBind
bindGLTFDocumentExtension__export_post
  = unsafePerformIO $
      withCString "GLTFDocumentExtension" $
        \ clsNamePtr ->
          withCString "_export_post" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_export_post ::
               (GLTFDocumentExtension :< cls, Object :< cls) =>
               cls -> GLTFState -> IO Int
_export_post cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFDocumentExtension__export_post
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFDocumentExtension "_export_post"
           '[GLTFState]
           (IO Int)
         where
        nodeMethod = Godot.Core.GLTFDocumentExtension._export_post

{-# NOINLINE bindGLTFDocumentExtension__export_preflight #-}

bindGLTFDocumentExtension__export_preflight :: MethodBind
bindGLTFDocumentExtension__export_preflight
  = unsafePerformIO $
      withCString "GLTFDocumentExtension" $
        \ clsNamePtr ->
          withCString "_export_preflight" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_export_preflight ::
                    (GLTFDocumentExtension :< cls, Object :< cls) =>
                    cls -> GLTFState -> Node -> IO Int
_export_preflight cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFDocumentExtension__export_preflight
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFDocumentExtension "_export_preflight"
           '[GLTFState, Node]
           (IO Int)
         where
        nodeMethod = Godot.Core.GLTFDocumentExtension._export_preflight

{-# NOINLINE bindGLTFDocumentExtension__generate_scene_node #-}

bindGLTFDocumentExtension__generate_scene_node :: MethodBind
bindGLTFDocumentExtension__generate_scene_node
  = unsafePerformIO $
      withCString "GLTFDocumentExtension" $
        \ clsNamePtr ->
          withCString "_generate_scene_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_generate_scene_node ::
                       (GLTFDocumentExtension :< cls, Object :< cls) =>
                       cls -> GLTFState -> GLTFNode -> Node -> IO Object
_generate_scene_node cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFDocumentExtension__generate_scene_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod GLTFDocumentExtension "_generate_scene_node"
           '[GLTFState, GLTFNode, Node]
           (IO Object)
         where
        nodeMethod = Godot.Core.GLTFDocumentExtension._generate_scene_node

{-# NOINLINE bindGLTFDocumentExtension__get_supported_extensions
             #-}

bindGLTFDocumentExtension__get_supported_extensions :: MethodBind
bindGLTFDocumentExtension__get_supported_extensions
  = unsafePerformIO $
      withCString "GLTFDocumentExtension" $
        \ clsNamePtr ->
          withCString "_get_supported_extensions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_supported_extensions ::
                            (GLTFDocumentExtension :< cls, Object :< cls) => cls -> IO Array
_get_supported_extensions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFDocumentExtension__get_supported_extensions
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFDocumentExtension
           "_get_supported_extensions"
           '[]
           (IO Array)
         where
        nodeMethod
          = Godot.Core.GLTFDocumentExtension._get_supported_extensions

{-# NOINLINE bindGLTFDocumentExtension__import_node #-}

bindGLTFDocumentExtension__import_node :: MethodBind
bindGLTFDocumentExtension__import_node
  = unsafePerformIO $
      withCString "GLTFDocumentExtension" $
        \ clsNamePtr ->
          withCString "_import_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_import_node ::
               (GLTFDocumentExtension :< cls, Object :< cls) =>
               cls -> GLTFState -> GLTFNode -> Dictionary -> Node -> IO Int
_import_node cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFDocumentExtension__import_node
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFDocumentExtension "_import_node"
           '[GLTFState, GLTFNode, Dictionary, Node]
           (IO Int)
         where
        nodeMethod = Godot.Core.GLTFDocumentExtension._import_node

{-# NOINLINE bindGLTFDocumentExtension__import_post #-}

bindGLTFDocumentExtension__import_post :: MethodBind
bindGLTFDocumentExtension__import_post
  = unsafePerformIO $
      withCString "GLTFDocumentExtension" $
        \ clsNamePtr ->
          withCString "_import_post" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_import_post ::
               (GLTFDocumentExtension :< cls, Object :< cls) =>
               cls -> GLTFState -> Node -> IO Int
_import_post cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFDocumentExtension__import_post
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFDocumentExtension "_import_post"
           '[GLTFState, Node]
           (IO Int)
         where
        nodeMethod = Godot.Core.GLTFDocumentExtension._import_post

{-# NOINLINE bindGLTFDocumentExtension__import_post_parse #-}

bindGLTFDocumentExtension__import_post_parse :: MethodBind
bindGLTFDocumentExtension__import_post_parse
  = unsafePerformIO $
      withCString "GLTFDocumentExtension" $
        \ clsNamePtr ->
          withCString "_import_post_parse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_import_post_parse ::
                     (GLTFDocumentExtension :< cls, Object :< cls) =>
                     cls -> GLTFState -> IO Int
_import_post_parse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFDocumentExtension__import_post_parse
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFDocumentExtension "_import_post_parse"
           '[GLTFState]
           (IO Int)
         where
        nodeMethod = Godot.Core.GLTFDocumentExtension._import_post_parse

{-# NOINLINE bindGLTFDocumentExtension__import_preflight #-}

bindGLTFDocumentExtension__import_preflight :: MethodBind
bindGLTFDocumentExtension__import_preflight
  = unsafePerformIO $
      withCString "GLTFDocumentExtension" $
        \ clsNamePtr ->
          withCString "_import_preflight" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_import_preflight ::
                    (GLTFDocumentExtension :< cls, Object :< cls) =>
                    cls -> GLTFState -> PoolStringArray -> IO Int
_import_preflight cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGLTFDocumentExtension__import_preflight
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFDocumentExtension "_import_preflight"
           '[GLTFState, PoolStringArray]
           (IO Int)
         where
        nodeMethod = Godot.Core.GLTFDocumentExtension._import_preflight

{-# NOINLINE bindGLTFDocumentExtension__parse_node_extensions #-}

bindGLTFDocumentExtension__parse_node_extensions :: MethodBind
bindGLTFDocumentExtension__parse_node_extensions
  = unsafePerformIO $
      withCString "GLTFDocumentExtension" $
        \ clsNamePtr ->
          withCString "_parse_node_extensions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_parse_node_extensions ::
                         (GLTFDocumentExtension :< cls, Object :< cls) =>
                         cls -> GLTFState -> GLTFNode -> Dictionary -> IO Int
_parse_node_extensions cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGLTFDocumentExtension__parse_node_extensions
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod GLTFDocumentExtension "_parse_node_extensions"
           '[GLTFState, GLTFNode, Dictionary]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.GLTFDocumentExtension._parse_node_extensions