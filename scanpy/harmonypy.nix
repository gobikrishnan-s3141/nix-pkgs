{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  numpy,
  pandas,
  scikit-learn,
  scipy,
}:

buildPythonPackage rec {
  pname = "harmonypy";
  version = "0.0.10";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-J705pvmtoXCP+ld+Rsm3Nj0eL9YnQOR3zhH9YYGaVN8=";
  };

  build-system = [
    hatchling
  ];

  dependencies = [
    numpy
    pandas
    scikit-learn
    scipy
  ];

  pythonImportsCheck = [
    "harmonypy"
  ];

  meta = {
    description = "A data integration algorithm";
    homepage = "https://pypi.org/project/harmonypy/";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
}
