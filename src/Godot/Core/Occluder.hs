{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Occluder
       (Godot.Core.Occluder.get_shape,
        Godot.Core.Occluder.resource_changed,
        Godot.Core.Occluder.set_shape)
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

instance NodeProperty Occluder "shape" OccluderShape 'False where
        nodeProperty = (get_shape, wrapDroppingSetter set_shape, Nothing)

{-# NOINLINE bindOccluder_get_shape #-}

bindOccluder_get_shape :: MethodBind
bindOccluder_get_shape
  = unsafePerformIO $
      withCString "Occluder" $
        \ clsNamePtr ->
          withCString "get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_shape ::
            (Occluder :< cls, Object :< cls) => cls -> IO OccluderShape
get_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluder_get_shape (upcast cls) arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod Occluder "get_shape" '[] (IO OccluderShape)
         where
        nodeMethod = Godot.Core.Occluder.get_shape

{-# NOINLINE bindOccluder_resource_changed #-}

bindOccluder_resource_changed :: MethodBind
bindOccluder_resource_changed
  = unsafePerformIO $
      withCString "Occluder" $
        \ clsNamePtr ->
          withCString "resource_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

resource_changed ::
                   (Occluder :< cls, Object :< cls) => cls -> Resource -> IO ()
resource_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluder_resource_changed (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Occluder "resource_changed" '[Resource] (IO ())
         where
        nodeMethod = Godot.Core.Occluder.resource_changed

{-# NOINLINE bindOccluder_set_shape #-}

bindOccluder_set_shape :: MethodBind
bindOccluder_set_shape
  = unsafePerformIO $
      withCString "Occluder" $
        \ clsNamePtr ->
          withCString "set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_shape ::
            (Occluder :< cls, Object :< cls) => cls -> OccluderShape -> IO ()
set_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluder_set_shape (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Occluder "set_shape" '[OccluderShape] (IO ())
         where
        nodeMethod = Godot.Core.Occluder.set_shape