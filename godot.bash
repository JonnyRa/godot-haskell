source ~/.profile

unset -f sourceProfile

sourceProfile(){
  source "${BASH_SOURCE%/*}"
}

installHaskellGenerator(){
  #--copy-bins is effectively `stack install`
  stackBuildWatch godot-haskell:exe:godot-haskell-project-generator --copy-bins --ghc-options "-j12"
}

#run this after changing version
rebuildGodotTypes () {
  cd classgen
  stack build --colour always --file-watch --watch-all --exec  "stack exec godot-haskell-classgen -- ../godot_headers/api.json ../godot_doc_classes.json ../" 2>&1 | tee ../errorLog
  cd -
}

buildDodgeTheCreeps(){
  STACKLIBFILE=$(stack path --local-install-root)/lib/libmyproject.so
  GODOTPROJECT=$(stack path --project-root)/examples/dodge-the-creeps/game
  stackBuildWatch myproject --exec "cp $STACKLIBFILE $GODOTPROJECT/lib"
}
