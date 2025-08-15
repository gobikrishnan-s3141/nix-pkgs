{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
}:

buildPythonPackage rec {
  pname = "sam-algorithm";
  version = "1.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-lxeTxGr5RHJyn5F9BgYZ120Wex/k/kYlqg8ruQi6rVE=";
  };

  build-system = [
    setuptools
    wheel
  ];

  pythonImportsCheck = [
    "sam_algorithm"
  ];

  meta = {
    description = "The Self-Assembling-Manifold algorithm";
    homepage = "https://pypi.org/project/sam-algorithm/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
