{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Listener2D
       (Godot.Core.Listener2D.clear_current,
        Godot.Core.Listener2D.is_current,
        Godot.Core.Listener2D.make_current)
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
import Godot.Core.Node2D()

{-# NOINLINE bindListener2D_clear_current #-}

-- | Disables the @Listener2D@. If it's not set as current, this method will have no effect.
bindListener2D_clear_current :: MethodBind
bindListener2D_clear_current
  = unsafePerformIO $
      withCString "Listener2D" $
        \ clsNamePtr ->
          withCString "clear_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disables the @Listener2D@. If it's not set as current, this method will have no effect.
clear_current :: (Listener2D :< cls, Object :< cls) => cls -> IO ()
clear_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindListener2D_clear_current (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Listener2D "clear_current" '[] (IO ()) where
        nodeMethod = Godot.Core.Listener2D.clear_current

{-# NOINLINE bindListener2D_is_current #-}

-- | Returns @true@ if this @Listener2D@ is currently active.
bindListener2D_is_current :: MethodBind
bindListener2D_is_current
  = unsafePerformIO $
      withCString "Listener2D" $
        \ clsNamePtr ->
          withCString "is_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if this @Listener2D@ is currently active.
is_current :: (Listener2D :< cls, Object :< cls) => cls -> IO Bool
is_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindListener2D_is_current (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Listener2D "is_current" '[] (IO Bool) where
        nodeMethod = Godot.Core.Listener2D.is_current

{-# NOINLINE bindListener2D_make_current #-}

-- | Makes the @Listener2D@ active, setting it as the hearing point for the sounds. If there is already another active @Listener2D@, it will be disabled.
--   				This method will have no effect if the @Listener2D@ is not added to @SceneTree@.
bindListener2D_make_current :: MethodBind
bindListener2D_make_current
  = unsafePerformIO $
      withCString "Listener2D" $
        \ clsNamePtr ->
          withCString "make_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Makes the @Listener2D@ active, setting it as the hearing point for the sounds. If there is already another active @Listener2D@, it will be disabled.
--   				This method will have no effect if the @Listener2D@ is not added to @SceneTree@.
make_current :: (Listener2D :< cls, Object :< cls) => cls -> IO ()
make_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindListener2D_make_current (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Listener2D "make_current" '[] (IO ()) where
        nodeMethod = Godot.Core.Listener2D.make_current