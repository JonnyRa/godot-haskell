{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.TorusMesh
       (Godot.Core.TorusMesh.get_inner_radius,
        Godot.Core.TorusMesh.get_outer_radius,
        Godot.Core.TorusMesh.get_ring_segments,
        Godot.Core.TorusMesh.get_rings,
        Godot.Core.TorusMesh.set_inner_radius,
        Godot.Core.TorusMesh.set_outer_radius,
        Godot.Core.TorusMesh.set_ring_segments,
        Godot.Core.TorusMesh.set_rings)
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
import Godot.Core.PrimitiveMesh()

instance NodeProperty TorusMesh "inner_radius" Float 'False where
        nodeProperty
          = (get_inner_radius, wrapDroppingSetter set_inner_radius, Nothing)

instance NodeProperty TorusMesh "outer_radius" Float 'False where
        nodeProperty
          = (get_outer_radius, wrapDroppingSetter set_outer_radius, Nothing)

instance NodeProperty TorusMesh "ring_segments" Int 'False where
        nodeProperty
          = (get_ring_segments, wrapDroppingSetter set_ring_segments,
             Nothing)

instance NodeProperty TorusMesh "rings" Int 'False where
        nodeProperty = (get_rings, wrapDroppingSetter set_rings, Nothing)

{-# NOINLINE bindTorusMesh_get_inner_radius #-}

-- | The inner radius of the torus.
bindTorusMesh_get_inner_radius :: MethodBind
bindTorusMesh_get_inner_radius
  = unsafePerformIO $
      withCString "TorusMesh" $
        \ clsNamePtr ->
          withCString "get_inner_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The inner radius of the torus.
get_inner_radius ::
                   (TorusMesh :< cls, Object :< cls) => cls -> IO Float
get_inner_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTorusMesh_get_inner_radius (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TorusMesh "get_inner_radius" '[] (IO Float)
         where
        nodeMethod = Godot.Core.TorusMesh.get_inner_radius

{-# NOINLINE bindTorusMesh_get_outer_radius #-}

-- | The outer radius of the torus.
bindTorusMesh_get_outer_radius :: MethodBind
bindTorusMesh_get_outer_radius
  = unsafePerformIO $
      withCString "TorusMesh" $
        \ clsNamePtr ->
          withCString "get_outer_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The outer radius of the torus.
get_outer_radius ::
                   (TorusMesh :< cls, Object :< cls) => cls -> IO Float
get_outer_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTorusMesh_get_outer_radius (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TorusMesh "get_outer_radius" '[] (IO Float)
         where
        nodeMethod = Godot.Core.TorusMesh.get_outer_radius

{-# NOINLINE bindTorusMesh_get_ring_segments #-}

-- | The number of edges each ring of the torus is constructed of.
bindTorusMesh_get_ring_segments :: MethodBind
bindTorusMesh_get_ring_segments
  = unsafePerformIO $
      withCString "TorusMesh" $
        \ clsNamePtr ->
          withCString "get_ring_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of edges each ring of the torus is constructed of.
get_ring_segments ::
                    (TorusMesh :< cls, Object :< cls) => cls -> IO Int
get_ring_segments cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTorusMesh_get_ring_segments (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TorusMesh "get_ring_segments" '[] (IO Int)
         where
        nodeMethod = Godot.Core.TorusMesh.get_ring_segments

{-# NOINLINE bindTorusMesh_get_rings #-}

-- | The number of slices the torus is constructed of.
bindTorusMesh_get_rings :: MethodBind
bindTorusMesh_get_rings
  = unsafePerformIO $
      withCString "TorusMesh" $
        \ clsNamePtr ->
          withCString "get_rings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of slices the torus is constructed of.
get_rings :: (TorusMesh :< cls, Object :< cls) => cls -> IO Int
get_rings cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTorusMesh_get_rings (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TorusMesh "get_rings" '[] (IO Int) where
        nodeMethod = Godot.Core.TorusMesh.get_rings

{-# NOINLINE bindTorusMesh_set_inner_radius #-}

-- | The inner radius of the torus.
bindTorusMesh_set_inner_radius :: MethodBind
bindTorusMesh_set_inner_radius
  = unsafePerformIO $
      withCString "TorusMesh" $
        \ clsNamePtr ->
          withCString "set_inner_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The inner radius of the torus.
set_inner_radius ::
                   (TorusMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_inner_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTorusMesh_set_inner_radius (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TorusMesh "set_inner_radius" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.TorusMesh.set_inner_radius

{-# NOINLINE bindTorusMesh_set_outer_radius #-}

-- | The outer radius of the torus.
bindTorusMesh_set_outer_radius :: MethodBind
bindTorusMesh_set_outer_radius
  = unsafePerformIO $
      withCString "TorusMesh" $
        \ clsNamePtr ->
          withCString "set_outer_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The outer radius of the torus.
set_outer_radius ::
                   (TorusMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_outer_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTorusMesh_set_outer_radius (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TorusMesh "set_outer_radius" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.TorusMesh.set_outer_radius

{-# NOINLINE bindTorusMesh_set_ring_segments #-}

-- | The number of edges each ring of the torus is constructed of.
bindTorusMesh_set_ring_segments :: MethodBind
bindTorusMesh_set_ring_segments
  = unsafePerformIO $
      withCString "TorusMesh" $
        \ clsNamePtr ->
          withCString "set_ring_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of edges each ring of the torus is constructed of.
set_ring_segments ::
                    (TorusMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_ring_segments cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTorusMesh_set_ring_segments (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TorusMesh "set_ring_segments" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.TorusMesh.set_ring_segments

{-# NOINLINE bindTorusMesh_set_rings #-}

-- | The number of slices the torus is constructed of.
bindTorusMesh_set_rings :: MethodBind
bindTorusMesh_set_rings
  = unsafePerformIO $
      withCString "TorusMesh" $
        \ clsNamePtr ->
          withCString "set_rings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of slices the torus is constructed of.
set_rings ::
            (TorusMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_rings cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTorusMesh_set_rings (upcast cls) arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod TorusMesh "set_rings" '[Int] (IO ()) where
        nodeMethod = Godot.Core.TorusMesh.set_rings