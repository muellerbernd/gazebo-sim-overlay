{ lib
, stdenv
, fetchFromGitHub
, fetchpatch
, cmake
, pkg-config
, majorVersion ? "2"
, version ? "2.0.0"
, srcHash ? "sha256-JHRa84uED+dqu0EHrVFTh6o7eiVpgPbTYqpv8vZtJM4="
, ignition-cmake
, ruby
, ronn
, wrapQtAppsHook
, wrapGAppsHook
, qtbase
, qtquickcontrols2
, ...
}:

stdenv.mkDerivation rec {
  pname = "gz-tools${majorVersion}";
  inherit version;

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-tools";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  nativeBuildInputs = [ cmake pkg-config ];
  # pkg-config is needed to use some CMake modules in this package
  # propagatedBuildInputs = [ pkg-config ];
  propagatedNativeBuildInputs = [ ignition-cmake ];
  buildInputs = [ ignition-cmake ruby ronn ];

  # dontWrapQtApps = true;

  # makeWrapperArgs = [
  #   "\${qtWrapperArgs[@]}"
  #   # import Qt.labs.platform failed without this
  #   "--prefix QML2_IMPORT_PATH : ${qtquickcontrols2.bin}/${qtbase.qtQmlPrefix}"
  #   "--prefix QT_QPA_PLATFORM_PLUGIN_PATH=${qtbase.bin}/lib/qt-${qtbase.version}/plugins/platforms"
  # ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/tools";
    description = "Command line tools for the Gazebo libraries.";
    license = licenses.asl20;
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.all;
  };
}
