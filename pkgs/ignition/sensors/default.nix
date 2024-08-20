{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,
  cmake,
  pkg-config,
  majorVersion ? "8",
  version ? "8.0.0",
  srcHash ? "sha256-JHRa84uED+dqu0EHrVFTh6o7eiVpgPbTYqpv8vZtJM4=",
  ignition-plugin,
  ignition-cmake,
  ignition-transport,
  ignition-rendering,
  ignition-msgs,
  ignition-common,
  sdformat,
  eigen,
  wrapQtAppsHook,
  ...
}:
stdenv.mkDerivation rec {
  pname = "gz-sensors${majorVersion}";
  inherit version;

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-sensors";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  nativeBuildInputs = [cmake wrapQtAppsHook];
  # pkg-config is needed to use some CMake modules in this package
  propagatedBuildInputs = [pkg-config];
  # propagatedNativeBuildInputs = [ ignition-cmake ];
  buildInputs = [
    ignition-cmake
    ignition-plugin
    ignition-transport
    ignition-rendering
    ignition-msgs
    ignition-common
    sdformat
    eigen
  ];
  cmakeFlags = [
    "-DCMAKE_INSTALL_LIBDIR='lib'"
  ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/sensors";
    description = ''
      Provides numerous sensor models designed to generate realistic data
      from simulation environments.'';
    license = licenses.asl20;
    maintainers = with maintainers; [muellerbernd];
    platforms = platforms.all;
  };
}
