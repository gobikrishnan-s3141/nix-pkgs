{
  lib,
  stdenv,
  fetchPypi,
}:

stdenv.mkDerivation rec {
  pname = "cudf-cu12";
  version = "24.10.1";

  src = fetchPypi {
    pname = "cudf_cu12";
    inherit version;
    hash = "sha256-nn91IOmG/6AMV1zshmGGJIeLsFJhlGeAwNmlTRtCgYc=";
  };

  meta = {
    description = "CuDF - GPU Dataframe";
    homepage = "https://pypi.org/project/cudf-cu12/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "cudf-cu12";
    platforms = lib.platforms.all;
  };
}
