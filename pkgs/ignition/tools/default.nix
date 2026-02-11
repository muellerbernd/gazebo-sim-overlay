{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  majorVersion ? "2",
  version ? "2.0.0",
  srcHash ? "sha256-JHRa84uED+dqu0EHrVFTh6o7eiVpgPbTYqpv8vZtJM4=",
  ignition-cmake,
  ruby,
  ronn,
  wrapQtAppsHook,
  qtquickcontrols2,
  qtgraphicaleffects,
  pkg-config,
  ...
}:
stdenv.mkDerivation rec {
  # pname = "gz-tools${majorVersion}";
  # inherit version;
  pname = if (lib.versionAtLeast version "2") then "gz-tools${majorVersion}" else "ignition-tools";
  inherit version;

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-tools";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  nativeBuildInputs = [
    cmake
    wrapQtAppsHook
  ];
  # pkg-config is needed to use some CMake modules in this package
  propagatedBuildInputs = [
    pkg-config
    ignition-cmake
    ruby
  ];
  propagatedNativeBuildInputs = [
    qtquickcontrols2
    qtgraphicaleffects
  ];
  buildInputs = [
    ronn
    cmake
  ];

  dontWrapQtApps = true;

  postFixup =
    if (lib.versionAtLeast majorVersion "2") then "wrapQtApp $out/bin/gz" else "wrapQtApp $out/bin/ign";
  cmakeFlags = [
    "-DCMAKE_INSTALL_LIBDIR='lib'"
  ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/tools";
    description = "Command line tools for the Gazebo libraries.";
    license = licenses.asl20;
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.all;
  };
}
