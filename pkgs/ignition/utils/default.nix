{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  spdlog,
  ignition,
  ignition-cmake ? ignition.cmake,
  majorVersion ? "1",
  version ? "1.5.1",
  srcHash ? "sha256-Ymlw1SBoSlHwxe/4E3jdMy8ECCFNy8YGboqTQi6UIs4=",
  ...
}:
stdenv.mkDerivation rec {
  pname =
    if (majorVersion < "2")
    then "ignition-utils${majorVersion}"
    else "gz-utils${majorVersion}";
  inherit version;

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-utils";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  nativeBuildInputs = [cmake];
  propagatedBuildInputs = [ignition-cmake] ++ lib.optional (lib.versionAtLeast (toString version) "3.0.0") spdlog;

  buildInputs = [cmake];
  cmakeFlags = [
    "-DCMAKE_INSTALL_LIBDIR='lib'"
  ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/common";
    description = "Classes and functions for robot applications";
    license = licenses.asl20;
    maintainers = with maintainers; [lopsided98];
    platforms = platforms.all;
  };
}
