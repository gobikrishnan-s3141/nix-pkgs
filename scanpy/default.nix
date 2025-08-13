{
  lib,
  python3,
  fetchPypi,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "scanpy";
  version = "1.11.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-MzGJ7KyccAm/VdQW7i4nLhxJDVTHGUePe03R/ClNL5U=";
  };

  build-system = [
    python3.pkgs.hatch-vcs
    python3.pkgs.hatchling
  ];

  dependencies = with python3.pkgs; [
    anndata
    h5py
    joblib
    legacy-api-wrap
    matplotlib
    natsort
    networkx
    numba
    numpy
    packaging
    pandas
    patsy
    pynndescent
    scikit-learn
    scipy
    seaborn
    session-info2
    statsmodels
    tqdm
    typing-extensions
    umap-learn
  ];

  optional-dependencies = with python3.pkgs; {
    bbknn = [
      bbknn
    ];
    dask = [
      anndata
      dask
    ];
    dask-ml = [
      dask-ml
      scanpy
    ];
    dev = [
      hatch-vcs
      pre-commit
      towncrier
    ];
    doc = [
      ipython
      matplotlib
      myst-nb
      myst-parser
      nbsphinx
      sam-algorithm
      scanpy
      scanpydoc
      sphinx
      sphinx-autodoc-typehints
      sphinx-book-theme
      sphinx-copybutton
      sphinx-design
      sphinx-issues
      sphinx-tabs
      sphinxcontrib-bibtex
      sphinxext-opengraph
    ];
    harmony = [
      harmonypy
    ];
    leiden = [
      igraph
      leidenalg
    ];
    louvain = [
      igraph
      louvain
    ];
    magic = [
      magic-impute
    ];
    paga = [
      igraph
    ];
    rapids = [
      cudf
      cugraph
      cuml
    ];
    scanorama = [
      scanorama
    ];
    scrublet = [
      scikit-image
    ];
    skmisc = [
      scikit-misc
    ];
    test = [
      scanpy
      zarr
    ];
    test-min = [
      pytest
      pytest-cov
      pytest-mock
      pytest-randomly
      pytest-rerunfailures
      pytest-xdist
      tuna
    ];
  };

  pythonImportsCheck = [
    "scanpy"
  ];

  meta = {
    description = "Single-Cell Analysis in Python";
    homepage = "https://pypi.org/project/scanpy/";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "scanpy";
  };
}
