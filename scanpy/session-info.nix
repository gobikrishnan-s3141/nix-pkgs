{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  stdlib-list,
}:

buildPythonPackage rec {
  pname = "session-info";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "session_info";
    inherit version;
    hash = "sha256-1xlQ1ajOf399XoaqIIwUjE5QtUQLd9VUTUIrSOTz7UE=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    stdlib-list
  ];

  pythonImportsCheck = [
    "session_info"
  ];

  meta = {
    description = "Session_info outputs version information for modules loaded in the current session, Python, and the OS";
    homepage = "https://pypi.org/project/session-info/";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ ];
  };
}
