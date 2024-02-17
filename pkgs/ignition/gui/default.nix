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
, qtdeclarative
, qwt
, qt5Full
, qttools
, wrapQtAppsHook
, wrapGAppsHook
, fontconfig
, autoPatchelfHook
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
  # src = builtins.fetchGit "/home/bernd/git/gz-gui";

  nativeBuildInputs = [
    cmake
    wrapQtAppsHook
    pkg-config
    wrapGAppsHook
    qtbase
    autoPatchelfHook
  ];
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
  propagatedBuildInputs = [
    qtbase
    qtquickcontrols2
    qtdeclarative
  ];
  buildInputs = [
    eigen
    # qtquickcontrols
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

  qtWrapperArgs = [ ''--set LD_LIBRARY_PATH : ${lib.makeLibraryPath [ qt5Full ]}'' ];

  # dontWrapQtApps = true;
  #
  # makeWrapperArgs =
  #   let
  #     listToQtVar = suffix: lib.makeSearchPathOutput "bin" suffix;
  #   in
  #   [
  #     "\${qtWrapperArgs[@]}"
  #     # import Qt.labs.platform failed without this
  #     "--prefix QML2_IMPORT_PATH : ${qtquickcontrols2.bin}/${qtbase.qtQmlPrefix}"
  #     "QT_PLUGIN_PATH=${listToQtVar qtbase.qtPluginPrefix [ qtbase ]}"
  #   ];

  # doCheck = false;
  # preCheck =
  #   let
  #     listToQtVar = suffix: lib.makeSearchPathOutput "bin" suffix;
  #   in
  #   ''
  #     export QT_PLUGIN_PATH=${listToQtVar qtbase.qtPluginPrefix [ qtbase ]}
  #     export QML2_IMPORT_PATH=${listToQtVar qtbase.qtQmlPrefix ([ qtdeclarative ] )}
  #     export XDG_RUNTIME_DIR=$PWD
  #   '';


  # makeWrapperArgs = [
  #   "\${qtWrapperArgs[@]}"
  #   # import Qt.labs.platform failed without this
  #   "--prefix QML2_IMPORT_PATH : ${qtquickcontrols2.bin}/${qtbase.qtQmlPrefix}"
  # ];

  # preCheck =
  #   /* bash */ ''
  #   export QT_QPA_PLATFORM_PLUGIN_PATH=${qt5Full.bin}/lib/qt-${qt5Full.version}/plugins/platforms
  #   export XDG_RUNTIME_DIR=$(mktemp -d)
  #   # export QT_PLUGIN_PATH="${qtbase.bin}/${qtbase.qtPluginPrefix}"
  #   export QT_QPA_PLATFORM=offscreen
  # '';
  # nativeCheckInputs = [ fontconfig ];
  # Env = [
  #   "FONTCONFIG_FILE=${fontconfig.out}/etc/fonts/fonts.conf"
  #   "FONTCONFIG_PATH=${fontconfig.out}/etc/fonts/"
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
