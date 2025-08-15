{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  igraph,
}:

buildPythonPackage rec {
  pname = "louvain";
  version = "0.8.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-zgQLsMXjSa6tWh5emXONzZ8tEMIlJtBjMoG2riMO6NQ=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    igraph
  ];

  pythonImportsCheck = [
    "louvain"
  ];

  meta = {
    description = "Louvain is a general algorithm for methods of community detection in large networks";
    homepage = "https://pypi.org/project/louvain/";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
}
