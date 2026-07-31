{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Texture3D (Godot.Core.Texture3D.create) where
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
import Godot.Core.TextureLayered()

{-# NOINLINE bindTexture3D_create #-}

-- | Creates the Texture3D with specified @width@, @height@, and @depth@. See @enum Image.Format@ for @format@ options. See @enum TextureLayered.Flags@ enumerator for @flags@ options.
bindTexture3D_create :: MethodBind
bindTexture3D_create
  = unsafePerformIO $
      withCString "Texture3D" $
        \ clsNamePtr ->
          withCString "create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates the Texture3D with specified @width@, @height@, and @depth@. See @enum Image.Format@ for @format@ options. See @enum TextureLayered.Flags@ enumerator for @flags@ options.
create ::
         (Texture3D :< cls, Object :< cls) =>
         cls -> Int -> Int -> Int -> Int -> Maybe Int -> IO ()
create cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       maybe (VariantInt (4)) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTexture3D_create (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Texture3D "create"
           '[Int, Int, Int, Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Texture3D.create