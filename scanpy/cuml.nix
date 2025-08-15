{
  lib,
  buildPythonPackage,
  fetchPypi,
  wheel-stub,
  cuda-python,
  cudf-cu12,
  cupy-cuda12x,
  cuvs-cu12,
  dask-cuda,
  dask-cudf-cu12,
  joblib,
  libcuml-cu12,
  numba,
  numpy,
  nvidia-cublas-cu12,
  nvidia-cufft-cu12,
  nvidia-curand-cu12,
  nvidia-cusolver-cu12,
  nvidia-cusparse-cu12,
  packaging,
  pylibraft-cu12,
  raft-dask-cu12,
  rapids-dask-dependency,
  rich,
  rmm-cu12,
  scikit-learn,
  scipy,
  treelite,
  certifi,
  cython,
  dask-ml,
  hdbscan,
  hypothesis,
  nltk,
  numpydoc,
  pynndescent,
  pytest,
  pytest-benchmark,
  pytest-cases,
  pytest-cov,
  pytest-xdist,
  pyyaml,
  seaborn,
  statsmodels,
  tenacity,
  umap-learn,
  xgboost,
}:

buildPythonPackage rec {
  pname = "cuml-cu12";
  version = "25.8.0";
  pyproject = true;

  src = fetchPypi {
    pname = "cuml_cu12";
    inherit version;
    hash = "sha256-aae7xQiwFvrf6kfVlpqqROcN95/QA0xB3W/n7NWQruU=";
  };

  build-system = [
    wheel-stub
  ];

  dependencies = [
    cuda-python
    cudf-cu12
    cupy-cuda12x
    cuvs-cu12
    dask-cuda
    dask-cudf-cu12
    joblib
    libcuml-cu12
    numba
    numpy
    nvidia-cublas-cu12
    nvidia-cufft-cu12
    nvidia-curand-cu12
    nvidia-cusolver-cu12
    nvidia-cusparse-cu12
    packaging
    pylibraft-cu12
    raft-dask-cu12
    rapids-dask-dependency
    rich
    rmm-cu12
    scikit-learn
    scipy
    treelite
  ];

  optional-dependencies = {
    test = [
      certifi
      cython
      dask-ml
      hdbscan
      hypothesis
      nltk
      numpydoc
      pynndescent
      pytest
      pytest-benchmark
      pytest-cases
      pytest-cov
      pytest-xdist
      pyyaml
      scikit-learn
      seaborn
      statsmodels
      tenacity
      umap-learn
      xgboost
    ];
  };

  pythonImportsCheck = [
    "cuml_cu12"
  ];

  meta = {
    description = "CuML - RAPIDS ML Algorithms";
    homepage = "https://pypi.org/project/cuml-cu12/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
