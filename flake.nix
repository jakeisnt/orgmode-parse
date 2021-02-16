{
  description = "orgmode-parse flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";
  inputs.haskellNix.url = "github:input-output-hk/haskell.nix/master";

  outputs = { self, haskellNix, nixpkgs }: {
    defaultPackage.x86_64-linux =
      let pkgs = haskellNix.legacyPackages."x86_64-linux";
      drv = pkgs.haskell-nix.project {
        src = pkgs.haskell-nix.haskellLib.cleanGit {
          name = "orgmode-parse";
          src = ./.;
        };
        compiler-nix-name = "ghc8104";
      };
      in drv.components.library;
    };
  }
