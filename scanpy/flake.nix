{
  description = "Flake for Scanpy";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.default = pkgs.python3Packages.scanpy;

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.python3Packages.scanpy
          pkgs.python3Packages.jupyter
        ];
      };
    };
}

