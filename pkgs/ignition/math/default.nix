{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  # , ignition
  ignition-cmake,
  ignition-utils,
  # ,ignition-math ? ignition.math
  majorVersion ? "6",
  version ? "6.13.0",
  srcHash ? "sha256-4kWbHdsDCCEgXHy3Dv4oZKdVBY4eJLKovYu+HUgkSjE=",
  eigen,
  ...
}:
stdenv.mkDerivation rec {
  pname =
    if (lib.versionAtLeast version "7") then
      "gz-math${majorVersion}"
    else
      "ignition-math${majorVersion}";
  inherit version;

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-math";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [
    ignition-cmake
    eigen
  ]
  ++ lib.optional (lib.versionAtLeast version "7") [
    # gz-cmake_3
    # gz-math_7
    # gz-utils_2
    ignition-utils
  ];

  buildInputs = [ cmake ];
  cmakeFlags = [
    "-DCMAKE_INSTALL_LIBDIR='lib'"
  ];
  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/math";
    description = "Math classes and functions for robot applications";
    license = licenses.asl20;
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.all;
  };
}
