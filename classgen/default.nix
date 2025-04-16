{
  lib,
  stdenv,
  callPackage,
  haskellPackages,
  fetchFromGitHub,
}:

let
  haskell-src-exts-qq = haskellPackages.mkDerivation {
    pname = "haskell-src-exts-qq";
    version = "0.8";

    src = fetchFromGitHub {
      owner = "KaneTW";
      repo = "haskell-src-exts-qq";
      rev = "a2d9071c9d6a627a253edfaaa64b6b67c9da3534";
      sha256 = "1cvk90zi16m3nnz52gxim9b8sm17356jrp756y95is6ky13l2h60";
    };

    libraryHaskellDepends = [
      haskellPackages.base
      haskellPackages.haskell-src-exts
      haskellPackages.haskell-src-meta
      haskellPackages.syb
      haskellPackages.template-haskell
    ];

    testHaskellDepends = [
      haskellPackages.base
      haskellPackages.haskell-src-exts
      haskellPackages.hspec
    ];

    description = "A quasiquoter for haskell-src-exts";
    license = lib.licenses.bsd3;

    doHaddock = false;
    doCheck = false;
    enableLibraryProfiling = false;
  };
in

haskellPackages.mkDerivation {
  pname = "godot-haskell-classgen";
  version = "0.1.0.0";
  src = lib.cleanSource ./.;

  isLibrary = true;
  isExecutable = true;

  libraryHaskellDepends = [
    haskellPackages.aeson
    haskellPackages.base
    haskellPackages.bytestring
    haskellPackages.casing
    haskellPackages.containers
    haskellPackages.lens
    haskellPackages.mtl
    haskellPackages.template-haskell
    haskellPackages.text
    haskellPackages.unordered-containers
    haskellPackages.vector
    haskellPackages.haskell-src-exts
    haskellPackages.haskell-src-meta

    haskell-src-exts-qq
  ];

  libraryToolDepends = [
    haskellPackages.c2hs
    haskellPackages.hpack
  ];

  executableHaskellDepends = [
    haskellPackages.aeson
    haskellPackages.base
    haskellPackages.bytestring
    haskellPackages.casing
    haskellPackages.containers
    haskellPackages.directory
    haskellPackages.filepath
    haskellPackages.lens
    haskellPackages.mtl
    haskellPackages.template-haskell
    haskellPackages.text
    haskellPackages.unordered-containers
    haskellPackages.vector
    haskellPackages.haskell-src-exts
    haskellPackages.haskell-src-meta
  ];

  executableToolDepends = [ haskellPackages.c2hs ];

  prePatch = ''
    hpack
  '';

  homepage = "https://github.com/KaneTW/godot-haskell#readme";
  license = lib.licenses.bsd3;

  doHaddock = false;
  doCheck = false;
  enableLibraryProfiling = false;
}
