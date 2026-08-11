{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Tweener (Godot.Core.Tweener.sig_finished) where
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

-- | Emitted when the @Tweener@ has just finished its job.
sig_finished :: Godot.Internal.Dispatch.Signal Tweener
sig_finished = Godot.Internal.Dispatch.Signal "finished"

instance NodeSignal Tweener "finished" '[]