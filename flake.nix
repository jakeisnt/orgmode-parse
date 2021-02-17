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
        package =
          pkgs.haskell.packages.${compiler}.callPackage ./default.nix { };
      in {
        defaultPackage = package;
        devShell = package.env;
      });
}
