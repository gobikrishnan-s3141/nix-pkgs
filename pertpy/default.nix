{
  lib,
  python3,
  fetchPypi,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "pertpy";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NtDjjnOz46PndHarjRHDCUz6ci6z99+kHROXNCTV5qY=";
  };

  build-system = [
    python3.pkgs.hatchling
  ];

  dependencies = with python3.pkgs; [
    adjusttext
    arviz
    blitzgsea
    fast-array-utils
    lamin-utils
    mudata
    openpyxl
    ott-jax
    pubchempy
    pyarrow
    requests
    rich
    scanpy
    scikit-learn
    scikit-misc
    scvi-tools
    sparsecca
  ];

  optional-dependencies = with python3.pkgs; {
    de = [
      formulaic
      formulaic-contrasts
      pydeseq2
    ];
    dev = [
      pre-commit
    ];
    doc = [
      docutils
      ipykernel
      ipython
      myst-nb
      nbsphinx
      nbsphinx-link
      pygments
      scanpydoc
      sphinx
      sphinx-autodoc-typehints
      sphinx-automodapi
      sphinx-book-theme
      sphinx-copybutton
      sphinx-design
      sphinx-gallery
      sphinx-issues
      sphinx-last-updated-by-git
      sphinx-remove-toctrees
      sphinxcontrib-bibtex
      sphinxext-opengraph
    ];
    tcoda = [
      ete4
      pyqt6
      toytree
    ];
    test = [
      coverage
      leidenalg
      pytest
    ];
  };

  pythonImportsCheck = [
    "pertpy"
  ];

  meta = {
    description = "Perturbation Analysis in the scverse ecosystem";
    homepage = "https://pypi.org/project/pertpy/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "pertpy";
  };
}
