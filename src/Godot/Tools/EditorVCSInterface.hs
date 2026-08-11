{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorVCSInterface
       (Godot.Tools.EditorVCSInterface._CHANGE_TYPE_NEW,
        Godot.Tools.EditorVCSInterface._TREE_AREA_COMMIT,
        Godot.Tools.EditorVCSInterface._CHANGE_TYPE_DELETED,
        Godot.Tools.EditorVCSInterface._CHANGE_TYPE_UNMERGED,
        Godot.Tools.EditorVCSInterface._TREE_AREA_STAGED,
        Godot.Tools.EditorVCSInterface._CHANGE_TYPE_MODIFIED,
        Godot.Tools.EditorVCSInterface._TREE_AREA_UNSTAGED,
        Godot.Tools.EditorVCSInterface._CHANGE_TYPE_RENAMED,
        Godot.Tools.EditorVCSInterface._CHANGE_TYPE_TYPECHANGE,
        Godot.Tools.EditorVCSInterface._checkout_branch,
        Godot.Tools.EditorVCSInterface._commit,
        Godot.Tools.EditorVCSInterface._create_branch,
        Godot.Tools.EditorVCSInterface._create_remote,
        Godot.Tools.EditorVCSInterface._discard_file,
        Godot.Tools.EditorVCSInterface._fetch,
        Godot.Tools.EditorVCSInterface._get_branch_list,
        Godot.Tools.EditorVCSInterface._get_current_branch_name,
        Godot.Tools.EditorVCSInterface._get_diff,
        Godot.Tools.EditorVCSInterface._get_line_diff,
        Godot.Tools.EditorVCSInterface._get_modified_files_data,
        Godot.Tools.EditorVCSInterface._get_previous_commits,
        Godot.Tools.EditorVCSInterface._get_remotes,
        Godot.Tools.EditorVCSInterface._get_vcs_name,
        Godot.Tools.EditorVCSInterface._initialize,
        Godot.Tools.EditorVCSInterface._pull,
        Godot.Tools.EditorVCSInterface._push,
        Godot.Tools.EditorVCSInterface._remove_branch,
        Godot.Tools.EditorVCSInterface._remove_remote,
        Godot.Tools.EditorVCSInterface._set_credentials,
        Godot.Tools.EditorVCSInterface._shut_down,
        Godot.Tools.EditorVCSInterface._stage_file,
        Godot.Tools.EditorVCSInterface._unstage_file,
        Godot.Tools.EditorVCSInterface.add_diff_hunks_into_diff_file,
        Godot.Tools.EditorVCSInterface.add_line_diffs_into_diff_hunk,
        Godot.Tools.EditorVCSInterface.create_commit,
        Godot.Tools.EditorVCSInterface.create_diff_file,
        Godot.Tools.EditorVCSInterface.create_diff_hunk,
        Godot.Tools.EditorVCSInterface.create_diff_line,
        Godot.Tools.EditorVCSInterface.create_status_file,
        Godot.Tools.EditorVCSInterface.popup_error)
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
import Godot.Core.Object()

_CHANGE_TYPE_NEW :: Int
_CHANGE_TYPE_NEW = 0

_TREE_AREA_COMMIT :: Int
_TREE_AREA_COMMIT = 0

_CHANGE_TYPE_DELETED :: Int
_CHANGE_TYPE_DELETED = 3

_CHANGE_TYPE_UNMERGED :: Int
_CHANGE_TYPE_UNMERGED = 5

_TREE_AREA_STAGED :: Int
_TREE_AREA_STAGED = 1

_CHANGE_TYPE_MODIFIED :: Int
_CHANGE_TYPE_MODIFIED = 1

_TREE_AREA_UNSTAGED :: Int
_TREE_AREA_UNSTAGED = 2

_CHANGE_TYPE_RENAMED :: Int
_CHANGE_TYPE_RENAMED = 2

_CHANGE_TYPE_TYPECHANGE :: Int
_CHANGE_TYPE_TYPECHANGE = 4

{-# NOINLINE bindEditorVCSInterface__checkout_branch #-}

-- | Checks out a @branch_name@ in the VCS.
bindEditorVCSInterface__checkout_branch :: MethodBind
bindEditorVCSInterface__checkout_branch
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_checkout_branch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks out a @branch_name@ in the VCS.
_checkout_branch ::
                   (EditorVCSInterface :< cls, Object :< cls) =>
                   cls -> GodotString -> IO Bool
_checkout_branch cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__checkout_branch
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_checkout_branch"
           '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._checkout_branch

{-# NOINLINE bindEditorVCSInterface__commit #-}

-- | Commits the currently staged changes and applies the commit @msg@ to the resulting commit.
bindEditorVCSInterface__commit :: MethodBind
bindEditorVCSInterface__commit
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_commit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Commits the currently staged changes and applies the commit @msg@ to the resulting commit.
_commit ::
          (EditorVCSInterface :< cls, Object :< cls) =>
          cls -> GodotString -> IO ()
_commit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__commit (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_commit" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._commit

{-# NOINLINE bindEditorVCSInterface__create_branch #-}

-- | Creates a new branch named @branch_name@ in the VCS.
bindEditorVCSInterface__create_branch :: MethodBind
bindEditorVCSInterface__create_branch
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_create_branch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new branch named @branch_name@ in the VCS.
_create_branch ::
                 (EditorVCSInterface :< cls, Object :< cls) =>
                 cls -> GodotString -> IO ()
_create_branch cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__create_branch
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_create_branch"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._create_branch

{-# NOINLINE bindEditorVCSInterface__create_remote #-}

-- | Creates a new remote destination with name @remote_name@ and points it to @remote_url@. This can be both an HTTPS remote or an SSH remote.
bindEditorVCSInterface__create_remote :: MethodBind
bindEditorVCSInterface__create_remote
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_create_remote" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new remote destination with name @remote_name@ and points it to @remote_url@. This can be both an HTTPS remote or an SSH remote.
_create_remote ::
                 (EditorVCSInterface :< cls, Object :< cls) =>
                 cls -> GodotString -> GodotString -> IO ()
_create_remote cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__create_remote
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_create_remote"
           '[GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._create_remote

{-# NOINLINE bindEditorVCSInterface__discard_file #-}

-- | Discards the changes made in file present at @file_path@.
bindEditorVCSInterface__discard_file :: MethodBind
bindEditorVCSInterface__discard_file
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_discard_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Discards the changes made in file present at @file_path@.
_discard_file ::
                (EditorVCSInterface :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
_discard_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__discard_file
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_discard_file"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._discard_file

{-# NOINLINE bindEditorVCSInterface__fetch #-}

-- | Fetches new changes from the remote, but doesn't write changes to the current working directory. Equivalent to @git fetch@.
bindEditorVCSInterface__fetch :: MethodBind
bindEditorVCSInterface__fetch
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_fetch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Fetches new changes from the remote, but doesn't write changes to the current working directory. Equivalent to @git fetch@.
_fetch ::
         (EditorVCSInterface :< cls, Object :< cls) =>
         cls -> GodotString -> IO ()
_fetch cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__fetch (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_fetch" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._fetch

{-# NOINLINE bindEditorVCSInterface__get_branch_list #-}

-- | Gets an instance of an @Array@ of @String@s containing available branch names in the VCS.
bindEditorVCSInterface__get_branch_list :: MethodBind
bindEditorVCSInterface__get_branch_list
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_get_branch_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets an instance of an @Array@ of @String@s containing available branch names in the VCS.
_get_branch_list ::
                   (EditorVCSInterface :< cls, Object :< cls) => cls -> IO Array
_get_branch_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__get_branch_list
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_get_branch_list" '[]
           (IO Array)
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._get_branch_list

{-# NOINLINE bindEditorVCSInterface__get_current_branch_name #-}

-- | Gets the current branch name defined in the VCS.
bindEditorVCSInterface__get_current_branch_name :: MethodBind
bindEditorVCSInterface__get_current_branch_name
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_get_current_branch_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the current branch name defined in the VCS.
_get_current_branch_name ::
                           (EditorVCSInterface :< cls, Object :< cls) => cls -> IO GodotString
_get_current_branch_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorVCSInterface__get_current_branch_name
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_get_current_branch_name"
           '[]
           (IO GodotString)
         where
        nodeMethod
          = Godot.Tools.EditorVCSInterface._get_current_branch_name

{-# NOINLINE bindEditorVCSInterface__get_diff #-}

-- | Returns an @Array@ of @Dictionary@ items (see @method create_diff_file@, @method create_diff_hunk@, @method create_diff_line@, @method add_line_diffs_into_diff_hunk@ and @method add_diff_hunks_into_diff_file@), each containing information about a diff. If @identifier@ is a file path, returns a file diff, and if it is a commit identifier, then returns a commit diff.
bindEditorVCSInterface__get_diff :: MethodBind
bindEditorVCSInterface__get_diff
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_get_diff" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an @Array@ of @Dictionary@ items (see @method create_diff_file@, @method create_diff_hunk@, @method create_diff_line@, @method add_line_diffs_into_diff_hunk@ and @method add_diff_hunks_into_diff_file@), each containing information about a diff. If @identifier@ is a file path, returns a file diff, and if it is a commit identifier, then returns a commit diff.
_get_diff ::
            (EditorVCSInterface :< cls, Object :< cls) =>
            cls -> GodotString -> Int -> IO Array
_get_diff cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__get_diff
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_get_diff"
           '[GodotString, Int]
           (IO Array)
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._get_diff

{-# NOINLINE bindEditorVCSInterface__get_line_diff #-}

-- | Returns an @Array@ of @Dictionary@ items (see @method create_diff_hunk@), each containing a line diff between a file at @file_path@ and the @text@ which is passed in.
bindEditorVCSInterface__get_line_diff :: MethodBind
bindEditorVCSInterface__get_line_diff
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_get_line_diff" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an @Array@ of @Dictionary@ items (see @method create_diff_hunk@), each containing a line diff between a file at @file_path@ and the @text@ which is passed in.
_get_line_diff ::
                 (EditorVCSInterface :< cls, Object :< cls) =>
                 cls -> GodotString -> GodotString -> IO Array
_get_line_diff cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__get_line_diff
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_get_line_diff"
           '[GodotString, GodotString]
           (IO Array)
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._get_line_diff

{-# NOINLINE bindEditorVCSInterface__get_modified_files_data #-}

-- | Returns an @Array@ of @Dictionary@ items (see @method create_status_file@), each containing the status data of every modified file in the project folder.
bindEditorVCSInterface__get_modified_files_data :: MethodBind
bindEditorVCSInterface__get_modified_files_data
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_get_modified_files_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an @Array@ of @Dictionary@ items (see @method create_status_file@), each containing the status data of every modified file in the project folder.
_get_modified_files_data ::
                           (EditorVCSInterface :< cls, Object :< cls) => cls -> IO Array
_get_modified_files_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorVCSInterface__get_modified_files_data
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_get_modified_files_data"
           '[]
           (IO Array)
         where
        nodeMethod
          = Godot.Tools.EditorVCSInterface._get_modified_files_data

{-# NOINLINE bindEditorVCSInterface__get_previous_commits #-}

-- | Returns an @Array@ of @Dictionary@ items (see @method create_commit@), each containing the data for a past commit.
bindEditorVCSInterface__get_previous_commits :: MethodBind
bindEditorVCSInterface__get_previous_commits
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_get_previous_commits" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an @Array@ of @Dictionary@ items (see @method create_commit@), each containing the data for a past commit.
_get_previous_commits ::
                        (EditorVCSInterface :< cls, Object :< cls) =>
                        cls -> Int -> IO Array
_get_previous_commits cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__get_previous_commits
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_get_previous_commits"
           '[Int]
           (IO Array)
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._get_previous_commits

{-# NOINLINE bindEditorVCSInterface__get_remotes #-}

-- | Returns an @Array@ of @String@s, each containing the name of a remote configured in the VCS.
bindEditorVCSInterface__get_remotes :: MethodBind
bindEditorVCSInterface__get_remotes
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_get_remotes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an @Array@ of @String@s, each containing the name of a remote configured in the VCS.
_get_remotes ::
               (EditorVCSInterface :< cls, Object :< cls) => cls -> IO Array
_get_remotes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__get_remotes
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_get_remotes" '[]
           (IO Array)
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._get_remotes

{-# NOINLINE bindEditorVCSInterface__get_vcs_name #-}

-- | Returns the name of the underlying VCS provider.
bindEditorVCSInterface__get_vcs_name :: MethodBind
bindEditorVCSInterface__get_vcs_name
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_get_vcs_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the underlying VCS provider.
_get_vcs_name ::
                (EditorVCSInterface :< cls, Object :< cls) => cls -> IO GodotString
_get_vcs_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__get_vcs_name
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_get_vcs_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._get_vcs_name

{-# NOINLINE bindEditorVCSInterface__initialize #-}

-- | Initializes the VCS plugin when called from the editor. Returns whether or not the plugin was successfully initialized. A VCS project is initialized at @project_path@.
bindEditorVCSInterface__initialize :: MethodBind
bindEditorVCSInterface__initialize
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_initialize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initializes the VCS plugin when called from the editor. Returns whether or not the plugin was successfully initialized. A VCS project is initialized at @project_path@.
_initialize ::
              (EditorVCSInterface :< cls, Object :< cls) =>
              cls -> GodotString -> IO Bool
_initialize cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__initialize
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_initialize" '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._initialize

{-# NOINLINE bindEditorVCSInterface__pull #-}

-- | Pulls changes from the remote. This can give rise to merge conflicts.
bindEditorVCSInterface__pull :: MethodBind
bindEditorVCSInterface__pull
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_pull" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pulls changes from the remote. This can give rise to merge conflicts.
_pull ::
        (EditorVCSInterface :< cls, Object :< cls) =>
        cls -> GodotString -> IO ()
_pull cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__pull (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_pull" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._pull

{-# NOINLINE bindEditorVCSInterface__push #-}

-- | Pushes changes to the @remote@. Optionally, if @force@ is set to true, a force push will override the change history already present on the remote.
bindEditorVCSInterface__push :: MethodBind
bindEditorVCSInterface__push
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_push" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pushes changes to the @remote@. Optionally, if @force@ is set to true, a force push will override the change history already present on the remote.
_push ::
        (EditorVCSInterface :< cls, Object :< cls) =>
        cls -> GodotString -> Bool -> IO ()
_push cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__push (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_push" '[GodotString, Bool]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._push

{-# NOINLINE bindEditorVCSInterface__remove_branch #-}

-- | Remove a branch from the local VCS.
bindEditorVCSInterface__remove_branch :: MethodBind
bindEditorVCSInterface__remove_branch
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_remove_branch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remove a branch from the local VCS.
_remove_branch ::
                 (EditorVCSInterface :< cls, Object :< cls) =>
                 cls -> GodotString -> IO ()
_remove_branch cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__remove_branch
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_remove_branch"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._remove_branch

{-# NOINLINE bindEditorVCSInterface__remove_remote #-}

-- | Remove a remote from the local VCS.
bindEditorVCSInterface__remove_remote :: MethodBind
bindEditorVCSInterface__remove_remote
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_remove_remote" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remove a remote from the local VCS.
_remove_remote ::
                 (EditorVCSInterface :< cls, Object :< cls) =>
                 cls -> GodotString -> IO ()
_remove_remote cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__remove_remote
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_remove_remote"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._remove_remote

{-# NOINLINE bindEditorVCSInterface__set_credentials #-}

-- | Set user credentials in the underlying VCS. @username@ and @password@ are used only during HTTPS authentication unless not already mentioned in the remote URL. @ssh_public_key_path@, @ssh_private_key_path@, and @ssh_passphrase@ are only used during SSH authentication.
bindEditorVCSInterface__set_credentials :: MethodBind
bindEditorVCSInterface__set_credentials
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_set_credentials" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set user credentials in the underlying VCS. @username@ and @password@ are used only during HTTPS authentication unless not already mentioned in the remote URL. @ssh_public_key_path@, @ssh_private_key_path@, and @ssh_passphrase@ are only used during SSH authentication.
_set_credentials ::
                   (EditorVCSInterface :< cls, Object :< cls) =>
                   cls ->
                     GodotString ->
                       GodotString -> GodotString -> GodotString -> GodotString -> IO ()
_set_credentials cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__set_credentials
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_set_credentials"
           '[GodotString, GodotString, GodotString, GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._set_credentials

{-# NOINLINE bindEditorVCSInterface__shut_down #-}

-- | Shuts down VCS plugin instance. Called when the user either closes the editor or shuts down the VCS plugin through the editor UI.
bindEditorVCSInterface__shut_down :: MethodBind
bindEditorVCSInterface__shut_down
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_shut_down" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shuts down VCS plugin instance. Called when the user either closes the editor or shuts down the VCS plugin through the editor UI.
_shut_down ::
             (EditorVCSInterface :< cls, Object :< cls) => cls -> IO Bool
_shut_down cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__shut_down
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_shut_down" '[] (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._shut_down

{-# NOINLINE bindEditorVCSInterface__stage_file #-}

-- | Stages the file present at @file_path@ to the staged area.
bindEditorVCSInterface__stage_file :: MethodBind
bindEditorVCSInterface__stage_file
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_stage_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stages the file present at @file_path@ to the staged area.
_stage_file ::
              (EditorVCSInterface :< cls, Object :< cls) =>
              cls -> GodotString -> IO ()
_stage_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__stage_file
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_stage_file" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._stage_file

{-# NOINLINE bindEditorVCSInterface__unstage_file #-}

-- | Unstages the file present at @file_path@ from the staged area to the unstaged area.
bindEditorVCSInterface__unstage_file :: MethodBind
bindEditorVCSInterface__unstage_file
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_unstage_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Unstages the file present at @file_path@ from the staged area to the unstaged area.
_unstage_file ::
                (EditorVCSInterface :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
_unstage_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__unstage_file
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "_unstage_file"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorVCSInterface._unstage_file

{-# NOINLINE bindEditorVCSInterface_add_diff_hunks_into_diff_file
             #-}

-- | Helper function to add an array of @diff_hunks@ into a @diff_file@.
bindEditorVCSInterface_add_diff_hunks_into_diff_file :: MethodBind
bindEditorVCSInterface_add_diff_hunks_into_diff_file
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "add_diff_hunks_into_diff_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Helper function to add an array of @diff_hunks@ into a @diff_file@.
add_diff_hunks_into_diff_file ::
                                (EditorVCSInterface :< cls, Object :< cls) =>
                                cls -> Dictionary -> Array -> IO Dictionary
add_diff_hunks_into_diff_file cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorVCSInterface_add_diff_hunks_into_diff_file
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface
           "add_diff_hunks_into_diff_file"
           '[Dictionary, Array]
           (IO Dictionary)
         where
        nodeMethod
          = Godot.Tools.EditorVCSInterface.add_diff_hunks_into_diff_file

{-# NOINLINE bindEditorVCSInterface_add_line_diffs_into_diff_hunk
             #-}

-- | Helper function to add an array of @line_diffs@ into a @diff_hunk@.
bindEditorVCSInterface_add_line_diffs_into_diff_hunk :: MethodBind
bindEditorVCSInterface_add_line_diffs_into_diff_hunk
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "add_line_diffs_into_diff_hunk" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Helper function to add an array of @line_diffs@ into a @diff_hunk@.
add_line_diffs_into_diff_hunk ::
                                (EditorVCSInterface :< cls, Object :< cls) =>
                                cls -> Dictionary -> Array -> IO Dictionary
add_line_diffs_into_diff_hunk cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorVCSInterface_add_line_diffs_into_diff_hunk
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface
           "add_line_diffs_into_diff_hunk"
           '[Dictionary, Array]
           (IO Dictionary)
         where
        nodeMethod
          = Godot.Tools.EditorVCSInterface.add_line_diffs_into_diff_hunk

{-# NOINLINE bindEditorVCSInterface_create_commit #-}

-- | Helper function to create a commit @Dictionary@ item. @msg@ is the commit message of the commit. @author@ is a single human-readable string containing all the author's details, e.g. the email and name configured in the VCS. @id@ is the identifier of the commit, in whichever format your VCS may provide an identifier to commits. @unix_timestamp@ is the UTC Unix timestamp of when the commit was created. @offset_minutes@ is the timezone offset in minutes, recorded from the system timezone where the commit was created.
bindEditorVCSInterface_create_commit :: MethodBind
bindEditorVCSInterface_create_commit
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "create_commit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Helper function to create a commit @Dictionary@ item. @msg@ is the commit message of the commit. @author@ is a single human-readable string containing all the author's details, e.g. the email and name configured in the VCS. @id@ is the identifier of the commit, in whichever format your VCS may provide an identifier to commits. @unix_timestamp@ is the UTC Unix timestamp of when the commit was created. @offset_minutes@ is the timezone offset in minutes, recorded from the system timezone where the commit was created.
create_commit ::
                (EditorVCSInterface :< cls, Object :< cls) =>
                cls ->
                  GodotString ->
                    GodotString -> GodotString -> Int -> Int -> IO Dictionary
create_commit cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface_create_commit
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "create_commit"
           '[GodotString, GodotString, GodotString, Int, Int]
           (IO Dictionary)
         where
        nodeMethod = Godot.Tools.EditorVCSInterface.create_commit

{-# NOINLINE bindEditorVCSInterface_create_diff_file #-}

-- | Helper function to create a @Dictionary@ for storing old and new diff file paths.
bindEditorVCSInterface_create_diff_file :: MethodBind
bindEditorVCSInterface_create_diff_file
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "create_diff_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Helper function to create a @Dictionary@ for storing old and new diff file paths.
create_diff_file ::
                   (EditorVCSInterface :< cls, Object :< cls) =>
                   cls -> GodotString -> GodotString -> IO Dictionary
create_diff_file cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface_create_diff_file
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "create_diff_file"
           '[GodotString, GodotString]
           (IO Dictionary)
         where
        nodeMethod = Godot.Tools.EditorVCSInterface.create_diff_file

{-# NOINLINE bindEditorVCSInterface_create_diff_hunk #-}

-- | Helper function to create a @Dictionary@ for storing diff hunk data. @old_start@ is the starting line number in old file. @new_start@ is the starting line number in new file. @old_lines@ is the number of lines in the old file. @new_lines@ is the number of lines in the new file.
bindEditorVCSInterface_create_diff_hunk :: MethodBind
bindEditorVCSInterface_create_diff_hunk
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "create_diff_hunk" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Helper function to create a @Dictionary@ for storing diff hunk data. @old_start@ is the starting line number in old file. @new_start@ is the starting line number in new file. @old_lines@ is the number of lines in the old file. @new_lines@ is the number of lines in the new file.
create_diff_hunk ::
                   (EditorVCSInterface :< cls, Object :< cls) =>
                   cls -> Int -> Int -> Int -> Int -> IO Dictionary
create_diff_hunk cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface_create_diff_hunk
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "create_diff_hunk"
           '[Int, Int, Int, Int]
           (IO Dictionary)
         where
        nodeMethod = Godot.Tools.EditorVCSInterface.create_diff_hunk

{-# NOINLINE bindEditorVCSInterface_create_diff_line #-}

-- | Helper function to create a @Dictionary@ for storing a line diff. @new_line_no@ is the line number in the new file (can be @-1@ if the line is deleted). @old_line_no@ is the line number in the old file (can be @-1@ if the line is added). @content@ is the diff text. @status@ is a single character string which stores the line origin.
bindEditorVCSInterface_create_diff_line :: MethodBind
bindEditorVCSInterface_create_diff_line
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "create_diff_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Helper function to create a @Dictionary@ for storing a line diff. @new_line_no@ is the line number in the new file (can be @-1@ if the line is deleted). @old_line_no@ is the line number in the old file (can be @-1@ if the line is added). @content@ is the diff text. @status@ is a single character string which stores the line origin.
create_diff_line ::
                   (EditorVCSInterface :< cls, Object :< cls) =>
                   cls -> Int -> Int -> GodotString -> GodotString -> IO Dictionary
create_diff_line cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface_create_diff_line
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "create_diff_line"
           '[Int, Int, GodotString, GodotString]
           (IO Dictionary)
         where
        nodeMethod = Godot.Tools.EditorVCSInterface.create_diff_line

{-# NOINLINE bindEditorVCSInterface_create_status_file #-}

-- | Helper function to create a @Dictionary@ used by editor to read the status of a file.
bindEditorVCSInterface_create_status_file :: MethodBind
bindEditorVCSInterface_create_status_file
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "create_status_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Helper function to create a @Dictionary@ used by editor to read the status of a file.
create_status_file ::
                     (EditorVCSInterface :< cls, Object :< cls) =>
                     cls -> GodotString -> Int -> Int -> IO Dictionary
create_status_file cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface_create_status_file
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "create_status_file"
           '[GodotString, Int, Int]
           (IO Dictionary)
         where
        nodeMethod = Godot.Tools.EditorVCSInterface.create_status_file

{-# NOINLINE bindEditorVCSInterface_popup_error #-}

-- | Pops up an error message in the edior.
bindEditorVCSInterface_popup_error :: MethodBind
bindEditorVCSInterface_popup_error
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "popup_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pops up an error message in the edior.
popup_error ::
              (EditorVCSInterface :< cls, Object :< cls) =>
              cls -> GodotString -> IO ()
popup_error cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface_popup_error
           (upcast cls)
           arrPtr
           len
           >>=
           \ (err, var) ->
             throwIfErr err >> fromGodotVariant var >>=
               \ ret -> godot_variant_destroy var >> return ret)

instance NodeMethod EditorVCSInterface "popup_error" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorVCSInterface.popup_error