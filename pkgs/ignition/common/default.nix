{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,
  cmake,
  pkg-config,
  ignition,
  ignition-cmake,
  ignition-math,
  ignition-utils,
  libuuid,
  tinyxml-2,
  # freeimage,
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

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-common";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  patches =
    lib.optional (majorVersion == "4") [
      (fetchpatch {
        url = "https://github.com/gazebosim/gz-common/pull/521.patch";
        hash = "sha256-NlUyAfGugYuNYURY1NjgStNsJ+jrLuaHmJ8Gp9QBSmQ=";
      })
    ]
    ++ lib.optional (majorVersion == "3") [
      (fetchpatch {
        url = "https://github.com/gazebosim/gz-common/commit/1243852c4bd8525ffc760a620e7d97f94cc2375c.patch";
        hash = "sha256-Smk1EWcBB520kFmyrs+nka8Fj7asedhqagMDfq2liwY=";
      })
      (fetchpatch {
        url = "https://github.com/gazebosim/gz-common/commit/dedc51888e0af28267a87a2ce888aa4189efacf4.patch";
        hash = "sha256-p+EEHIYaxQ0aZ7wMyz/TuDWUQmHfIB4vOPwrUSsZ+DE=";
      })
    ];

  buildInputs = [ cmake ];
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [
    ignition-cmake
    assimp
  ];
  propagatedBuildInputs = [
    pkg-config
    libuuid
    ignition-math
    tinyxml-2
    gts
    # freeimage
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

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR='lib'" ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/common";
    description = "Miscellaneous libraries for Ignition Robotics";
    longDescription = ''
      Ignition Common, a component of Ignition Robotics, provides a set of
      libraries that cover many different use cases. An audio-visual library
      supports processing audio and video files, a graphics library can load a
      variety 3D mesh file formats into a generic in-memory representation, and
      the core library of Ignition Common contains functionality that spans
      Base64 encoding/decoding to thread pools.
    '';
    license = licenses.asl20;
    maintainers = with maintainers; [ lopsided98 ];
    platforms = platforms.all;
  };
}
