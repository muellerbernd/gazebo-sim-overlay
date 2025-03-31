{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,
  cmake,
  pkg-config,
  majorVersion ? "2",
  version ? "2.17.1",
  srcHash ? "sha256-JHRa84uED+dqu0EHrVFTh6o7eiVpgPbTYqpv8vZtJM4=",
  python3,
  ...
}:
stdenv.mkDerivation rec {
  pname =
    if (majorVersion < "3")
    then "ignition-cmake${majorVersion}"
    else "gz-cmake${majorVersion}";
  inherit version;

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-cmake";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  # Fix pkgconfig with absolute CMAKE_INSTALL_*DIR
  patches =
    lib.optional (
      majorVersion == "" # 0
    ) (fetchpatch {
      url = "https://github.com/gazebosim/gz-cmake/commit/fe3100f11073a82a8faf63eb629de9f77fe2b331.patch";
      hash = "sha256-fgSAOZoQmZt/nAx2eBDyC+4+0m++crlZ2BGRH4UcuQY=";
    });

  cmakeFlags = [
    "-DCMAKE_INSTALL_LIBDIR='lib'"
  ];

  nativeBuildInputs = [cmake];
  buildInputs = [cmake];
  # pkg-config is needed to use some CMake modules in this package
  propagatedBuildInputs =
    [pkg-config]
    ++ lib.optional (lib.versionAtLeast version "3") [python3];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/cmake";
    description = "CMake Modules for Ignition Projects";
    license = licenses.asl20;
    maintainers = with maintainers; [lopsided98];
    platforms = platforms.all;
  };
}
