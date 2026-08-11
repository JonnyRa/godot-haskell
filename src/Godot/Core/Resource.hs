{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Resource
       (Godot.Core.Resource.sig_changed,
        Godot.Core.Resource._setup_local_to_scene,
        Godot.Core.Resource.duplicate, Godot.Core.Resource.emit_changed,
        Godot.Core.Resource.get_local_scene, Godot.Core.Resource.get_name,
        Godot.Core.Resource.get_path, Godot.Core.Resource.get_rid,
        Godot.Core.Resource.is_local_to_scene,
        Godot.Core.Resource.set_local_to_scene,
        Godot.Core.Resource.set_name, Godot.Core.Resource.set_path,
        Godot.Core.Resource.setup_local_to_scene,
        Godot.Core.Resource.take_over_path)
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
import Godot.Core.Reference()

-- | Emitted when the resource changes, usually when one of its properties is modified. See also @method emit_changed@.
--   				__Note:__ This signal is not emitted automatically for custom resources, which means that you need to create a setter and emit the signal yourself.
sig_changed :: Godot.Internal.Dispatch.Signal Resource
sig_changed = Godot.Internal.Dispatch.Signal "changed"

instance NodeSignal Resource "changed" '[]

instance NodeProperty Resource "resource_local_to_scene" Bool
           'False
         where
        nodeProperty
          = (is_local_to_scene, wrapDroppingSetter set_local_to_scene,
             Nothing)

instance NodeProperty Resource "resource_name" GodotString 'False
         where
        nodeProperty = (get_name, wrapDroppingSetter set_name, Nothing)

instance NodeProperty Resource "resource_path" GodotString 'False
         where
        nodeProperty = (get_path, wrapDroppingSetter set_path, Nothing)

{-# NOINLINE bindResource__setup_local_to_scene #-}

-- | Override this method to customize the newly duplicated resource created from @method PackedScene.instance@, if the original's @resource_local_to_scene@ is set to @true@.
--   				__Example:__ Set a random @damage@ value to every local resource from an instantiated scene.
--   				
--   @
--   
--   				extends Resource
--   
--   				var damage = 0
--   
--   				func _setup_local_to_scene():
--   				    damage = rand_range(10, 40)
--   				
--   @
bindResource__setup_local_to_scene :: MethodBind
bindResource__setup_local_to_scene
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "_setup_local_to_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to customize the newly duplicated resource created from @method PackedScene.instance@, if the original's @resource_local_to_scene@ is set to @true@.
--   				__Example:__ Set a random @damage@ value to every local resource from an instantiated scene.
--   				
--   @
--   
--   				extends Resource
--   
--   				var damage = 0
--   
--   				func _setup_local_to_scene():
--   				    damage = rand_range(10, 40)
--   				
--   @
_setup_local_to_scene ::
                        (Resource :< cls, Object :< cls) => cls -> IO ()
_setup_local_to_scene cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource__setup_local_to_scene
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Resource "_setup_local_to_scene" '[] (IO ())
         where
        nodeMethod = Godot.Core.Resource._setup_local_to_scene

{-# NOINLINE bindResource_duplicate #-}

-- | Duplicates this resource, returning a new resource with its @export@ed or @PROPERTY_USAGE_STORAGE@ properties copied from the original.
--   				If @subresources@ is @false@, a shallow copy is returned; nested resources within subresources are not duplicated and are shared from the original resource. If @subresources@ is @true@, a deep copy is returned; nested subresources will be duplicated and are not shared.
--   				__Note:__ For custom resources, this method will fail if @method Object._init@ has been defined with required parameters.
bindResource_duplicate :: MethodBind
bindResource_duplicate
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "duplicate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Duplicates this resource, returning a new resource with its @export@ed or @PROPERTY_USAGE_STORAGE@ properties copied from the original.
--   				If @subresources@ is @false@, a shallow copy is returned; nested resources within subresources are not duplicated and are shared from the original resource. If @subresources@ is @true@, a deep copy is returned; nested subresources will be duplicated and are not shared.
--   				__Note:__ For custom resources, this method will fail if @method Object._init@ has been defined with required parameters.
duplicate ::
            (Resource :< cls, Object :< cls) =>
            cls -> Maybe Bool -> IO Resource
duplicate cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_duplicate (upcast cls) arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod Resource "duplicate" '[Maybe Bool]
           (IO Resource)
         where
        nodeMethod = Godot.Core.Resource.duplicate

{-# NOINLINE bindResource_emit_changed #-}

-- | Emits the @signal changed@ signal. This method is called automatically for some built-in resources.
--   				__Note:__ For custom resources, it's recommended to call this method whenever a meaningful change occurs, such as a modified property. This ensures that custom @Object@s depending on the resource are properly updated.
--   				
--   @
--   
--   				var damage setget set_damage
--   
--   				func set_damage(new_value):
--   				    if damage != new_value:
--   				        damage = new_value
--   				        emit_changed()
--   				
--   @
bindResource_emit_changed :: MethodBind
bindResource_emit_changed
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "emit_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emits the @signal changed@ signal. This method is called automatically for some built-in resources.
--   				__Note:__ For custom resources, it's recommended to call this method whenever a meaningful change occurs, such as a modified property. This ensures that custom @Object@s depending on the resource are properly updated.
--   				
--   @
--   
--   				var damage setget set_damage
--   
--   				func set_damage(new_value):
--   				    if damage != new_value:
--   				        damage = new_value
--   				        emit_changed()
--   				
--   @
emit_changed :: (Resource :< cls, Object :< cls) => cls -> IO ()
emit_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_emit_changed (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Resource "emit_changed" '[] (IO ()) where
        nodeMethod = Godot.Core.Resource.emit_changed

{-# NOINLINE bindResource_get_local_scene #-}

-- | If @resource_local_to_scene@ is set to @true@ and the resource has been loaded from a @PackedScene@ instantiation, returns the root @Node@ of the scene where this resource is used. Otherwise, returns @null@.
bindResource_get_local_scene :: MethodBind
bindResource_get_local_scene
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "get_local_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @resource_local_to_scene@ is set to @true@ and the resource has been loaded from a @PackedScene@ instantiation, returns the root @Node@ of the scene where this resource is used. Otherwise, returns @null@.
get_local_scene ::
                  (Resource :< cls, Object :< cls) => cls -> IO Node
get_local_scene cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_get_local_scene (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod Resource "get_local_scene" '[] (IO Node) where
        nodeMethod = Godot.Core.Resource.get_local_scene

{-# NOINLINE bindResource_get_name #-}

-- | An optional name for this resource. When defined, its value is displayed to represent the resource in the Inspector dock. For built-in scripts, the name is displayed as part of the tab name in the script editor.
--   			__Note:__ Some resource formats do not support resource names. You can still set the name in the editor or via code, but it will be lost when the resource is reloaded. For example, only built-in scripts can have a resource name, while scripts stored in separate files cannot.
bindResource_get_name :: MethodBind
bindResource_get_name
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "get_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | An optional name for this resource. When defined, its value is displayed to represent the resource in the Inspector dock. For built-in scripts, the name is displayed as part of the tab name in the script editor.
--   			__Note:__ Some resource formats do not support resource names. You can still set the name in the editor or via code, but it will be lost when the resource is reloaded. For example, only built-in scripts can have a resource name, while scripts stored in separate files cannot.
get_name ::
           (Resource :< cls, Object :< cls) => cls -> IO GodotString
get_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_get_name (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Resource "get_name" '[] (IO GodotString) where
        nodeMethod = Godot.Core.Resource.get_name

{-# NOINLINE bindResource_get_path #-}

-- | The unique path to this resource. If it has been saved to disk, the value will be its filepath. If the resource is exclusively contained within a scene, the value will be the @PackedScene@'s filepath, followed by a unique identifier.
--   			__Note:__ Setting this property manually may fail if a resource with the same path has already been previously loaded. If necessary, use @method take_over_path@.
bindResource_get_path :: MethodBind
bindResource_get_path
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "get_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The unique path to this resource. If it has been saved to disk, the value will be its filepath. If the resource is exclusively contained within a scene, the value will be the @PackedScene@'s filepath, followed by a unique identifier.
--   			__Note:__ Setting this property manually may fail if a resource with the same path has already been previously loaded. If necessary, use @method take_over_path@.
get_path ::
           (Resource :< cls, Object :< cls) => cls -> IO GodotString
get_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_get_path (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Resource "get_path" '[] (IO GodotString) where
        nodeMethod = Godot.Core.Resource.get_path

{-# NOINLINE bindResource_get_rid #-}

-- | Returns the @RID@ of this resource (or an empty RID). Many resources (such as @Texture@, @Shape@, and so on) are high-level abstractions of resources stored in a specialized server (@VisualServer@, @PhysicsServer@, etc.), so this function will return the original @RID@.
bindResource_get_rid :: MethodBind
bindResource_get_rid
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "get_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of this resource (or an empty RID). Many resources (such as @Texture@, @Shape@, and so on) are high-level abstractions of resources stored in a specialized server (@VisualServer@, @PhysicsServer@, etc.), so this function will return the original @RID@.
get_rid :: (Resource :< cls, Object :< cls) => cls -> IO Rid
get_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_get_rid (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Resource "get_rid" '[] (IO Rid) where
        nodeMethod = Godot.Core.Resource.get_rid

{-# NOINLINE bindResource_is_local_to_scene #-}

-- | If @true@, the resource is duplicated for each instance of all scenes using it. At run-time, the resource can be modified in one scene without affecting other instances (see @method PackedScene.instance@).
--   			__Note:__ Changing this property at run-time has no effect on already created duplicate resources.
bindResource_is_local_to_scene :: MethodBind
bindResource_is_local_to_scene
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "is_local_to_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the resource is duplicated for each instance of all scenes using it. At run-time, the resource can be modified in one scene without affecting other instances (see @method PackedScene.instance@).
--   			__Note:__ Changing this property at run-time has no effect on already created duplicate resources.
is_local_to_scene ::
                    (Resource :< cls, Object :< cls) => cls -> IO Bool
is_local_to_scene cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_is_local_to_scene (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Resource "is_local_to_scene" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Resource.is_local_to_scene

{-# NOINLINE bindResource_set_local_to_scene #-}

-- | If @true@, the resource is duplicated for each instance of all scenes using it. At run-time, the resource can be modified in one scene without affecting other instances (see @method PackedScene.instance@).
--   			__Note:__ Changing this property at run-time has no effect on already created duplicate resources.
bindResource_set_local_to_scene :: MethodBind
bindResource_set_local_to_scene
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "set_local_to_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the resource is duplicated for each instance of all scenes using it. At run-time, the resource can be modified in one scene without affecting other instances (see @method PackedScene.instance@).
--   			__Note:__ Changing this property at run-time has no effect on already created duplicate resources.
set_local_to_scene ::
                     (Resource :< cls, Object :< cls) => cls -> Bool -> IO ()
set_local_to_scene cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_set_local_to_scene (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Resource "set_local_to_scene" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Resource.set_local_to_scene

{-# NOINLINE bindResource_set_name #-}

-- | An optional name for this resource. When defined, its value is displayed to represent the resource in the Inspector dock. For built-in scripts, the name is displayed as part of the tab name in the script editor.
--   			__Note:__ Some resource formats do not support resource names. You can still set the name in the editor or via code, but it will be lost when the resource is reloaded. For example, only built-in scripts can have a resource name, while scripts stored in separate files cannot.
bindResource_set_name :: MethodBind
bindResource_set_name
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "set_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | An optional name for this resource. When defined, its value is displayed to represent the resource in the Inspector dock. For built-in scripts, the name is displayed as part of the tab name in the script editor.
--   			__Note:__ Some resource formats do not support resource names. You can still set the name in the editor or via code, but it will be lost when the resource is reloaded. For example, only built-in scripts can have a resource name, while scripts stored in separate files cannot.
set_name ::
           (Resource :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_set_name (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Resource "set_name" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.Resource.set_name

{-# NOINLINE bindResource_set_path #-}

-- | The unique path to this resource. If it has been saved to disk, the value will be its filepath. If the resource is exclusively contained within a scene, the value will be the @PackedScene@'s filepath, followed by a unique identifier.
--   			__Note:__ Setting this property manually may fail if a resource with the same path has already been previously loaded. If necessary, use @method take_over_path@.
bindResource_set_path :: MethodBind
bindResource_set_path
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "set_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The unique path to this resource. If it has been saved to disk, the value will be its filepath. If the resource is exclusively contained within a scene, the value will be the @PackedScene@'s filepath, followed by a unique identifier.
--   			__Note:__ Setting this property manually may fail if a resource with the same path has already been previously loaded. If necessary, use @method take_over_path@.
set_path ::
           (Resource :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_set_path (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Resource "set_path" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.Resource.set_path

{-# NOINLINE bindResource_setup_local_to_scene #-}

-- | Calls @method _setup_local_to_scene@. If @resource_local_to_scene@ is set to @true@, this method is automatically called from @method PackedScene.instance@ by the newly duplicated resource within the scene instance.
bindResource_setup_local_to_scene :: MethodBind
bindResource_setup_local_to_scene
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "setup_local_to_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls @method _setup_local_to_scene@. If @resource_local_to_scene@ is set to @true@, this method is automatically called from @method PackedScene.instance@ by the newly duplicated resource within the scene instance.
setup_local_to_scene ::
                       (Resource :< cls, Object :< cls) => cls -> IO ()
setup_local_to_scene cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_setup_local_to_scene
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Resource "setup_local_to_scene" '[] (IO ())
         where
        nodeMethod = Godot.Core.Resource.setup_local_to_scene

{-# NOINLINE bindResource_take_over_path #-}

-- | Sets the @resource_path@ to @path@, potentially overriding an existing cache entry for this path. Further attempts to load an overridden resource by path will instead return this resource.
bindResource_take_over_path :: MethodBind
bindResource_take_over_path
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "take_over_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @resource_path@ to @path@, potentially overriding an existing cache entry for this path. Further attempts to load an overridden resource by path will instead return this resource.
take_over_path ::
                 (Resource :< cls, Object :< cls) => cls -> GodotString -> IO ()
take_over_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_take_over_path (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Resource "take_over_path" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Resource.take_over_path