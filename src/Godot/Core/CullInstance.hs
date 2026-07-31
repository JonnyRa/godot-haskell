{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CullInstance
       (Godot.Core.CullInstance._PORTAL_MODE_STATIC,
        Godot.Core.CullInstance._PORTAL_MODE_IGNORE,
        Godot.Core.CullInstance._PORTAL_MODE_ROAMING,
        Godot.Core.CullInstance._PORTAL_MODE_GLOBAL,
        Godot.Core.CullInstance._PORTAL_MODE_DYNAMIC,
        Godot.Core.CullInstance.get_include_in_bound,
        Godot.Core.CullInstance.get_portal_autoplace_priority,
        Godot.Core.CullInstance.get_portal_mode,
        Godot.Core.CullInstance.set_include_in_bound,
        Godot.Core.CullInstance.set_portal_autoplace_priority,
        Godot.Core.CullInstance.set_portal_mode)
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
import Godot.Core.Spatial()

_PORTAL_MODE_STATIC :: Int
_PORTAL_MODE_STATIC = 0

_PORTAL_MODE_IGNORE :: Int
_PORTAL_MODE_IGNORE = 4

_PORTAL_MODE_ROAMING :: Int
_PORTAL_MODE_ROAMING = 2

_PORTAL_MODE_GLOBAL :: Int
_PORTAL_MODE_GLOBAL = 3

_PORTAL_MODE_DYNAMIC :: Int
_PORTAL_MODE_DYNAMIC = 1

instance NodeProperty CullInstance "autoplace_priority" Int 'False
         where
        nodeProperty
          = (get_portal_autoplace_priority,
             wrapDroppingSetter set_portal_autoplace_priority, Nothing)

instance NodeProperty CullInstance "include_in_bound" Bool 'False
         where
        nodeProperty
          = (get_include_in_bound, wrapDroppingSetter set_include_in_bound,
             Nothing)

instance NodeProperty CullInstance "portal_mode" Int 'False where
        nodeProperty
          = (get_portal_mode, wrapDroppingSetter set_portal_mode, Nothing)

{-# NOINLINE bindCullInstance_get_include_in_bound #-}

-- | When a manual bound has not been explicitly specified for a @Room@, the convex hull bound will be estimated from the geometry of the objects within the room. This setting determines whether the geometry of an object is included in this estimate of the room bound.
--   			__Note:__ This setting is only relevant when the object is set to @PORTAL_MODE_STATIC@ or @PORTAL_MODE_DYNAMIC@, and for @Portal@s.
bindCullInstance_get_include_in_bound :: MethodBind
bindCullInstance_get_include_in_bound
  = unsafePerformIO $
      withCString "CullInstance" $
        \ clsNamePtr ->
          withCString "get_include_in_bound" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When a manual bound has not been explicitly specified for a @Room@, the convex hull bound will be estimated from the geometry of the objects within the room. This setting determines whether the geometry of an object is included in this estimate of the room bound.
--   			__Note:__ This setting is only relevant when the object is set to @PORTAL_MODE_STATIC@ or @PORTAL_MODE_DYNAMIC@, and for @Portal@s.
get_include_in_bound ::
                       (CullInstance :< cls, Object :< cls) => cls -> IO Bool
get_include_in_bound cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCullInstance_get_include_in_bound
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CullInstance "get_include_in_bound" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.CullInstance.get_include_in_bound

{-# NOINLINE bindCullInstance_get_portal_autoplace_priority #-}

-- | When set to @0@, @CullInstance@s will be autoplaced in the @Room@ with the highest priority.
--   			When set to a value other than @0@, the system will attempt to autoplace in a @Room@ with the @autoplace_priority@, if it is present.
--   			This can be used to control autoplacement of building exteriors in an outer @RoomGroup@.
bindCullInstance_get_portal_autoplace_priority :: MethodBind
bindCullInstance_get_portal_autoplace_priority
  = unsafePerformIO $
      withCString "CullInstance" $
        \ clsNamePtr ->
          withCString "get_portal_autoplace_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When set to @0@, @CullInstance@s will be autoplaced in the @Room@ with the highest priority.
--   			When set to a value other than @0@, the system will attempt to autoplace in a @Room@ with the @autoplace_priority@, if it is present.
--   			This can be used to control autoplacement of building exteriors in an outer @RoomGroup@.
get_portal_autoplace_priority ::
                                (CullInstance :< cls, Object :< cls) => cls -> IO Int
get_portal_autoplace_priority cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCullInstance_get_portal_autoplace_priority
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CullInstance "get_portal_autoplace_priority"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.CullInstance.get_portal_autoplace_priority

{-# NOINLINE bindCullInstance_get_portal_mode #-}

-- | When using @Room@s and @Portal@s, this specifies how the @CullInstance@ is processed in the system.
bindCullInstance_get_portal_mode :: MethodBind
bindCullInstance_get_portal_mode
  = unsafePerformIO $
      withCString "CullInstance" $
        \ clsNamePtr ->
          withCString "get_portal_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When using @Room@s and @Portal@s, this specifies how the @CullInstance@ is processed in the system.
get_portal_mode ::
                  (CullInstance :< cls, Object :< cls) => cls -> IO Int
get_portal_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCullInstance_get_portal_mode
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CullInstance "get_portal_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.CullInstance.get_portal_mode

{-# NOINLINE bindCullInstance_set_include_in_bound #-}

-- | When a manual bound has not been explicitly specified for a @Room@, the convex hull bound will be estimated from the geometry of the objects within the room. This setting determines whether the geometry of an object is included in this estimate of the room bound.
--   			__Note:__ This setting is only relevant when the object is set to @PORTAL_MODE_STATIC@ or @PORTAL_MODE_DYNAMIC@, and for @Portal@s.
bindCullInstance_set_include_in_bound :: MethodBind
bindCullInstance_set_include_in_bound
  = unsafePerformIO $
      withCString "CullInstance" $
        \ clsNamePtr ->
          withCString "set_include_in_bound" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When a manual bound has not been explicitly specified for a @Room@, the convex hull bound will be estimated from the geometry of the objects within the room. This setting determines whether the geometry of an object is included in this estimate of the room bound.
--   			__Note:__ This setting is only relevant when the object is set to @PORTAL_MODE_STATIC@ or @PORTAL_MODE_DYNAMIC@, and for @Portal@s.
set_include_in_bound ::
                       (CullInstance :< cls, Object :< cls) => cls -> Bool -> IO ()
set_include_in_bound cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCullInstance_set_include_in_bound
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CullInstance "set_include_in_bound" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CullInstance.set_include_in_bound

{-# NOINLINE bindCullInstance_set_portal_autoplace_priority #-}

-- | When set to @0@, @CullInstance@s will be autoplaced in the @Room@ with the highest priority.
--   			When set to a value other than @0@, the system will attempt to autoplace in a @Room@ with the @autoplace_priority@, if it is present.
--   			This can be used to control autoplacement of building exteriors in an outer @RoomGroup@.
bindCullInstance_set_portal_autoplace_priority :: MethodBind
bindCullInstance_set_portal_autoplace_priority
  = unsafePerformIO $
      withCString "CullInstance" $
        \ clsNamePtr ->
          withCString "set_portal_autoplace_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When set to @0@, @CullInstance@s will be autoplaced in the @Room@ with the highest priority.
--   			When set to a value other than @0@, the system will attempt to autoplace in a @Room@ with the @autoplace_priority@, if it is present.
--   			This can be used to control autoplacement of building exteriors in an outer @RoomGroup@.
set_portal_autoplace_priority ::
                                (CullInstance :< cls, Object :< cls) => cls -> Int -> IO ()
set_portal_autoplace_priority cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCullInstance_set_portal_autoplace_priority
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CullInstance "set_portal_autoplace_priority"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CullInstance.set_portal_autoplace_priority

{-# NOINLINE bindCullInstance_set_portal_mode #-}

-- | When using @Room@s and @Portal@s, this specifies how the @CullInstance@ is processed in the system.
bindCullInstance_set_portal_mode :: MethodBind
bindCullInstance_set_portal_mode
  = unsafePerformIO $
      withCString "CullInstance" $
        \ clsNamePtr ->
          withCString "set_portal_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When using @Room@s and @Portal@s, this specifies how the @CullInstance@ is processed in the system.
set_portal_mode ::
                  (CullInstance :< cls, Object :< cls) => cls -> Int -> IO ()
set_portal_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCullInstance_set_portal_mode
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CullInstance "set_portal_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.CullInstance.set_portal_mode