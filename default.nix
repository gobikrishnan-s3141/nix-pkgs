# default.nix --> Build your project / distribution

{ stdenv, python }:
stdenv.mkDerivation {
  buildInputs = [ pkgs.python3Minimal ];
  name = "my-proj";
  version = "0.0.1";
  src = /home/yourname/path/to/project; # can be a local path, or fetchFromGitHub, fetchgit, ...
  # build instructions here
}

# add packages to buildInputs to define your env: git, r-base, ...
