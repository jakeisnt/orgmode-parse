{
  description = "orgmode-parse flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";
  inputs.haskellNix.url = "github:input-output-hk/haskell.nix/master";

  outputs = { self, haskellNix, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    compiler = "ghc8104";
  in
  {
    defaultPackage.${system} =
      pkgs.haskell.packages.${compiler}.callPackage ./default.nix { };
      devShell = pkgs.mkShell {
        buildInputs = with pkgs;[
          haskell-language-server 
          (haskellPackages.ghcWithPackages [
            hoogle
            aeson
            attoparsec
          ])
        ];
      };
    };
  }
