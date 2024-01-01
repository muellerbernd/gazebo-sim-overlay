{ lib
, fetchurl
, stdenv
, cmake
, pkg-config
, ronn
, libGL
, openal
, hdf5
, curl
, tinyxml
, tinyxml-2
, libtar
, gts
, libusb1
, qtbase
, gdal
, libuuid
, graphviz
, qwt
, qtquickcontrols2
, freeimage
, boost
, protobuf
, tbb
, ogre
, ffmpeg
, ignition
, ignition-cmake ? ignition.cmake
, ignition-common ? ignition.common
, ignition-math ? ignition.math
, ignition-transport ? ignition.transport
, ignition-msgs ? ignition.msgs
, ignition-fuel-tools ? ignition.fuel-tools
, ignition-plugin ? ignition.plugin
, ignition-physics ? ignition.physics
, ignition-rendering ? ignition.rendering
, ignition-gui ? ignition.gui
, ignition-sensors ? ignition.sensors
, ignition-tools ? ignition.tools
, sdformat
, wrapQtAppsHook
, full
, bullet
, eigen
, python311Packages
, withBulletEngineSupport ? false
}:

stdenv.mkDerivation rec {
  pname = "gazebo-sim";
  version = "gz-sim8_8.0.0";

  src = fetchurl {
    url =
      "https://github.com/gazebosim/gz-sim/archive/refs/tags/${version}.tar.gz";
    hash = "sha256-ximKnQO5puW63Rp4o7F4IB6e+sIgm7wv5aa2u7qFElw=";
  };

  enableParallelBuilding = true;

  # cmakeFlags = [ "-DUSE_HOST_CFLAGS=False" ];
  cmakeFlags = ["-DQT_QML_DEBUG=True"];

  nativeBuildInputs = [ cmake pkg-config ronn ];

  buildInputs = [
    libGL
    openal
    hdf5
    curl
    tinyxml
    tinyxml-2
    libtar
    gts
    libusb1
    gdal
    libuuid
    graphviz
    ignition-cmake
    ignition-common
    ignition-plugin
    ignition-physics
    ignition-rendering
    ignition-gui
    ignition-sensors
    sdformat
    ignition-math
    ignition-transport
    ignition-msgs
    ignition-fuel-tools
    ignition-physics
    ignition-tools
    qwt
    qtbase
    full
    qtquickcontrols2
    eigen
    python311Packages.pybind11
  ] ++ lib.optional withBulletEngineSupport bullet;

  propagatedBuildInputs = [
    freeimage
    boost
    protobuf
    tbb
    ogre
    ffmpeg
    ignition-fuel-tools
    ignition-physics
    sdformat
  ];

  patches = [ ./cmd.patch ];

  dontWrapQtApps = true;

  meta = with lib; {
    homepage = "http://gazebosim.org/";
    description = "Multi-robot simulator for outdoor environments";
    license = licenses.asl20;
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.all;
  };
}
