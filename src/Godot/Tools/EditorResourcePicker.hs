{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorResourcePicker
       (Godot.Tools.EditorResourcePicker.sig_resource_changed,
        Godot.Tools.EditorResourcePicker.sig_resource_selected,
        Godot.Tools.EditorResourcePicker._button_draw,
        Godot.Tools.EditorResourcePicker._button_input,
        Godot.Tools.EditorResourcePicker._edit_menu_cbk,
        Godot.Tools.EditorResourcePicker._file_quick_selected,
        Godot.Tools.EditorResourcePicker._file_selected,
        Godot.Tools.EditorResourcePicker._resource_selected,
        Godot.Tools.EditorResourcePicker._update_menu,
        Godot.Tools.EditorResourcePicker._update_resource_preview,
        Godot.Tools.EditorResourcePicker.can_drop_data_fw,
        Godot.Tools.EditorResourcePicker.drop_data_fw,
        Godot.Tools.EditorResourcePicker.get_allowed_types,
        Godot.Tools.EditorResourcePicker.get_base_type,
        Godot.Tools.EditorResourcePicker.get_drag_data_fw,
        Godot.Tools.EditorResourcePicker.get_edited_resource,
        Godot.Tools.EditorResourcePicker.handle_menu_selected,
        Godot.Tools.EditorResourcePicker.is_editable,
        Godot.Tools.EditorResourcePicker.is_toggle_mode,
        Godot.Tools.EditorResourcePicker.set_base_type,
        Godot.Tools.EditorResourcePicker.set_create_options,
        Godot.Tools.EditorResourcePicker.set_editable,
        Godot.Tools.EditorResourcePicker.set_edited_resource,
        Godot.Tools.EditorResourcePicker.set_toggle_mode,
        Godot.Tools.EditorResourcePicker.set_toggle_pressed)
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
import Godot.Core.HBoxContainer()

-- | Emitted when the value of the edited resource was changed.
sig_resource_changed ::
                     Godot.Internal.Dispatch.Signal EditorResourcePicker
sig_resource_changed
  = Godot.Internal.Dispatch.Signal "resource_changed"

instance NodeSignal EditorResourcePicker "resource_changed"
           '[Resource]

-- | Emitted when the resource value was set and user clicked to edit it. When @edit@ is @true@, the signal was caused by the context menu "Edit" option.
sig_resource_selected ::
                      Godot.Internal.Dispatch.Signal EditorResourcePicker
sig_resource_selected
  = Godot.Internal.Dispatch.Signal "resource_selected"

instance NodeSignal EditorResourcePicker "resource_selected"
           '[Resource, Bool]

instance NodeProperty EditorResourcePicker "base_type" GodotString
           'False
         where
        nodeProperty
          = (get_base_type, wrapDroppingSetter set_base_type, Nothing)

instance NodeProperty EditorResourcePicker "editable" Bool 'False
         where
        nodeProperty
          = (is_editable, wrapDroppingSetter set_editable, Nothing)

instance NodeProperty EditorResourcePicker "edited_resource"
           Resource
           'False
         where
        nodeProperty
          = (get_edited_resource, wrapDroppingSetter set_edited_resource,
             Nothing)

instance NodeProperty EditorResourcePicker "toggle_mode" Bool
           'False
         where
        nodeProperty
          = (is_toggle_mode, wrapDroppingSetter set_toggle_mode, Nothing)

{-# NOINLINE bindEditorResourcePicker__button_draw #-}

bindEditorResourcePicker__button_draw :: MethodBind
bindEditorResourcePicker__button_draw
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "_button_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_button_draw ::
               (EditorResourcePicker :< cls, Object :< cls) => cls -> IO ()
_button_draw cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker__button_draw
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "_button_draw" '[] (IO ())
         where
        nodeMethod = Godot.Tools.EditorResourcePicker._button_draw

{-# NOINLINE bindEditorResourcePicker__button_input #-}

bindEditorResourcePicker__button_input :: MethodBind
bindEditorResourcePicker__button_input
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "_button_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_button_input ::
                (EditorResourcePicker :< cls, Object :< cls) =>
                cls -> InputEvent -> IO ()
_button_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker__button_input
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "_button_input"
           '[InputEvent]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorResourcePicker._button_input

{-# NOINLINE bindEditorResourcePicker__edit_menu_cbk #-}

bindEditorResourcePicker__edit_menu_cbk :: MethodBind
bindEditorResourcePicker__edit_menu_cbk
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "_edit_menu_cbk" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_menu_cbk ::
                 (EditorResourcePicker :< cls, Object :< cls) => cls -> Int -> IO ()
_edit_menu_cbk cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker__edit_menu_cbk
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "_edit_menu_cbk" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorResourcePicker._edit_menu_cbk

{-# NOINLINE bindEditorResourcePicker__file_quick_selected #-}

bindEditorResourcePicker__file_quick_selected :: MethodBind
bindEditorResourcePicker__file_quick_selected
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "_file_quick_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_file_quick_selected ::
                       (EditorResourcePicker :< cls, Object :< cls) => cls -> IO ()
_file_quick_selected cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorResourcePicker__file_quick_selected
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "_file_quick_selected" '[]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorResourcePicker._file_quick_selected

{-# NOINLINE bindEditorResourcePicker__file_selected #-}

bindEditorResourcePicker__file_selected :: MethodBind
bindEditorResourcePicker__file_selected
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "_file_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_file_selected ::
                 (EditorResourcePicker :< cls, Object :< cls) =>
                 cls -> GodotString -> IO ()
_file_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker__file_selected
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "_file_selected"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorResourcePicker._file_selected

{-# NOINLINE bindEditorResourcePicker__resource_selected #-}

bindEditorResourcePicker__resource_selected :: MethodBind
bindEditorResourcePicker__resource_selected
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "_resource_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_resource_selected ::
                     (EditorResourcePicker :< cls, Object :< cls) => cls -> IO ()
_resource_selected cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker__resource_selected
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "_resource_selected" '[]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorResourcePicker._resource_selected

{-# NOINLINE bindEditorResourcePicker__update_menu #-}

bindEditorResourcePicker__update_menu :: MethodBind
bindEditorResourcePicker__update_menu
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "_update_menu" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_menu ::
               (EditorResourcePicker :< cls, Object :< cls) => cls -> IO ()
_update_menu cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker__update_menu
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "_update_menu" '[] (IO ())
         where
        nodeMethod = Godot.Tools.EditorResourcePicker._update_menu

{-# NOINLINE bindEditorResourcePicker__update_resource_preview #-}

bindEditorResourcePicker__update_resource_preview :: MethodBind
bindEditorResourcePicker__update_resource_preview
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "_update_resource_preview" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_resource_preview ::
                           (EditorResourcePicker :< cls, Object :< cls) =>
                           cls -> GodotString -> Texture -> Texture -> Int -> IO ()
_update_resource_preview cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorResourcePicker__update_resource_preview
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "_update_resource_preview"
           '[GodotString, Texture, Texture, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Tools.EditorResourcePicker._update_resource_preview

{-# NOINLINE bindEditorResourcePicker_can_drop_data_fw #-}

bindEditorResourcePicker_can_drop_data_fw :: MethodBind
bindEditorResourcePicker_can_drop_data_fw
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "can_drop_data_fw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

can_drop_data_fw ::
                   (EditorResourcePicker :< cls, Object :< cls) =>
                   cls -> Vector2 -> GodotVariant -> Control -> IO Bool
can_drop_data_fw cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker_can_drop_data_fw
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "can_drop_data_fw"
           '[Vector2, GodotVariant, Control]
           (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorResourcePicker.can_drop_data_fw

{-# NOINLINE bindEditorResourcePicker_drop_data_fw #-}

bindEditorResourcePicker_drop_data_fw :: MethodBind
bindEditorResourcePicker_drop_data_fw
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "drop_data_fw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

drop_data_fw ::
               (EditorResourcePicker :< cls, Object :< cls) =>
               cls -> Vector2 -> GodotVariant -> Control -> IO ()
drop_data_fw cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker_drop_data_fw
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "drop_data_fw"
           '[Vector2, GodotVariant, Control]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorResourcePicker.drop_data_fw

{-# NOINLINE bindEditorResourcePicker_get_allowed_types #-}

-- | Returns a list of all allowed types and subtypes corresponding to the @base_type@. If the @base_type@ is empty, an empty list is returned.
bindEditorResourcePicker_get_allowed_types :: MethodBind
bindEditorResourcePicker_get_allowed_types
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "get_allowed_types" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of all allowed types and subtypes corresponding to the @base_type@. If the @base_type@ is empty, an empty list is returned.
get_allowed_types ::
                    (EditorResourcePicker :< cls, Object :< cls) =>
                    cls -> IO PoolStringArray
get_allowed_types cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker_get_allowed_types
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "get_allowed_types" '[]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Tools.EditorResourcePicker.get_allowed_types

{-# NOINLINE bindEditorResourcePicker_get_base_type #-}

-- | The base type of allowed resource types. Can be a comma-separated list of several options.
bindEditorResourcePicker_get_base_type :: MethodBind
bindEditorResourcePicker_get_base_type
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "get_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The base type of allowed resource types. Can be a comma-separated list of several options.
get_base_type ::
                (EditorResourcePicker :< cls, Object :< cls) =>
                cls -> IO GodotString
get_base_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker_get_base_type
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "get_base_type" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorResourcePicker.get_base_type

{-# NOINLINE bindEditorResourcePicker_get_drag_data_fw #-}

bindEditorResourcePicker_get_drag_data_fw :: MethodBind
bindEditorResourcePicker_get_drag_data_fw
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "get_drag_data_fw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_drag_data_fw ::
                   (EditorResourcePicker :< cls, Object :< cls) =>
                   cls -> Vector2 -> Control -> IO GodotVariant
get_drag_data_fw cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker_get_drag_data_fw
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> return var)

instance NodeMethod EditorResourcePicker "get_drag_data_fw"
           '[Vector2, Control]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Tools.EditorResourcePicker.get_drag_data_fw

{-# NOINLINE bindEditorResourcePicker_get_edited_resource #-}

-- | The edited resource value.
bindEditorResourcePicker_get_edited_resource :: MethodBind
bindEditorResourcePicker_get_edited_resource
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "get_edited_resource" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The edited resource value.
get_edited_resource ::
                      (EditorResourcePicker :< cls, Object :< cls) => cls -> IO Resource
get_edited_resource cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker_get_edited_resource
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod EditorResourcePicker "get_edited_resource" '[]
           (IO Resource)
         where
        nodeMethod = Godot.Tools.EditorResourcePicker.get_edited_resource

{-# NOINLINE bindEditorResourcePicker_handle_menu_selected #-}

-- | This virtual method can be implemented to handle context menu items not handled by default. See @method set_create_options@.
bindEditorResourcePicker_handle_menu_selected :: MethodBind
bindEditorResourcePicker_handle_menu_selected
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "handle_menu_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This virtual method can be implemented to handle context menu items not handled by default. See @method set_create_options@.
handle_menu_selected ::
                       (EditorResourcePicker :< cls, Object :< cls) =>
                       cls -> Int -> IO Bool
handle_menu_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorResourcePicker_handle_menu_selected
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "handle_menu_selected"
           '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorResourcePicker.handle_menu_selected

{-# NOINLINE bindEditorResourcePicker_is_editable #-}

-- | If @true@, the value can be selected and edited.
bindEditorResourcePicker_is_editable :: MethodBind
bindEditorResourcePicker_is_editable
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "is_editable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the value can be selected and edited.
is_editable ::
              (EditorResourcePicker :< cls, Object :< cls) => cls -> IO Bool
is_editable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker_is_editable
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "is_editable" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorResourcePicker.is_editable

{-# NOINLINE bindEditorResourcePicker_is_toggle_mode #-}

-- | If @true@, the main button with the resource preview works in the toggle mode. Use @method set_toggle_pressed@ to manually set the state.
bindEditorResourcePicker_is_toggle_mode :: MethodBind
bindEditorResourcePicker_is_toggle_mode
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "is_toggle_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the main button with the resource preview works in the toggle mode. Use @method set_toggle_pressed@ to manually set the state.
is_toggle_mode ::
                 (EditorResourcePicker :< cls, Object :< cls) => cls -> IO Bool
is_toggle_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker_is_toggle_mode
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "is_toggle_mode" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorResourcePicker.is_toggle_mode

{-# NOINLINE bindEditorResourcePicker_set_base_type #-}

-- | The base type of allowed resource types. Can be a comma-separated list of several options.
bindEditorResourcePicker_set_base_type :: MethodBind
bindEditorResourcePicker_set_base_type
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "set_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The base type of allowed resource types. Can be a comma-separated list of several options.
set_base_type ::
                (EditorResourcePicker :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_base_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker_set_base_type
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "set_base_type"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorResourcePicker.set_base_type

{-# NOINLINE bindEditorResourcePicker_set_create_options #-}

-- | This virtual method is called when updating the context menu of @EditorResourcePicker@. Implement this method to override the "New ..." items with your own options. @menu_node@ is a reference to the @PopupMenu@ node.
--   				__Note:__ Implement @method handle_menu_selected@ to handle these custom items.
bindEditorResourcePicker_set_create_options :: MethodBind
bindEditorResourcePicker_set_create_options
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "set_create_options" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This virtual method is called when updating the context menu of @EditorResourcePicker@. Implement this method to override the "New ..." items with your own options. @menu_node@ is a reference to the @PopupMenu@ node.
--   				__Note:__ Implement @method handle_menu_selected@ to handle these custom items.
set_create_options ::
                     (EditorResourcePicker :< cls, Object :< cls) =>
                     cls -> Object -> IO ()
set_create_options cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker_set_create_options
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "set_create_options"
           '[Object]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorResourcePicker.set_create_options

{-# NOINLINE bindEditorResourcePicker_set_editable #-}

-- | If @true@, the value can be selected and edited.
bindEditorResourcePicker_set_editable :: MethodBind
bindEditorResourcePicker_set_editable
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "set_editable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the value can be selected and edited.
set_editable ::
               (EditorResourcePicker :< cls, Object :< cls) =>
               cls -> Bool -> IO ()
set_editable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker_set_editable
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "set_editable" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorResourcePicker.set_editable

{-# NOINLINE bindEditorResourcePicker_set_edited_resource #-}

-- | The edited resource value.
bindEditorResourcePicker_set_edited_resource :: MethodBind
bindEditorResourcePicker_set_edited_resource
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "set_edited_resource" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The edited resource value.
set_edited_resource ::
                      (EditorResourcePicker :< cls, Object :< cls) =>
                      cls -> Resource -> IO ()
set_edited_resource cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker_set_edited_resource
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "set_edited_resource"
           '[Resource]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorResourcePicker.set_edited_resource

{-# NOINLINE bindEditorResourcePicker_set_toggle_mode #-}

-- | If @true@, the main button with the resource preview works in the toggle mode. Use @method set_toggle_pressed@ to manually set the state.
bindEditorResourcePicker_set_toggle_mode :: MethodBind
bindEditorResourcePicker_set_toggle_mode
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "set_toggle_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the main button with the resource preview works in the toggle mode. Use @method set_toggle_pressed@ to manually set the state.
set_toggle_mode ::
                  (EditorResourcePicker :< cls, Object :< cls) =>
                  cls -> Bool -> IO ()
set_toggle_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker_set_toggle_mode
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "set_toggle_mode" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorResourcePicker.set_toggle_mode

{-# NOINLINE bindEditorResourcePicker_set_toggle_pressed #-}

-- | Sets the toggle mode state for the main button. Works only if @toggle_mode@ is set to @true@.
bindEditorResourcePicker_set_toggle_pressed :: MethodBind
bindEditorResourcePicker_set_toggle_pressed
  = unsafePerformIO $
      withCString "EditorResourcePicker" $
        \ clsNamePtr ->
          withCString "set_toggle_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the toggle mode state for the main button. Works only if @toggle_mode@ is set to @true@.
set_toggle_pressed ::
                     (EditorResourcePicker :< cls, Object :< cls) =>
                     cls -> Bool -> IO ()
set_toggle_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePicker_set_toggle_pressed
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorResourcePicker "set_toggle_pressed"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorResourcePicker.set_toggle_pressed