{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,
  cmake,
  pkg-config,
  majorVersion ? "8",
  version ? "8.0.0",
  srcHash ? "sha256-JHRa84uED+dqu0EHrVFTh6o7eiVpgPbTYqpv8vZtJM4=",
  ignition-plugin,
  ignition-common,
  ignition-math,
  ignition-cmake,
  protobuf,
  tinyxml-2,
  ignition-transport,
  ignition-rendering,
  ignition-msgs,
  ignition-tools,
  eigen,
  qtbase,
  qtdeclarative,
  qtquickcontrols2 ? null,
  qt5compat ? null,
  qwt ? null,
  wrapQtAppsHook,
  patchelf,
  libxcb-cursor ? null,
  ...
}:
stdenv.mkDerivation rec {
  pname =
    if (lib.versionAtLeast version "8") then "gz-gui${majorVersion}" else "ignition-gui${majorVersion}";
  inherit version;

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-gui";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  nativeBuildInputs = [
    cmake
    pkg-config
    wrapQtAppsHook
    patchelf
  ];

  buildInputs = [ 
    cmake 
    qtbase
    qtdeclarative
  ] ++ lib.optional (qtquickcontrols2 != null) qtquickcontrols2
    ++ lib.optional (qt5compat != null) qt5compat
    ++ lib.optional (libxcb-cursor != null) libxcb-cursor;

  propagatedBuildInputs = [
    qtbase
    qtdeclarative
    ignition-tools
    pkg-config
    eigen
    protobuf
    tinyxml-2
    ignition-math
    ignition-common
    ignition-plugin
    ignition-transport
    ignition-rendering
    ignition-msgs
    ignition-tools
    ignition-cmake
  ] ++ lib.optional (qwt != null) qwt
    ++ lib.optional (qtquickcontrols2 != null) qtquickcontrols2
    ++ lib.optional (qt5compat != null) qt5compat
    ++ lib.optional (libxcb-cursor != null) libxcb-cursor;

  patches =
    lib.optional (majorVersion == "8") [
      (fetchpatch {
        url = "https://github.com/gazebosim/gz-gui/pull/677.patch";
        hash = "sha256-9nX3/Yyxp5WSE8VvY+TWcfPFNlS8pdbtex0mujqiilw=";
      })
    ]
    ++ lib.optional (majorVersion == "9") [
      (fetchpatch {
        url = "https://github.com/gazebosim/gz-gui/pull/677.patch";
        hash = "sha256-9nX3/Yyxp5WSE8VvY+TWcfPFNlS8pdbtex0mujqiilw=";
      })
    ];

  cmakeFlags = [
    "-DCMAKE_INSTALL_LIBDIR='lib'"
    "-DCMAKE_SKIP_BUILD_RPATH=ON"
  ];

  postConfigure = ''
    find . -name "flags.make" -exec sed -i 's/-Werror//g' {} +
  '';

  dontWrapQtApps = true;

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
