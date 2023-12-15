{ lib, stdenv, fetchFromGitHub, fetchpatch, cmake, pkg-config
, majorVersion ? "8", version ? "8.0.0"
, srcHash ? "sha256-JHRa84uED+dqu0EHrVFTh6o7eiVpgPbTYqpv8vZtJM4="
, ignition-plugin, ignition-common, ignition-math, ignition-cmake, protobuf
, tinyxml-2, ignition-transport, ignition-rendering, ignition-msgs
, ignition-tools, eigen, qtbase, qtquickcontrols2, qwt, wrapQtAppsHook, ... }:

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

  nativeBuildInputs = [ cmake wrapQtAppsHook ];
  # pkg-config is needed to use some CMake modules in this package
  propagatedBuildInputs = [ pkg-config ];
  propagatedNativeBuildInputs = [ ignition-cmake ];
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

  patches = [ ./gz-gui.patch ];

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
