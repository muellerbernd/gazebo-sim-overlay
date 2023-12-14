{ pkgs, lib, fetchurl, stdenv, cmake, git, pkg-config, ronn, libGL, openal, hdf5
, curl, tinyxml, tinyxml-2, libtar, gts, libusb1, qtbase, gdal, libuuid
, graphviz, qwt, qtquickcontrols2, freeimage, boost, protobuf, tbb, ogre1_9
, ffmpeg, ignition, ignition-cmake ? ignition.cmake
, ignition-common ? ignition.common, ignition-math ? ignition.math
, ignition-transport ? ignition.transport, ignition-msgs ? ignition.msgs
, ignition-fuel-tools ? ignition.fuel-tools, ignition-plugin ? ignition.plugin
, ignition-physics ? ignition.physics, ignition-rendering ? ignition.rendering
, ignition-gui ? ignition.gui, ignition-sensors ? ignition.sensors
, wrapQtAppsHook, sdformat, bullet, eigen, withBulletEngineSupport ? false }:

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

  nativeBuildInputs = [ cmake pkg-config ronn wrapQtAppsHook ];

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
    qtbase
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
    qwt
    qtbase
    qtquickcontrols2
    eigen
  ] ++ lib.optional withBulletEngineSupport bullet;

  propagatedBuildInputs = [
    freeimage
    boost
    protobuf
    tbb
    ogre1_9
    sdformat
    ffmpeg
    ignition-math
    ignition-transport
    ignition-msgs
    ignition-fuel-tools
    ignition-physics
  ];

  # qtWrapperArgs = [
  #   # Let the gazebo binary see neighboring binaries.
  #   # It attempts to run gzclient from PATH.
  #   "--prefix PATH : ${placeholder "out"}/bin"
  #
  #   # Prevent Gazebo from attempting to use Wayland.
  #   # As is the case with RViz2, OGRE does not yet support it.
  #   "--set WAYLAND_DISPLAY dummy" # "dummy" is arbitrary - it just doesn't exist.
  # ];

  meta = with lib; {
    homepage = "http://gazebosim.org/";
    description = "Multi-robot simulator for outdoor environments";
    license = licenses.asl20;
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.all;
  };
}
