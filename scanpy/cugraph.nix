{
  lib,
  buildPythonPackage,
  fetchPypi,
  wheel-stub,
  cuda-python,
  cudf-cu12,
  cupy-cuda12x,
  dask-cuda,
  dask-cudf-cu12,
  fsspec,
  libcugraph-cu12,
  numba,
  numpy,
  pylibcudf-cu12,
  pylibcugraph-cu12,
  pylibraft-cu12,
  raft-dask-cu12,
  rapids-dask-dependency,
  rmm-cu12,
  ucx-py-cu12,
  certifi,
  networkx,
  pandas,
  pytest,
  pytest-benchmark,
  pytest-cov,
  pytest-xdist,
  python-louvain,
  scikit-learn,
  scipy,
}:

buildPythonPackage rec {
  pname = "cugraph-cu12";
  version = "25.8.0";
  pyproject = true;

  src = fetchPypi {
    pname = "cugraph_cu12";
    inherit version;
    hash = "sha256-FJsK3986HxcDCCPs3hgcwcTcmtTu9qzYpMBA5T8VCgU=";
  };

  build-system = [
    wheel-stub
  ];

  dependencies = [
    cuda-python
    cudf-cu12
    cupy-cuda12x
    dask-cuda
    dask-cudf-cu12
    fsspec
    libcugraph-cu12
    numba
    numpy
    pylibcudf-cu12
    pylibcugraph-cu12
    pylibraft-cu12
    raft-dask-cu12
    rapids-dask-dependency
    rmm-cu12
    ucx-py-cu12
  ];

  optional-dependencies = {
    test = [
      certifi
      networkx
      numpy
      pandas
      pytest
      pytest-benchmark
      pytest-cov
      pytest-xdist
      python-louvain
      scikit-learn
      scipy
    ];
  };

  pythonImportsCheck = [
    "cugraph_cu12"
  ];

  meta = {
    description = "CuGraph - RAPIDS GPU Graph Analytics";
    homepage = "https://pypi.org/project/cugraph-cu12/#description";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
