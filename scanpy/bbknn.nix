{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  annoy,
  cython,
  numpy,
  pandas,
  pynndescent,
  scikit-learn,
  scipy,
  umap-learn,
}:

buildPythonPackage rec {
  pname = "bbknn";
  version = "1.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-HAGp1t8vxSpSfeikA2F4l6S2cnJIYymacCbyEy8bBBs=";
  };

  build-system = [
    flit-core
  ];

  dependencies = [
    annoy
    cython
    numpy
    pandas
    pynndescent
    scikit-learn
    scipy
    umap-learn
  ];

  pythonImportsCheck = [
    "bbknn"
  ];

  meta = {
    description = "Batch balanced KNN";
    homepage = "https://pypi.org/project/bbknn/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
