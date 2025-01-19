## using nix-shell
# nix-shell --packages 'rWrapper.override{packages = [ rPackages.ggplot2 ];}'
# override the rPackages,ggplot2 with rPackages<r-pkg> to install your desired R pkgs

## using shell.nix lorri

let
  pkgs = import <nixpkgs> {};
in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      R
      rPackages.rmarkdown
      rPackages.BiocManager
      rPackages.ggplot2
    ];
  }
