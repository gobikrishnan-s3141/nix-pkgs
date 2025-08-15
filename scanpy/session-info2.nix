{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatch-docstring-description,
  hatch-vcs,
  hatchling,
  furo,
  hatch,
  myst-nb,
  session-info2,
  sphinx,
  sphinx-autodoc-typehints,
  sphinx-codeautolink,
  ipywidgets,
  numpy,
  session-info,
  coverage,
  ipykernel,
  jupyter-client,
  pytest,
  pytest-asyncio,
  pytest-md,
  pytest-subprocess,
  testing-common-database,
}:

buildPythonPackage rec {
  pname = "session-info2";
  version = "0.2";
  pyproject = true;

  src = fetchPypi {
    pname = "session_info2";
    inherit version;
    hash = "sha256-6SXTTQopiv4ZQh1VKH6PuazjyPY5CDKqEcZB8BurQXc=";
  };

  build-system = [
    hatch-docstring-description
    hatch-vcs
    hatchling
  ];

  optional-dependencies = {
    docs = [
      furo
      hatch
      myst-nb
      session-info2
      sphinx
      sphinx-autodoc-typehints
      sphinx-codeautolink
    ];
    jupyter = [
      ipywidgets
    ];
    notebook = [
      numpy
      session-info
      session-info2
    ];
    test = [
      coverage
      ipykernel
      jupyter-client
      pytest
      pytest-asyncio
      pytest-md
      pytest-subprocess
      testing-common-database
    ];
  };

  pythonImportsCheck = [
    "session_info2"
  ];

  meta = {
    description = "Print versions of imported packages";
    homepage = "https://pypi.org/project/session-info2/";
    license = lib.licenses.mpl20;
    maintainers = with lib.maintainers; [ ];
  };
}
