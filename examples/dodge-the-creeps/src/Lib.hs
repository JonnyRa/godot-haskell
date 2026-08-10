module Lib (exports) where
import Godot
import Game.Mob
import Game.Main
import Game.Player
import Game.HUD
import Project.Requirements
import Godot.Nativescript

exports :: GdnativeHandle -> IO ()
exports = registerAll' @Nodes @'[HUD, Main, Mob, Player]
