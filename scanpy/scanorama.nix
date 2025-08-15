{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  annoy,
  fbpca,
  geosketch,
  intervaltree,
  matplotlib,
  numpy,
  scikit-learn,
  scipy,
}:

buildPythonPackage rec {
  pname = "scanorama";
  version = "1.7.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Z94QDmOrwwKMd4DTohfkPpIKV4EjC8a2pRNJ1GBeAFw=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    annoy
    fbpca
    geosketch
    intervaltree
    matplotlib
    numpy
    scikit-learn
    scipy
  ];

  pythonImportsCheck = [
    "scanorama"
  ];

  meta = {
    description = "Panoramic stitching of heterogeneous single cell transcriptomic data";
    homepage = "https://pypi.org/project/scanorama/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
