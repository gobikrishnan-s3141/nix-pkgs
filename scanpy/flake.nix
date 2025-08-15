{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forEachSupportedSystem =
        f:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            inherit system;
            pkgs = import nixpkgs { inherit system; };
          }
        );
    in
    {
      packages = forEachSupportedSystem (
        { pkgs, ... }:
        let
          custom = import ./default.nix { inherit pkgs; };
        in
        {
          inherit (custom) scanpy;
          default = pkgs.python312.withPackages (ps: [ custom.scanpy ]);
        }
      );

      devShells = forEachSupportedSystem (
        { pkgs, system, ... }:
        {
          default = pkgs.mkShell {
            packages = [ self.packages.${system}.default ];
          };
        }
      );
    };
}
