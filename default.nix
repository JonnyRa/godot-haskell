{
  lib,
  stdenv,
  callPackage,
  haskellPackages,

  # Dependencies
  godot-haskell-classgen ? callPackage ./classgen { },
  rsync,
  api-json ? null,
}:

let
  modifyGodotApi = lib.optionalString (api-json != null) ''
    cd classgen
    echo "Running godot-haskell-classgen on path " ${api-json}
    godot-haskell-classgen ${api-json}
    cd ..
    cp -r src src.bak
    rsync -a classgen/src/ src/
  '';
in

haskellPackages.mkDerivation {
  pname = "godot-haskell";
  version = "3.1.0.0";
  src = lib.cleanSource ./.;

  libraryHaskellDepends = [
    haskellPackages.aeson
    haskellPackages.ansi-wl-pprint
    haskellPackages.base
    haskellPackages.bytestring
    haskellPackages.casing
    haskellPackages.colour
    haskellPackages.containers
    haskellPackages.lens
    haskellPackages.linear
    haskellPackages.mtl
    haskellPackages.parsec
    haskellPackages.parsers
    haskellPackages.stm
    haskellPackages.template-haskell
    haskellPackages.text
    haskellPackages.unordered-containers
    haskellPackages.vector
    haskellPackages.prettyprinter
    haskellPackages.prettyprinter-ansi-terminal
  ];

  libraryToolDepends = [
    haskellPackages.c2hs
    haskellPackages.hpack

    rsync
    godot-haskell-classgen
  ];

  preConfigure = ''
    hpack
    ${modifyGodotApi}
  '';

  homepage = "https://github.com/KaneTW/godot-haskell#readme";
  description = "Haskell bindings for the Godot game engine API";
  license = lib.licenses.bsd3;

  doCheck = false;
  doHaddock = false;
  enableLibraryProfiling = false;
}
