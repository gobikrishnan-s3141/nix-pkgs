{
  lib,
  python3,
  fetchPypi,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "scvi-tools";
  version = "1.3.3";
  pyproject = true;

  src = fetchPypi {
    pname = "scvi_tools";
    inherit version;
    hash = "sha256-A8m4v9pTfweqUXEzjvLI055XOPJkN3LcNvurfAHGdJ0=";
  };

  build-system = [
    python3.pkgs.hatchling
  ];

  dependencies = with python3.pkgs; [
    anndata
    docrep
    flax
    jax
    jaxlib
    lightning
    ml-collections
    mudata
    numba
    numpy
    numpyro
    optax
    pandas
    pyro-ppl
    rich
    scikit-learn
    scipy
    sparse
    tensorboard
    torch
    torchmetrics
    tqdm
    xarray
  ];

  optional-dependencies = with python3.pkgs; {
    all = [
      scvi-tools
    ];
    autotune = [
      hyperopt
      ray
      scib-metrics
    ];
    aws = [
      boto3
    ];
    cuda = [
      jax
      torchaudio
      torchvision
    ];
    dataloaders = [
      biomart
      cellxgene-census
      cellxgene-lamin
      lamindb
      tiledb
      tiledbsoma
      tiledbsoma-ml
      torchdata
    ];
    dev = [
      scvi-tools
    ];
    docs = [
      docutils
      ipython
      myst-nb
      myst-parser
      sphinx
      sphinx-autodoc-typehints
      sphinx-book-theme
      sphinx-copybutton
      sphinx-design
      sphinx-hoverxref
      sphinxcontrib-bibtex
      sphinxext-opengraph
    ];
    docsbuild = [
      scvi-tools
    ];
    editing = [
      jupyter
      pre-commit
    ];
    file_sharing = [
      gdown
      pooch
    ];
    hub = [
      dvc
      huggingface-hub
      igraph
      leidenalg
    ];
    interpretability = [
      captum
      shap
    ];
    metal = [
      jax-metal
      torchaudio
      torchvision
    ];
    optional = [
      scvi-tools
    ];
    parallel = [
      dask
      zarr
    ];
    regseq = [
      biopython
      genomepy
    ];
    scanpy = [
      scanpy
      scikit-misc
    ];
    test = [
      scvi-tools
    ];
    tests = [
      coverage
      pytest
      pytest-pretty
      scvi-tools
      selenium
    ];
    tutorials = [
      cell2location
      dataloaders
      igraph
      jupyter
      leidenalg
      matplotlib
      muon
      plotnine
      pynndescent
      scrublet
      scvi-tools
      seaborn
      squidpy
    ];
  };

  pythonImportsCheck = [
    "scvi_tools"
  ];

  meta = {
    description = "Deep probabilistic analysis of single-cell omics data";
    homepage = "https://pypi.org/project/scvi-tools/";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "scvi-tools";
  };
}
