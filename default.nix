{
  lib,
  haskellPackages,
}:

haskellPackages.mkDerivation {
  pname = "godot-haskell";
  version = "3.1.0.0";
  src = lib.cleanSource ./.;

  libraryHaskellDepends = [
    haskellPackages.aeson
    haskellPackages.ansi-wl-pprint
    haskellPackages.casing
    haskellPackages.colour
    haskellPackages.lens
    haskellPackages.linear
    haskellPackages.parsers
    haskellPackages.unordered-containers
    haskellPackages.vector
    haskellPackages.prettyprinter
    haskellPackages.prettyprinter-ansi-terminal
    haskellPackages.extra
    haskellPackages.fsnotify
    haskellPackages.interpolate
  ];

  libraryToolDepends = [
    haskellPackages.c2hs
    haskellPackages.hpack
  ];

  preConfigure = ''
    hpack
  '';

  configureFlags = [ "--ghc-options=-fPIC -fexternal-dynamic-refs" ];

  homepage = "https://github.com/KaneTW/godot-haskell#readme";
  description = "Haskell bindings for the Godot game engine API";
  license = lib.licenses.bsd3;

  doCheck = false;
  doHaddock = false;
  enableLibraryProfiling = true;
}
