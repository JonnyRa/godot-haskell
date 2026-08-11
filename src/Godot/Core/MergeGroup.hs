{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.MergeGroup
       (Godot.Core.MergeGroup._PARAM_ENABLED_SHADOW_PROXY,
        Godot.Core.MergeGroup._PARAM_ENABLED_AUTO_MERGE,
        Godot.Core.MergeGroup._PARAM_SPLITS_HORIZONTAL,
        Godot.Core.MergeGroup._PARAM_ENABLED_CONVERT_CSGS,
        Godot.Core.MergeGroup._PARAM_SPLITS_VERTICAL,
        Godot.Core.MergeGroup._PARAM_ENABLED_COMBINE_SURFACES,
        Godot.Core.MergeGroup._PARAM_ENABLED_CONVERT_GRIDMAPS,
        Godot.Core.MergeGroup._PARAM_ENABLED_CLEAN_MESHES,
        Godot.Core.MergeGroup._PARAM_GROUP_SIZE,
        Godot.Core.MergeGroup._PARAM_MIN_SPLIT_POLY_COUNT,
        Godot.Core.MergeGroup.get_param,
        Godot.Core.MergeGroup.get_param_enabled,
        Godot.Core.MergeGroup.merge_meshes,
        Godot.Core.MergeGroup.set_param,
        Godot.Core.MergeGroup.set_param_enabled)
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

_PARAM_ENABLED_SHADOW_PROXY :: Int
_PARAM_ENABLED_SHADOW_PROXY = 1

_PARAM_ENABLED_AUTO_MERGE :: Int
_PARAM_ENABLED_AUTO_MERGE = 0

_PARAM_SPLITS_HORIZONTAL :: Int
_PARAM_SPLITS_HORIZONTAL = 1

_PARAM_ENABLED_CONVERT_CSGS :: Int
_PARAM_ENABLED_CONVERT_CSGS = 2

_PARAM_SPLITS_VERTICAL :: Int
_PARAM_SPLITS_VERTICAL = 2

_PARAM_ENABLED_COMBINE_SURFACES :: Int
_PARAM_ENABLED_COMBINE_SURFACES = 4

_PARAM_ENABLED_CONVERT_GRIDMAPS :: Int
_PARAM_ENABLED_CONVERT_GRIDMAPS = 3

_PARAM_ENABLED_CLEAN_MESHES :: Int
_PARAM_ENABLED_CLEAN_MESHES = 5

_PARAM_GROUP_SIZE :: Int
_PARAM_GROUP_SIZE = 0

_PARAM_MIN_SPLIT_POLY_COUNT :: Int
_PARAM_MIN_SPLIT_POLY_COUNT = 3

instance NodeProperty MergeGroup "auto_merge" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 0 get_param_enabled,
             wrapIndexedSetter 0 set_param_enabled, Nothing)

instance NodeProperty MergeGroup "shadow_proxy" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 1 get_param_enabled,
             wrapIndexedSetter 1 set_param_enabled, Nothing)

{-# NOINLINE bindMergeGroup_get_param #-}

-- | Returns the value of the specified @enum MergeGroup.Param@ parameter.
bindMergeGroup_get_param :: MethodBind
bindMergeGroup_get_param
  = unsafePerformIO $
      withCString "MergeGroup" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of the specified @enum MergeGroup.Param@ parameter.
get_param ::
            (MergeGroup :< cls, Object :< cls) => cls -> Int -> IO Int
get_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMergeGroup_get_param (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod MergeGroup "get_param" '[Int] (IO Int) where
        nodeMethod = Godot.Core.MergeGroup.get_param

{-# NOINLINE bindMergeGroup_get_param_enabled #-}

-- | Gets the value of the specified @enum MergeGroup.ParamEnabled@ parameter.
bindMergeGroup_get_param_enabled :: MethodBind
bindMergeGroup_get_param_enabled
  = unsafePerformIO $
      withCString "MergeGroup" $
        \ clsNamePtr ->
          withCString "get_param_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the value of the specified @enum MergeGroup.ParamEnabled@ parameter.
get_param_enabled ::
                    (MergeGroup :< cls, Object :< cls) => cls -> Int -> IO Bool
get_param_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMergeGroup_get_param_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod MergeGroup "get_param_enabled" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.MergeGroup.get_param_enabled

{-# NOINLINE bindMergeGroup_merge_meshes #-}

-- | You can choose to either automatically merge when the @MergeGroup@ enters the scene (usually during loading) using @auto_merge@, or you can manually trigger merging by calling this function.
--   				Manually activating merging is especially useful when you are @i@procedurally generating@/i@ your level, and when you want to set advanced parameters prior to merging at runtime.
bindMergeGroup_merge_meshes :: MethodBind
bindMergeGroup_merge_meshes
  = unsafePerformIO $
      withCString "MergeGroup" $
        \ clsNamePtr ->
          withCString "merge_meshes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | You can choose to either automatically merge when the @MergeGroup@ enters the scene (usually during loading) using @auto_merge@, or you can manually trigger merging by calling this function.
--   				Manually activating merging is especially useful when you are @i@procedurally generating@/i@ your level, and when you want to set advanced parameters prior to merging at runtime.
merge_meshes :: (MergeGroup :< cls, Object :< cls) => cls -> IO ()
merge_meshes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMergeGroup_merge_meshes (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod MergeGroup "merge_meshes" '[] (IO ()) where
        nodeMethod = Godot.Core.MergeGroup.merge_meshes

{-# NOINLINE bindMergeGroup_set_param #-}

-- | Sets the value of the specified @enum MergeGroup.Param@ parameter.
bindMergeGroup_set_param :: MethodBind
bindMergeGroup_set_param
  = unsafePerformIO $
      withCString "MergeGroup" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the value of the specified @enum MergeGroup.Param@ parameter.
set_param ::
            (MergeGroup :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMergeGroup_set_param (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod MergeGroup "set_param" '[Int, Int] (IO ())
         where
        nodeMethod = Godot.Core.MergeGroup.set_param

{-# NOINLINE bindMergeGroup_set_param_enabled #-}

-- | Sets the value of the specified @enum MergeGroup.ParamEnabled@ parameter.
bindMergeGroup_set_param_enabled :: MethodBind
bindMergeGroup_set_param_enabled
  = unsafePerformIO $
      withCString "MergeGroup" $
        \ clsNamePtr ->
          withCString "set_param_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the value of the specified @enum MergeGroup.ParamEnabled@ parameter.
set_param_enabled ::
                    (MergeGroup :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_param_enabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMergeGroup_set_param_enabled
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod MergeGroup "set_param_enabled" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.MergeGroup.set_param_enabled