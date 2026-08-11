{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NavigationObstacle
       (Godot.Core.NavigationObstacle.get_navigation,
        Godot.Core.NavigationObstacle.get_radius,
        Godot.Core.NavigationObstacle.get_rid,
        Godot.Core.NavigationObstacle.is_radius_estimated,
        Godot.Core.NavigationObstacle.set_estimate_radius,
        Godot.Core.NavigationObstacle.set_navigation,
        Godot.Core.NavigationObstacle.set_radius)
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

instance NodeProperty NavigationObstacle "estimate_radius" Bool
           'False
         where
        nodeProperty
          = (is_radius_estimated, wrapDroppingSetter set_estimate_radius,
             Nothing)

instance NodeProperty NavigationObstacle "radius" Float 'False
         where
        nodeProperty = (get_radius, wrapDroppingSetter set_radius, Nothing)

{-# NOINLINE bindNavigationObstacle_get_navigation #-}

-- | Returns the @Navigation@ node that the obstacle is using for its navigation system.
bindNavigationObstacle_get_navigation :: MethodBind
bindNavigationObstacle_get_navigation
  = unsafePerformIO $
      withCString "NavigationObstacle" $
        \ clsNamePtr ->
          withCString "get_navigation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Navigation@ node that the obstacle is using for its navigation system.
get_navigation ::
                 (NavigationObstacle :< cls, Object :< cls) => cls -> IO Node
get_navigation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationObstacle_get_navigation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, var) -> throwIfErr err >> fromGodotVariant var)

instance NodeMethod NavigationObstacle "get_navigation" '[]
           (IO Node)
         where
        nodeMethod = Godot.Core.NavigationObstacle.get_navigation

{-# NOINLINE bindNavigationObstacle_get_radius #-}

-- | The radius of the agent. Used only if @estimate_radius@ is set to @false@.
bindNavigationObstacle_get_radius :: MethodBind
bindNavigationObstacle_get_radius
  = unsafePerformIO $
      withCString "NavigationObstacle" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The radius of the agent. Used only if @estimate_radius@ is set to @false@.
get_radius ::
             (NavigationObstacle :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationObstacle_get_radius
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationObstacle "get_radius" '[] (IO Float)
         where
        nodeMethod = Godot.Core.NavigationObstacle.get_radius

{-# NOINLINE bindNavigationObstacle_get_rid #-}

-- | Returns the @RID@ of this obstacle on the @NavigationServer@.
bindNavigationObstacle_get_rid :: MethodBind
bindNavigationObstacle_get_rid
  = unsafePerformIO $
      withCString "NavigationObstacle" $
        \ clsNamePtr ->
          withCString "get_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of this obstacle on the @NavigationServer@.
get_rid ::
          (NavigationObstacle :< cls, Object :< cls) => cls -> IO Rid
get_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationObstacle_get_rid (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationObstacle "get_rid" '[] (IO Rid) where
        nodeMethod = Godot.Core.NavigationObstacle.get_rid

{-# NOINLINE bindNavigationObstacle_is_radius_estimated #-}

-- | Enables radius estimation algorithm which uses parent's collision shapes to determine the obstacle radius.
bindNavigationObstacle_is_radius_estimated :: MethodBind
bindNavigationObstacle_is_radius_estimated
  = unsafePerformIO $
      withCString "NavigationObstacle" $
        \ clsNamePtr ->
          withCString "is_radius_estimated" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables radius estimation algorithm which uses parent's collision shapes to determine the obstacle radius.
is_radius_estimated ::
                      (NavigationObstacle :< cls, Object :< cls) => cls -> IO Bool
is_radius_estimated cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationObstacle_is_radius_estimated
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationObstacle "is_radius_estimated" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationObstacle.is_radius_estimated

{-# NOINLINE bindNavigationObstacle_set_estimate_radius #-}

-- | Enables radius estimation algorithm which uses parent's collision shapes to determine the obstacle radius.
bindNavigationObstacle_set_estimate_radius :: MethodBind
bindNavigationObstacle_set_estimate_radius
  = unsafePerformIO $
      withCString "NavigationObstacle" $
        \ clsNamePtr ->
          withCString "set_estimate_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables radius estimation algorithm which uses parent's collision shapes to determine the obstacle radius.
set_estimate_radius ::
                      (NavigationObstacle :< cls, Object :< cls) => cls -> Bool -> IO ()
set_estimate_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationObstacle_set_estimate_radius
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationObstacle "set_estimate_radius"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationObstacle.set_estimate_radius

{-# NOINLINE bindNavigationObstacle_set_navigation #-}

-- | Sets the @Navigation@ node used by the obstacle. Useful when you don't want to make the obstacle a child of a @Navigation@ node.
bindNavigationObstacle_set_navigation :: MethodBind
bindNavigationObstacle_set_navigation
  = unsafePerformIO $
      withCString "NavigationObstacle" $
        \ clsNamePtr ->
          withCString "set_navigation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Navigation@ node used by the obstacle. Useful when you don't want to make the obstacle a child of a @Navigation@ node.
set_navigation ::
                 (NavigationObstacle :< cls, Object :< cls) => cls -> Node -> IO ()
set_navigation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationObstacle_set_navigation
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationObstacle "set_navigation" '[Node]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationObstacle.set_navigation

{-# NOINLINE bindNavigationObstacle_set_radius #-}

-- | The radius of the agent. Used only if @estimate_radius@ is set to @false@.
bindNavigationObstacle_set_radius :: MethodBind
bindNavigationObstacle_set_radius
  = unsafePerformIO $
      withCString "NavigationObstacle" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The radius of the agent. Used only if @estimate_radius@ is set to @false@.
set_radius ::
             (NavigationObstacle :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationObstacle_set_radius
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod NavigationObstacle "set_radius" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationObstacle.set_radius