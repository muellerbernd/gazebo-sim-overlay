{ lib
, stdenv
, fetchFromGitHub
, fetchpatch
, cmake
, pkg-config
, majorVersion ? "8"
, version ? "8.0.0"
, srcHash ? "sha256-JHRa84uED+dqu0EHrVFTh6o7eiVpgPbTYqpv8vZtJM4="
, ignition-plugin
, ignition-common
, ignition-math
, ignition-cmake
, protobuf
, tinyxml-2
, ignition-transport
, ignition-rendering
, ignition-msgs
, ignition-tools
, eigen
, qtbase
, qtquickcontrols2
, qwt
, wrapQtAppsHook
, xorg
, ...
}:

stdenv.mkDerivation rec {
  pname = "gz-gui${majorVersion}";
  inherit version;

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-gui";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  nativeBuildInputs = [ cmake wrapQtAppsHook pkg-config ];
  # pkg-config is needed to use some CMake modules in this package
  # propagatedBuildInputs = [ pkg-config ];
  propagatedNativeBuildInputs = [
    ignition-cmake
    # ignition-math
    # ignition-common
    # ignition-plugin
    # ignition-transport
    # ignition-rendering
    # ignition-msgs
    ignition-tools
  ];
  buildInputs = [
    eigen
    qtbase
    qtquickcontrols2
    qwt
    protobuf
    tinyxml-2
    ignition-math
    ignition-common
    ignition-plugin
    ignition-transport
    ignition-rendering
    ignition-msgs
    ignition-tools
  ];

  patches = [ ./gz-gui.patch ./cmd.patch ];

  # QT_QPA_PLATFORM_PLUGIN_PATH="${qtbase.bin}/lib/qt-${qtbase.version}/plugins";
  qtWrapperArgs = [ "--set QT_QPA_PLATFORM xcb" ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/gui";
    description = ''
      Builds on top of Qt to provide widgets which are useful when developing
      robotics applications, such as a 3D view, plots, dashboard, etc, and can be used
      together in a convenient unified interface.'';
    license = licenses.asl20;
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.all;
  };
}
