# shell.nix ---> dev environment with temp shell
# python, r and perl dev environment templates

{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = with pkgs.buildPackages; [ python3Minimal ];
}


# replace python3Minimal with perl for perl dev and r for r dev
