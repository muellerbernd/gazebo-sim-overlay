{ lib
, mkDerivation
, fetchurl
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
, libsForQt5
, freeimage
, boost
, protobuf
, sdformat_9
, tbb
, ogre1_9
, ffmpeg_5
, ignition
, ignition-cmake ? ignition.cmake2
, ignition-common ? ignition.common3
, ignition-math ? ignition.math6
, ignition-transport ? ignition.transport8
, ignition-msgs ? ignition.msgs5
, ignition-fuel-tools ? ignition.fuel-tools4
, bullet
, withBulletEngineSupport ? false
}:

mkDerivation rec {
  pname = "libdart";
  version = "6.13.1";

  src = fetchurl {
    url = "https://github.com/dartsim/${pname}/archive/v${version}.tar.gz";
    hash = "sha256-fphCwEbJ4HVTVbJ0wkCoq79Olivnznt/WRlOX0tYT0U=";
  };

  nativeBuildInputs = [ cmake pkg-config];

  # buildInputs = [
  #   libGL
  #   openal
  #   hdf5
  #   curl
  #   tinyxml
  #   tinyxml-2
  #   libtar
  #   gts
  #   libusb1
  #   qtbase
  #   gdal
  #   libuuid
  #   graphviz
  #   ignition-cmake
  #   ignition-common
  #   ignition-msgs
  #   libsForQt5.qwt
  # ] ++ lib.optional withBulletEngineSupport bullet;

  # propagatedBuildInputs = [
  #   freeimage
  #   boost
  #   protobuf
  #   sdformat_9
  #   tbb
  #   ogre1_9
  #   ffmpeg_5
  #   ignition-math
  #   ignition-transport
  #   ignition-msgs
  #   ignition-fuel-tools
  # ];

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
    homepage = "https://dartsim.github.io";
    description = "Dynamic Animation and Robotics Toolkit";
    license = licenses.asl20;
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.all;
  };
}
