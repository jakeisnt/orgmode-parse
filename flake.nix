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
        pkgs = import nixpkgs { inherit system; };
        package = with pkgs.haskellPackages;
          callPackage (callCabal2nix "orgmode-parse" ./.) { };
      in {
        defaultPackage = package;
        packages.orgmode-parse = package;
        devShell = package.env;
      });
}
