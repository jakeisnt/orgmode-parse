{
  description = "orgmode-parse flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    haskellNix.url = "github:input-output-hk/haskell.nix/master";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, haskellNix, nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (system:
      let
        system = "x86_64-linux";
        pkgs = import nixpkgs { inherit system; };
        compiler = "ghc8104";
      in {
        defaultPackage =
          pkgs.haskell.packages.${compiler}.callPackage ./default.nix { };
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            pkgs.haskellPackages.cabal-install
            (haskellPackages.ghcWithPackages (ps:
              with ps; [
                ghcide
                aeson
                attoparsec
                base
                bytestring
                containers
                free
                hashable
                HUnit
                insert-ordered-containers
                neat-interpolation
                old-locale
                semigroups
                tasty
                tasty-hunit
                text
                thyme
                unordered-containers

                hoogle
              ]))
          ];
        };
      });
}
