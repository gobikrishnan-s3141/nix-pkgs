{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  future,
  graphtools,
  matplotlib,
  numpy,
  pandas,
  scikit-learn,
  scipy,
  scprep,
  tasklogger,
  sphinx,
  sphinxcontrib-napoleon,
  anndata,
  coverage,
  coveralls,
  nose2,
}:

buildPythonPackage rec {
  pname = "magic-impute";
  version = "3.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-DD9tF7r1hsQSwXRwmhkWTwTmk/0ZM6jAOZrlxb8c/Xo=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    future
    graphtools
    matplotlib
    numpy
    pandas
    scikit-learn
    scipy
    scprep
    tasklogger
  ];

  optional-dependencies = {
    doc = [
      sphinx
      sphinxcontrib-napoleon
    ];
    test = [
      anndata
      coverage
      coveralls
      nose2
    ];
  };

  pythonImportsCheck = [
    "magic_impute"
  ];

  meta = {
    description = "MAGIC";
    homepage = "https://pypi.org/project/magic-impute/";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ ];
  };
}
