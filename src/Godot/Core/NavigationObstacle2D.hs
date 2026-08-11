{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NavigationObstacle2D
       (Godot.Core.NavigationObstacle2D.get_navigation,
        Godot.Core.NavigationObstacle2D.get_radius,
        Godot.Core.NavigationObstacle2D.get_rid,
        Godot.Core.NavigationObstacle2D.is_radius_estimated,
        Godot.Core.NavigationObstacle2D.set_estimate_radius,
        Godot.Core.NavigationObstacle2D.set_navigation,
        Godot.Core.NavigationObstacle2D.set_radius)
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
import Godot.Core.Node()

instance NodeProperty NavigationObstacle2D "estimate_radius" Bool
           'False
         where
        nodeProperty
          = (is_radius_estimated, wrapDroppingSetter set_estimate_radius,
             Nothing)

instance NodeProperty NavigationObstacle2D "radius" Float 'False
         where
        nodeProperty = (get_radius, wrapDroppingSetter set_radius, Nothing)

{-# NOINLINE bindNavigationObstacle2D_get_navigation #-}

-- | Returns the @Navigation2D@ node that the obstacle is using for its navigation system.
bindNavigationObstacle2D_get_navigation :: MethodBind
bindNavigationObstacle2D_get_navigation
  = unsafePerformIO $
      withCString "NavigationObstacle2D" $
        \ clsNamePtr ->
          withCString "get_navigation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Navigation2D@ node that the obstacle is using for its navigation system.
get_navigation ::
                 (NavigationObstacle2D :< cls, Object :< cls) => cls -> IO Node
get_navigation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationObstacle2D_get_navigation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod NavigationObstacle2D "get_navigation" '[]
           (IO Node)
         where
        nodeMethod = Godot.Core.NavigationObstacle2D.get_navigation

{-# NOINLINE bindNavigationObstacle2D_get_radius #-}

-- | The radius of the agent. Used only if @estimate_radius@ is set to @false@.
bindNavigationObstacle2D_get_radius :: MethodBind
bindNavigationObstacle2D_get_radius
  = unsafePerformIO $
      withCString "NavigationObstacle2D" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The radius of the agent. Used only if @estimate_radius@ is set to @false@.
get_radius ::
             (NavigationObstacle2D :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationObstacle2D_get_radius
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationObstacle2D "get_radius" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationObstacle2D.get_radius

{-# NOINLINE bindNavigationObstacle2D_get_rid #-}

-- | Returns the @RID@ of this obstacle on the @Navigation2DServer@.
bindNavigationObstacle2D_get_rid :: MethodBind
bindNavigationObstacle2D_get_rid
  = unsafePerformIO $
      withCString "NavigationObstacle2D" $
        \ clsNamePtr ->
          withCString "get_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of this obstacle on the @Navigation2DServer@.
get_rid ::
          (NavigationObstacle2D :< cls, Object :< cls) => cls -> IO Rid
get_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationObstacle2D_get_rid
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationObstacle2D "get_rid" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.NavigationObstacle2D.get_rid

{-# NOINLINE bindNavigationObstacle2D_is_radius_estimated #-}

-- | Enables radius estimation algorithm which uses parent's collision shapes to determine the obstacle radius.
bindNavigationObstacle2D_is_radius_estimated :: MethodBind
bindNavigationObstacle2D_is_radius_estimated
  = unsafePerformIO $
      withCString "NavigationObstacle2D" $
        \ clsNamePtr ->
          withCString "is_radius_estimated" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables radius estimation algorithm which uses parent's collision shapes to determine the obstacle radius.
is_radius_estimated ::
                      (NavigationObstacle2D :< cls, Object :< cls) => cls -> IO Bool
is_radius_estimated cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationObstacle2D_is_radius_estimated
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationObstacle2D "is_radius_estimated" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationObstacle2D.is_radius_estimated

{-# NOINLINE bindNavigationObstacle2D_set_estimate_radius #-}

-- | Enables radius estimation algorithm which uses parent's collision shapes to determine the obstacle radius.
bindNavigationObstacle2D_set_estimate_radius :: MethodBind
bindNavigationObstacle2D_set_estimate_radius
  = unsafePerformIO $
      withCString "NavigationObstacle2D" $
        \ clsNamePtr ->
          withCString "set_estimate_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables radius estimation algorithm which uses parent's collision shapes to determine the obstacle radius.
set_estimate_radius ::
                      (NavigationObstacle2D :< cls, Object :< cls) =>
                      cls -> Bool -> IO ()
set_estimate_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationObstacle2D_set_estimate_radius
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationObstacle2D "set_estimate_radius"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationObstacle2D.set_estimate_radius

{-# NOINLINE bindNavigationObstacle2D_set_navigation #-}

-- | Sets the @Navigation2D@ node used by the obstacle. Useful when you don't want to make the obstacle a child of a @Navigation2D@ node.
bindNavigationObstacle2D_set_navigation :: MethodBind
bindNavigationObstacle2D_set_navigation
  = unsafePerformIO $
      withCString "NavigationObstacle2D" $
        \ clsNamePtr ->
          withCString "set_navigation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Navigation2D@ node used by the obstacle. Useful when you don't want to make the obstacle a child of a @Navigation2D@ node.
set_navigation ::
                 (NavigationObstacle2D :< cls, Object :< cls) =>
                 cls -> Node -> IO ()
set_navigation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationObstacle2D_set_navigation
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationObstacle2D "set_navigation" '[Node]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationObstacle2D.set_navigation

{-# NOINLINE bindNavigationObstacle2D_set_radius #-}

-- | The radius of the agent. Used only if @estimate_radius@ is set to @false@.
bindNavigationObstacle2D_set_radius :: MethodBind
bindNavigationObstacle2D_set_radius
  = unsafePerformIO $
      withCString "NavigationObstacle2D" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The radius of the agent. Used only if @estimate_radius@ is set to @false@.
set_radius ::
             (NavigationObstacle2D :< cls, Object :< cls) =>
             cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationObstacle2D_set_radius
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationObstacle2D "set_radius" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationObstacle2D.set_radius