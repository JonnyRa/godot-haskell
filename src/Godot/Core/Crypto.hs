{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Crypto
       (Godot.Core.Crypto.constant_time_compare,
        Godot.Core.Crypto.decrypt, Godot.Core.Crypto.encrypt,
        Godot.Core.Crypto.generate_random_bytes,
        Godot.Core.Crypto.generate_rsa,
        Godot.Core.Crypto.generate_self_signed_certificate,
        Godot.Core.Crypto.hmac_digest, Godot.Core.Crypto.sign,
        Godot.Core.Crypto.verify)
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

{-# NOINLINE bindCrypto_constant_time_compare #-}

-- | Compares two @PoolByteArray@s for equality without leaking timing information in order to prevent timing attacks.
--   				See @url=https://paragonie.com/blog/2015/11/preventing-timing-attacks-on-string-comparison-with-double-hmac-strategy@this blog post@/url@ for more information.
bindCrypto_constant_time_compare :: MethodBind
bindCrypto_constant_time_compare
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "constant_time_compare" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Compares two @PoolByteArray@s for equality without leaking timing information in order to prevent timing attacks.
--   				See @url=https://paragonie.com/blog/2015/11/preventing-timing-attacks-on-string-comparison-with-double-hmac-strategy@this blog post@/url@ for more information.
constant_time_compare ::
                        (Crypto :< cls, Object :< cls) =>
                        cls -> PoolByteArray -> PoolByteArray -> IO Bool
constant_time_compare cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCrypto_constant_time_compare
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Crypto "constant_time_compare"
           '[PoolByteArray, PoolByteArray]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Crypto.constant_time_compare

{-# NOINLINE bindCrypto_decrypt #-}

-- | Decrypt the given @ciphertext@ with the provided private @key@.
--   				__Note:__ The maximum size of accepted ciphertext is limited by the key size.
bindCrypto_decrypt :: MethodBind
bindCrypto_decrypt
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "decrypt" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Decrypt the given @ciphertext@ with the provided private @key@.
--   				__Note:__ The maximum size of accepted ciphertext is limited by the key size.
decrypt ::
          (Crypto :< cls, Object :< cls) =>
          cls -> CryptoKey -> PoolByteArray -> IO PoolByteArray
decrypt cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCrypto_decrypt (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Crypto "decrypt" '[CryptoKey, PoolByteArray]
           (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.Crypto.decrypt

{-# NOINLINE bindCrypto_encrypt #-}

-- | Encrypt the given @plaintext@ with the provided public @key@.
--   				__Note:__ The maximum size of accepted plaintext is limited by the key size.
bindCrypto_encrypt :: MethodBind
bindCrypto_encrypt
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "encrypt" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Encrypt the given @plaintext@ with the provided public @key@.
--   				__Note:__ The maximum size of accepted plaintext is limited by the key size.
encrypt ::
          (Crypto :< cls, Object :< cls) =>
          cls -> CryptoKey -> PoolByteArray -> IO PoolByteArray
encrypt cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCrypto_encrypt (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Crypto "encrypt" '[CryptoKey, PoolByteArray]
           (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.Crypto.encrypt

{-# NOINLINE bindCrypto_generate_random_bytes #-}

-- | Generates a @PoolByteArray@ of cryptographically secure random bytes with given @size@.
bindCrypto_generate_random_bytes :: MethodBind
bindCrypto_generate_random_bytes
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "generate_random_bytes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a @PoolByteArray@ of cryptographically secure random bytes with given @size@.
generate_random_bytes ::
                        (Crypto :< cls, Object :< cls) => cls -> Int -> IO PoolByteArray
generate_random_bytes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCrypto_generate_random_bytes
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Crypto "generate_random_bytes" '[Int]
           (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.Crypto.generate_random_bytes

{-# NOINLINE bindCrypto_generate_rsa #-}

-- | Generates an RSA @CryptoKey@ that can be used for creating self-signed certificates and passed to @method StreamPeerSSL.accept_stream@.
bindCrypto_generate_rsa :: MethodBind
bindCrypto_generate_rsa
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "generate_rsa" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates an RSA @CryptoKey@ that can be used for creating self-signed certificates and passed to @method StreamPeerSSL.accept_stream@.
generate_rsa ::
               (Crypto :< cls, Object :< cls) => cls -> Int -> IO CryptoKey
generate_rsa cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCrypto_generate_rsa (upcast cls) arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod Crypto "generate_rsa" '[Int] (IO CryptoKey)
         where
        nodeMethod = Godot.Core.Crypto.generate_rsa

{-# NOINLINE bindCrypto_generate_self_signed_certificate #-}

-- | Generates a self-signed @X509Certificate@ from the given @CryptoKey@ and @issuer_name@. The certificate validity will be defined by @not_before@ and @not_after@ (first valid date and last valid date). The @issuer_name@ must contain at least "CN=" (common name, i.e. the domain name), "O=" (organization, i.e. your company name), "C=" (country, i.e. 2 lettered ISO-3166 code of the country the organization is based in).
--   				A small example to generate an RSA key and a X509 self-signed certificate.
--   				
--   @
--   
--   				var crypto = Crypto.new()
--   				# Generate 4096 bits RSA key.
--   				var key = crypto.generate_rsa(4096)
--   				# Generate self-signed certificate using the given key.
--   				var cert = crypto.generate_self_signed_certificate(key, "CN=example.com,O=A Game Company,C=IT")
--   				
--   @
bindCrypto_generate_self_signed_certificate :: MethodBind
bindCrypto_generate_self_signed_certificate
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "generate_self_signed_certificate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a self-signed @X509Certificate@ from the given @CryptoKey@ and @issuer_name@. The certificate validity will be defined by @not_before@ and @not_after@ (first valid date and last valid date). The @issuer_name@ must contain at least "CN=" (common name, i.e. the domain name), "O=" (organization, i.e. your company name), "C=" (country, i.e. 2 lettered ISO-3166 code of the country the organization is based in).
--   				A small example to generate an RSA key and a X509 self-signed certificate.
--   				
--   @
--   
--   				var crypto = Crypto.new()
--   				# Generate 4096 bits RSA key.
--   				var key = crypto.generate_rsa(4096)
--   				# Generate self-signed certificate using the given key.
--   				var cert = crypto.generate_self_signed_certificate(key, "CN=example.com,O=A Game Company,C=IT")
--   				
--   @
generate_self_signed_certificate ::
                                   (Crypto :< cls, Object :< cls) =>
                                   cls ->
                                     CryptoKey ->
                                       Maybe GodotString ->
                                         Maybe GodotString ->
                                           Maybe GodotString -> IO X509Certificate
generate_self_signed_certificate cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1,
       defaultedVariant VariantString "CN=myserver,O=myorganisation,C=IT"
         arg2,
       defaultedVariant VariantString "20140101000000" arg3,
       defaultedVariant VariantString "20340101000000" arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCrypto_generate_self_signed_certificate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod Crypto "generate_self_signed_certificate"
           '[CryptoKey, Maybe GodotString, Maybe GodotString,
             Maybe GodotString]
           (IO X509Certificate)
         where
        nodeMethod = Godot.Core.Crypto.generate_self_signed_certificate

{-# NOINLINE bindCrypto_hmac_digest #-}

-- | Generates an @url=https://en.wikipedia.org/wiki/HMAC@HMAC@/url@ digest of @msg@ using @key@. The @hash_type@ parameter is the hashing algorithm that is used for the inner and outer hashes.
--   				Currently, only @HashingContext.HASH_SHA256@ and @HashingContext.HASH_SHA1@ are supported.
bindCrypto_hmac_digest :: MethodBind
bindCrypto_hmac_digest
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "hmac_digest" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates an @url=https://en.wikipedia.org/wiki/HMAC@HMAC@/url@ digest of @msg@ using @key@. The @hash_type@ parameter is the hashing algorithm that is used for the inner and outer hashes.
--   				Currently, only @HashingContext.HASH_SHA256@ and @HashingContext.HASH_SHA1@ are supported.
hmac_digest ::
              (Crypto :< cls, Object :< cls) =>
              cls -> Int -> PoolByteArray -> PoolByteArray -> IO PoolByteArray
hmac_digest cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCrypto_hmac_digest (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Crypto "hmac_digest"
           '[Int, PoolByteArray, PoolByteArray]
           (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.Crypto.hmac_digest

{-# NOINLINE bindCrypto_sign #-}

-- | Sign a given @hash@ of type @hash_type@ with the provided private @key@.
bindCrypto_sign :: MethodBind
bindCrypto_sign
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "sign" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sign a given @hash@ of type @hash_type@ with the provided private @key@.
sign ::
       (Crypto :< cls, Object :< cls) =>
       cls -> Int -> PoolByteArray -> CryptoKey -> IO PoolByteArray
sign cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCrypto_sign (upcast cls) arrPtr len >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Crypto "sign" '[Int, PoolByteArray, CryptoKey]
           (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.Crypto.sign

{-# NOINLINE bindCrypto_verify #-}

-- | Verify that a given @signature@ for @hash@ of type @hash_type@ against the provided public @key@.
bindCrypto_verify :: MethodBind
bindCrypto_verify
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "verify" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Verify that a given @signature@ for @hash@ of type @hash_type@ against the provided public @key@.
verify ::
         (Crypto :< cls, Object :< cls) =>
         cls ->
           Int -> PoolByteArray -> PoolByteArray -> CryptoKey -> IO Bool
verify cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCrypto_verify (upcast cls) arrPtr len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod Crypto "verify"
           '[Int, PoolByteArray, PoolByteArray, CryptoKey]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Crypto.verify