{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.LOD
       (Godot.Core.LOD.get_hysteresis, Godot.Core.LOD.get_lod_priority,
        Godot.Core.LOD.set_hysteresis, Godot.Core.LOD.set_lod_priority)
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

instance NodeProperty LOD "hysteresis" Float 'False where
        nodeProperty
          = (get_hysteresis, wrapDroppingSetter set_hysteresis, Nothing)

instance NodeProperty LOD "lod_priority" Int 'False where
        nodeProperty
          = (get_lod_priority, wrapDroppingSetter set_lod_priority, Nothing)

{-# NOINLINE bindLOD_get_hysteresis #-}

-- | To prevent flickering at borders, a hysteresis distance will be added to threshold distances when the object is moving away from the @Camera@.
bindLOD_get_hysteresis :: MethodBind
bindLOD_get_hysteresis
  = unsafePerformIO $
      withCString "LOD" $
        \ clsNamePtr ->
          withCString "get_hysteresis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | To prevent flickering at borders, a hysteresis distance will be added to threshold distances when the object is moving away from the @Camera@.
get_hysteresis :: (LOD :< cls, Object :< cls) => cls -> IO Float
get_hysteresis cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLOD_get_hysteresis (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod LOD "get_hysteresis" '[] (IO Float) where
        nodeMethod = Godot.Core.LOD.get_hysteresis

{-# NOINLINE bindLOD_get_lod_priority #-}

-- | Determines the rate at which level of detail will be updated.
--   			Higher priorities will update faster, but use more CPU.
bindLOD_get_lod_priority :: MethodBind
bindLOD_get_lod_priority
  = unsafePerformIO $
      withCString "LOD" $
        \ clsNamePtr ->
          withCString "get_lod_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines the rate at which level of detail will be updated.
--   			Higher priorities will update faster, but use more CPU.
get_lod_priority :: (LOD :< cls, Object :< cls) => cls -> IO Int
get_lod_priority cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLOD_get_lod_priority (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod LOD "get_lod_priority" '[] (IO Int) where
        nodeMethod = Godot.Core.LOD.get_lod_priority

{-# NOINLINE bindLOD_set_hysteresis #-}

-- | To prevent flickering at borders, a hysteresis distance will be added to threshold distances when the object is moving away from the @Camera@.
bindLOD_set_hysteresis :: MethodBind
bindLOD_set_hysteresis
  = unsafePerformIO $
      withCString "LOD" $
        \ clsNamePtr ->
          withCString "set_hysteresis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | To prevent flickering at borders, a hysteresis distance will be added to threshold distances when the object is moving away from the @Camera@.
set_hysteresis ::
                 (LOD :< cls, Object :< cls) => cls -> Float -> IO ()
set_hysteresis cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLOD_set_hysteresis (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod LOD "set_hysteresis" '[Float] (IO ()) where
        nodeMethod = Godot.Core.LOD.set_hysteresis

{-# NOINLINE bindLOD_set_lod_priority #-}

-- | Determines the rate at which level of detail will be updated.
--   			Higher priorities will update faster, but use more CPU.
bindLOD_set_lod_priority :: MethodBind
bindLOD_set_lod_priority
  = unsafePerformIO $
      withCString "LOD" $
        \ clsNamePtr ->
          withCString "set_lod_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines the rate at which level of detail will be updated.
--   			Higher priorities will update faster, but use more CPU.
set_lod_priority ::
                   (LOD :< cls, Object :< cls) => cls -> Int -> IO ()
set_lod_priority cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLOD_set_lod_priority (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod LOD "set_lod_priority" '[Int] (IO ()) where
        nodeMethod = Godot.Core.LOD.set_lod_priority