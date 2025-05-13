{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/63dacb46bf939521bdc93981b4cbb7ecb58427a0";
    systems.url = "github:nix-systems/x86_64-linux";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      imports = [ inputs.treefmt-nix.flakeModule ];

      perSystem =
        {
          pkgs,
          lib,
          system,
          ...
        }:
        let
          godot-haskell = pkgs.callPackage ./. { };
        in
        {
          treefmt = {
            projectRootFile = "flake.lock";
            programs.nixfmt.enable = true;
          };

          packages = {
            inherit godot-haskell;
            default = godot-haskell;
          };

          devShells.default = pkgs.mkShell {
            nativeBuildInputs = [
              # Development tools
              pkgs.nil
              pkgs.just
              pkgs.cabal-install
              pkgs.haskellPackages.ghc
              pkgs.haskellPackages.haskell-language-server
              pkgs.haskellPackages.hpack
            ];

            shellHook = ''
              export PS1="\n[nix-shell:\w]$ "
            '';
          };
        };
    };
}
