{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  pkg-config,
  majorVersion ? "7",
  version ? "7.0.0",
  srcHash ? "sha256-6UawCCH/Zc41yUbbPEz1qIF+cV6XMOTN4+FJO/0uTds=",
  ignition-math,
  ignition-cmake,
  ignition-utils,
  ignition-plugin,
  ignition-common,
  ignition-transport,
  ignition-msgs,
  ignition-gui,
  ignition-rendering,
  ignition-sim,
  ignition-fuel-tools,
  ignition-physics,
  ignition-sensors,
  sdformat,
  libwebsockets,
  qtbase,
  qtquickcontrols2,
  qwt,
  wrapQtAppsHook,
  eigen,
  ...
}:
stdenv.mkDerivation rec {
  pname = "gz-launch${majorVersion}";
  inherit version;

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-launch";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  nativeBuildInputs = [
    cmake
    wrapQtAppsHook
    pkg-config
  ];
  # pkg-config is needed to use some CMake modules in this package
  # propagatedBuildInputs = [ pkg-config ];
  # propagatedNativeBuildInputs = [ ignition-cmake ignition-common ];
  propagatedBuildInputs = [
    eigen
    ignition-fuel-tools
    ignition-math
    ignition-cmake
    ignition-common
    ignition-utils
    ignition-plugin
    ignition-transport
    ignition-msgs
    ignition-gui
    ignition-rendering
    ignition-physics
    ignition-sim
    ignition-sensors
    libwebsockets
    sdformat
    qtbase
    qtquickcontrols2
    qwt
  ];
  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR='lib'" ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/launch";
    description = "Gazebo Launch : Run and manage programs and plugins";
    license = licenses.asl20;
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.all;
  };
}
