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
  ogre-next,
  ogre1_9,
  ogre,
  eigen,
  freeimage ? null,
  libGL,
  libGLU,
  xorg,
  boost,
  libglvnd,
  vulkan-headers,
  vulkan-loader,
  ...
}:
stdenv.mkDerivation rec {
  pname =
    if (lib.versionAtLeast version "8") then
      "gz-rendering${majorVersion}"
    else
      "ignition-rendering${majorVersion}";
  inherit version;

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-rendering";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  propagatedBuildInputs = lib.optional (freeimage != null) freeimage ++ [
    ignition-math
    ignition-plugin
    ignition-common
    ogre-next
    ogre1_9
    ogre
    eigen
    libGL
    libglvnd
    xorg.libX11
    xorg.libXext
    boost
    libGLU
    vulkan-headers
    vulkan-loader
  ];

  cmakeFlags = [
    "-DCMAKE_INSTALL_LIBDIR='lib'"
    "-DOGRE_GLSUPPORT_USE_EGL=ON"
    "-DUSE_GLX=ON"
  ];

  buildInputs = [ cmake ];

  patches = (lib.optional (majorVersion == "6") [ ./graphicsAPI.patch ])
    ++ (lib.optional (majorVersion == "10") [ ./headless_fix.patch ]);

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/rendering";
    description = "C++ library designed to provide an abstraction for different rendering engines.";
    license = licenses.asl20;
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.all;
  };
}
