{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorScriptPicker
       (Godot.Tools.EditorScriptPicker.get_script_owner,
        Godot.Tools.EditorScriptPicker.set_script_owner)
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
import Godot.Tools.EditorResourcePicker()

instance NodeProperty EditorScriptPicker "script_owner" Node 'False
         where
        nodeProperty
          = (get_script_owner, wrapDroppingSetter set_script_owner, Nothing)

{-# NOINLINE bindEditorScriptPicker_get_script_owner #-}

-- | The owner @Node@ of the script property that holds the edited resource.
bindEditorScriptPicker_get_script_owner :: MethodBind
bindEditorScriptPicker_get_script_owner
  = unsafePerformIO $
      withCString "EditorScriptPicker" $
        \ clsNamePtr ->
          withCString "get_script_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The owner @Node@ of the script property that holds the edited resource.
get_script_owner ::
                   (EditorScriptPicker :< cls, Object :< cls) => cls -> IO Node
get_script_owner cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorScriptPicker_get_script_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod EditorScriptPicker "get_script_owner" '[]
           (IO Node)
         where
        nodeMethod = Godot.Tools.EditorScriptPicker.get_script_owner

{-# NOINLINE bindEditorScriptPicker_set_script_owner #-}

-- | The owner @Node@ of the script property that holds the edited resource.
bindEditorScriptPicker_set_script_owner :: MethodBind
bindEditorScriptPicker_set_script_owner
  = unsafePerformIO $
      withCString "EditorScriptPicker" $
        \ clsNamePtr ->
          withCString "set_script_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The owner @Node@ of the script property that holds the edited resource.
set_script_owner ::
                   (EditorScriptPicker :< cls, Object :< cls) => cls -> Node -> IO ()
set_script_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorScriptPicker_set_script_owner
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorScriptPicker "set_script_owner" '[Node]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorScriptPicker.set_script_owner