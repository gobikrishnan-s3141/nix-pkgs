# Nix packages - bioinformatics
## list of packages 
- scanpy
- ... 


{ pkgs ? import <nixpkgs> {}
}:

pkgs.python3.pkgs.buildPythonPackage rec {
  pname = "scanpy";
  version = "1.10.0";  # Update to the latest version
  format = "pyproject";

  src = pkgs.fetchPypi {
    inherit pname version;
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # Update via nix-build
  };

  propagatedBuildInputs = with pkgs.python3.pkgs; [
    anndata
    numpy
    scipy
    pandas
    matplotlib
    seaborn
    h5py
    tqdm
    scikit-learn
    statsmodels
    patsy
    networkx
    numba
    # Optional: Add leidenalg and igraph for clustering
    leidenalg
    python-igraph
  ];

  nativeBuildInputs = with pkgs; [
    pkg-config
    # Required for numba/llvmlite (see troubleshooting in search results[citation:8])
    llvmPackages.llvm
  ];

  buildInputs = [
    pkgs.igraph  # C library dependency for python-igraph
  ];

  # Environment variables for LLVM (critical for numba)
  preBuild = ''
    export LLVM_CONFIG=${pkgs.llvmPackages.llvm.dev}/bin/llvm-config
  '';

  # Optional: Run tests
  checkInputs = with pkgs.python3.pkgs; [ pytest ];
  checkPhase = ''
    pytest
  '';

  meta = with pkgs.lib; {
    description = "Single-cell analysis toolkit";
    homepage = "https://scanpy.readthedocs.io";
    license = licenses.bsd3;
  };
}
