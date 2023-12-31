{ lib
, stdenv
, fetchFromGitHub
, cmake
, pkg-config
, majorVersion ? "7"
, version ? "7.0.0"
, srcHash ? "sha256-6UawCCH/Zc41yUbbPEz1qIF+cV6XMOTN4+FJO/0uTds="
, ignition-math
, ignition-cmake
, ignition-utils
, ignition-plugin
, ignition-common
, ignition-transport
, ignition-msgs
, ignition-gui
, ignition-rendering
, gazebo_sim
, libwebsockets
, libsForQt5
, qtbase ? libsForQt5.qt5.qtbase
, qtquickcontrols2 ? libsForQt5.qt5.qtquickcontrols2
, qwt ? libsForQt5.qwt
, wrapQtAppsHook ? libsForQt5.wrapQtAppsHook
, ...
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

  nativeBuildInputs = [ cmake wrapQtAppsHook ];
  # pkg-config is needed to use some CMake modules in this package
  propagatedBuildInputs = [ pkg-config ];
  # propagatedNativeBuildInputs = [ ignition-cmake ignition-common ];
  buildInputs = [
    ignition-math
    ignition-cmake
    ignition-common
    ignition-utils
    ignition-plugin
    ignition-transport
    ignition-msgs
    ignition-gui
    ignition-rendering
    gazebo_sim
    libwebsockets
    qtbase
    qtquickcontrols2
    qwt
  ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/launch";
    description = ''
      Gazebo Launch : Run and manage programs and plugins'';
    license = licenses.asl20;
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.all;
  };
}
