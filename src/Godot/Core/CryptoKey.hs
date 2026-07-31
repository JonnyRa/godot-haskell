{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CryptoKey
       (Godot.Core.CryptoKey.is_public_only, Godot.Core.CryptoKey.load,
        Godot.Core.CryptoKey.load_from_string, Godot.Core.CryptoKey.save,
        Godot.Core.CryptoKey.save_to_string)
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
import Godot.Core.Resource()

{-# NOINLINE bindCryptoKey_is_public_only #-}

-- | Return @true@ if this CryptoKey only has the public part, and not the private one.
bindCryptoKey_is_public_only :: MethodBind
bindCryptoKey_is_public_only
  = unsafePerformIO $
      withCString "CryptoKey" $
        \ clsNamePtr ->
          withCString "is_public_only" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return @true@ if this CryptoKey only has the public part, and not the private one.
is_public_only ::
                 (CryptoKey :< cls, Object :< cls) => cls -> IO Bool
is_public_only cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCryptoKey_is_public_only (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CryptoKey "is_public_only" '[] (IO Bool) where
        nodeMethod = Godot.Core.CryptoKey.is_public_only

{-# NOINLINE bindCryptoKey_load #-}

-- | Loads a key from @path@. If @public_only@ is @true@, only the public key will be loaded.
--   				__Note:__ @path@ should be a "*.pub" file if @public_only@ is @true@, a "*.key" file otherwise.
bindCryptoKey_load :: MethodBind
bindCryptoKey_load
  = unsafePerformIO $
      withCString "CryptoKey" $
        \ clsNamePtr ->
          withCString "load" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Loads a key from @path@. If @public_only@ is @true@, only the public key will be loaded.
--   				__Note:__ @path@ should be a "*.pub" file if @public_only@ is @true@, a "*.key" file otherwise.
load ::
       (CryptoKey :< cls, Object :< cls) =>
       cls -> GodotString -> Maybe Bool -> IO Int
load cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCryptoKey_load (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CryptoKey "load" '[GodotString, Maybe Bool]
           (IO Int)
         where
        nodeMethod = Godot.Core.CryptoKey.load

{-# NOINLINE bindCryptoKey_load_from_string #-}

-- | Loads a key from the given @string@. If @public_only@ is @true@, only the public key will be loaded.
bindCryptoKey_load_from_string :: MethodBind
bindCryptoKey_load_from_string
  = unsafePerformIO $
      withCString "CryptoKey" $
        \ clsNamePtr ->
          withCString "load_from_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Loads a key from the given @string@. If @public_only@ is @true@, only the public key will be loaded.
load_from_string ::
                   (CryptoKey :< cls, Object :< cls) =>
                   cls -> GodotString -> Maybe Bool -> IO Int
load_from_string cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCryptoKey_load_from_string (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CryptoKey "load_from_string"
           '[GodotString, Maybe Bool]
           (IO Int)
         where
        nodeMethod = Godot.Core.CryptoKey.load_from_string

{-# NOINLINE bindCryptoKey_save #-}

-- | Saves a key to the given @path@. If @public_only@ is @true@, only the public key will be saved.
--   				__Note:__ @path@ should be a "*.pub" file if @public_only@ is @true@, a "*.key" file otherwise.
bindCryptoKey_save :: MethodBind
bindCryptoKey_save
  = unsafePerformIO $
      withCString "CryptoKey" $
        \ clsNamePtr ->
          withCString "save" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves a key to the given @path@. If @public_only@ is @true@, only the public key will be saved.
--   				__Note:__ @path@ should be a "*.pub" file if @public_only@ is @true@, a "*.key" file otherwise.
save ::
       (CryptoKey :< cls, Object :< cls) =>
       cls -> GodotString -> Maybe Bool -> IO Int
save cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCryptoKey_save (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CryptoKey "save" '[GodotString, Maybe Bool]
           (IO Int)
         where
        nodeMethod = Godot.Core.CryptoKey.save

{-# NOINLINE bindCryptoKey_save_to_string #-}

-- | Returns a string containing the key in PEM format. If @public_only@ is @true@, only the public key will be included.
bindCryptoKey_save_to_string :: MethodBind
bindCryptoKey_save_to_string
  = unsafePerformIO $
      withCString "CryptoKey" $
        \ clsNamePtr ->
          withCString "save_to_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a string containing the key in PEM format. If @public_only@ is @true@, only the public key will be included.
save_to_string ::
                 (CryptoKey :< cls, Object :< cls) =>
                 cls -> Maybe Bool -> IO GodotString
save_to_string cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCryptoKey_save_to_string (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod CryptoKey "save_to_string" '[Maybe Bool]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.CryptoKey.save_to_string