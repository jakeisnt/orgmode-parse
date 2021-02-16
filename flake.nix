{
  description = "orgmode-parse flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";
  inputs.haskellNix.url = "github:input-output-hk/haskell.nix/master";

  outputs = { self, haskellNix, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    compiler = "ghc884";
  in
  {
    defaultPackage.${system} =
      pkgs.haskell.packages.${compiler}.callPackage ./default.nix { };
  };
}
