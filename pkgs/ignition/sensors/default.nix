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
  qtbase ? null,
  wrapQtAppsHook,
  ...
}:
stdenv.mkDerivation rec {
  pname =
    if (lib.versionAtLeast version "8") then
      "gz-sensors${majorVersion}"
    else
      "ignition-sensors${majorVersion}";
  inherit version;

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-sensors";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  nativeBuildInputs = [
    cmake
    wrapQtAppsHook
  ];

  propagatedBuildInputs = [
    ignition-cmake
    ignition-plugin
    ignition-transport
    ignition-rendering
    ignition-msgs
    ignition-common
    sdformat
    eigen
  ] ++ lib.optional (qtbase != null) qtbase;

  buildInputs = [ cmake ] ++ lib.optional (qtbase != null) qtbase;

  cmakeFlags = [
    "-DCMAKE_INSTALL_LIBDIR='lib'"
  ];

  postConfigure = ''
    find . -name "flags.make" -exec sed -i 's/-Werror//g' {} +
  '';

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/sensors";
    description = ''
      Provides numerous sensor models designed to generate realistic data
      from simulation environments.'';
    license = licenses.asl20;
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.all;
  };
}
