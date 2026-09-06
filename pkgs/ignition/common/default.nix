{
  fetchFromGitHub,
  stdenv,
  lib,
  cmake,
  pkg-config,
  ignition,
  ignition-cmake,
  ignition-math,
  ignition-utils,
  libuuid,
  tinyxml-2,

  freeimage ? null,
  gts,
  ffmpeg,
  majorVersion ? "4",
  version ? "4.6.2",
  srcHash ? "sha256-VyvpTeCCwX2WBJdVd6lZrN7QomdOQnxGZFXXnT3ct0s=",
  assimp,
  gdal,
  ...
}:
stdenv.mkDerivation rec {
  pname =
    if (lib.versionAtLeast version "5") then
      "gz-common${majorVersion}"
    else
      "ignition-common${majorVersion}";
  inherit version;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-common";
    rev = "${pname}_${version}";
    hash = srcHash;
  };


  postInstall = lib.optionalString (lib.versionAtLeast version "5") ''
    mkdir -p $out/include/gz/common
    if [ -d $out/include/gz/common${majorVersion}/gz/common ]; then
      cp -r $out/include/gz/common${majorVersion}/gz/common/* $out/include/gz/common/
    fi
  '';

  nativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [
    cmake
    libuuid
    ignition-math
    tinyxml-2
    freeimage
    gts
    ffmpeg
    ignition-utils
    ignition-cmake
    assimp
    gdal
  ];
  propagatedNativeBuildInputs = [
    ignition-cmake
    assimp
  ];
  propagatedBuildInputs = [
    pkg-config
    libuuid
    ignition-math
    tinyxml-2
    freeimage
    gts
    ffmpeg
  ]
  ++ lib.optional (lib.versionAtLeast version "4") [ ignition-utils ]
  ++ lib.optional (lib.versionAtLeast version "5") [
    ignition-cmake
    ignition-math
    ignition-utils
    assimp
    gdal
  ];

  cmakeFlags = [
    "-DCMAKE_INSTALL_LIBDIR='lib'"
    "-DSKIP_graphics=OFF"
  ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/common";
    description = "Miscellaneous libraries for Ignition Robotics";
    license = licenses.asl20;
    maintainers = with maintainers; [ lopsided98 ];
    platforms = platforms.all;
  };
}
