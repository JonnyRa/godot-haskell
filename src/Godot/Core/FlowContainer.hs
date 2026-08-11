{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.FlowContainer
       (Godot.Core.FlowContainer._ALIGN_END,
        Godot.Core.FlowContainer._ALIGN_BEGIN,
        Godot.Core.FlowContainer._ALIGN_CENTER,
        Godot.Core.FlowContainer.get_alignment,
        Godot.Core.FlowContainer.get_line_count,
        Godot.Core.FlowContainer.set_alignment)
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
import Godot.Core.Container()

_ALIGN_END :: Int
_ALIGN_END = 2

_ALIGN_BEGIN :: Int
_ALIGN_BEGIN = 0

_ALIGN_CENTER :: Int
_ALIGN_CENTER = 1

instance NodeProperty FlowContainer "alignment" Int 'False where
        nodeProperty
          = (get_alignment, wrapDroppingSetter set_alignment, Nothing)

{-# NOINLINE bindFlowContainer_get_alignment #-}

-- | The alignment of the container's children (must be one of @ALIGN_BEGIN@, @ALIGN_CENTER@ or @ALIGN_END@).
bindFlowContainer_get_alignment :: MethodBind
bindFlowContainer_get_alignment
  = unsafePerformIO $
      withCString "FlowContainer" $
        \ clsNamePtr ->
          withCString "get_alignment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The alignment of the container's children (must be one of @ALIGN_BEGIN@, @ALIGN_CENTER@ or @ALIGN_END@).
get_alignment ::
                (FlowContainer :< cls, Object :< cls) => cls -> IO Int
get_alignment cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFlowContainer_get_alignment (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod FlowContainer "get_alignment" '[] (IO Int)
         where
        nodeMethod = Godot.Core.FlowContainer.get_alignment

{-# NOINLINE bindFlowContainer_get_line_count #-}

-- | Returns the current line count.
bindFlowContainer_get_line_count :: MethodBind
bindFlowContainer_get_line_count
  = unsafePerformIO $
      withCString "FlowContainer" $
        \ clsNamePtr ->
          withCString "get_line_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current line count.
get_line_count ::
                 (FlowContainer :< cls, Object :< cls) => cls -> IO Int
get_line_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFlowContainer_get_line_count
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod FlowContainer "get_line_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.FlowContainer.get_line_count

{-# NOINLINE bindFlowContainer_set_alignment #-}

-- | The alignment of the container's children (must be one of @ALIGN_BEGIN@, @ALIGN_CENTER@ or @ALIGN_END@).
bindFlowContainer_set_alignment :: MethodBind
bindFlowContainer_set_alignment
  = unsafePerformIO $
      withCString "FlowContainer" $
        \ clsNamePtr ->
          withCString "set_alignment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The alignment of the container's children (must be one of @ALIGN_BEGIN@, @ALIGN_CENTER@ or @ALIGN_END@).
set_alignment ::
                (FlowContainer :< cls, Object :< cls) => cls -> Int -> IO ()
set_alignment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFlowContainer_set_alignment (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod FlowContainer "set_alignment" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.FlowContainer.set_alignment