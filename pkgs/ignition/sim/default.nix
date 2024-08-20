{
  lib,
  fetchurl,
  fetchFromGitHub,
  stdenv,
  cmake,
  pkg-config,
  ronn,
  libGL,
  openal,
  hdf5,
  curl,
  tinyxml,
  tinyxml-2,
  libtar,
  gts,
  libusb1,
  qtbase,
  gdal,
  libuuid,
  graphviz,
  qwt,
  qtquickcontrols2,
  freeimage,
  boost,
  protobuf,
  tbb,
  ogre,
  ffmpeg,
  ignition,
  ignition-cmake ? ignition.cmake,
  ignition-common ? ignition.common,
  ignition-math ? ignition.math,
  ignition-transport ? ignition.transport,
  ignition-msgs ? ignition.msgs,
  ignition-fuel-tools ? ignition.fuel-tools,
  ignition-plugin ? ignition.plugin,
  ignition-physics ? ignition.physics,
  ignition-rendering ? ignition.rendering,
  ignition-gui ? ignition.gui,
  ignition-sensors ? ignition.sensors,
  ignition-tools ? ignition.tools,
  sdformat,
  wrapGAppsHook,
  full,
  bullet,
  eigen,
  python311Packages,
  withBulletEngineSupport ? false,
  majorVersion ? "8",
  version ? "8.0.0",
  srcHash ? "sha256-B8H5lnQKJx9lULMcBVCsuEOGDeRYBh/biiiBUW91wBk=",
  ...
}:
stdenv.mkDerivation rec {
  pname =
    if (majorVersion < "7")
    then "ignition-sim${majorVersion}"
    else "gz-sim${majorVersion}";
  inherit version;

  # src = fetchurl {
  #   url = "https://github.com/gazebosim/gz-sim/archive/refs/tags/${version}.tar.gz";
  #   hash = srcHash;
  # };

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-sim";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  enableParallelBuilding = true;

  nativeBuildInputs = [cmake pkg-config ronn wrapGAppsHook];

  buildInputs =
    [
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
    ]
    ++ lib.optional withBulletEngineSupport bullet;

  propagatedBuildInputs = [
    freeimage
    boost
    protobuf
    tbb
    ogre
    ffmpeg
    ignition-tools
    # ignition-fuel-tools
    # ignition-physics
    # sdformat
  ];

  # patches = [ ./cmd.patch ];

  dontWrapQtApps = true;
  cmakeFlags = [
    "-DCMAKE_INSTALL_LIBDIR='lib'"
  ];

  meta = with lib; {
    homepage = "http://gazebosim.org/";
    description = "Multi-robot simulator for outdoor environments";
    license = licenses.asl20;
    maintainers = with maintainers; [muellerbernd];
    platforms = platforms.all;
  };
}
