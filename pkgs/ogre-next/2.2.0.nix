{
  fetchFromGitHub,
  stdenv,
  lib,
  fetchpatch,
  cmake,
  libGLU,
  freetype,
  freeimage,
  zziplib,
  libXaw,
  ninja,
  tinyxml,
  rapidjson,
  openvr,
  cppunit,
  vulkan-headers,
  shaderc,
  SDL2,
  doxygen,
  mesa,
  graphviz,
  zlib,
  libXrandr,
}:
stdenv.mkDerivation rec {
  pname = "ogre-next";
  version = "2.2.0";

  src = fetchFromGitHub {
    owner = "OGRECave";
    repo = "ogre-next";
    rev = "v${version}";
    sha256 = "sha256-AcZKW/p/AdCfbokBKfMwuk+US3OAwWT5ldS6W6wYk5M=";
  };

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
    "-DOGRE_USE_NEW_PROJECT_NAME=ON"
    "-DOGRE_CONFIG_ENABLE_JSON=ON"
    "-DOGRE_CONFIG_THREADS=1"
    "-DOGRE_CONFIG_THREAD_PROVIDER=std"
    "-DOGRE_BUILD_COMPONENT_PLANAR_REFLECTIONS=ON"
    "-DOGRE_BUILD_COMPONENT_OVERLAY=ON"
    "-DOGRE_BUILD_COMPONENT_PROPERTY=ON"
    "-DOGRE_BUILD_COMPONENT_SCENE_FORMAT=ON"
    "-DOGRE_BUILD_COMPONENT_HLMS_UNLIT=ON"
    "-DOGRE_BUILD_TESTS=ON"
    "-DOGRE_INSTALL_SAMPLES_SOURCE=ON"
  ];

  nativeBuildInputs = [
    cmake
    doxygen
    graphviz
    mesa
    ninja
    cppunit
    vulkan-headers
    shaderc
  ];

  buildInputs = [
    freeimage
    freetype
    libXaw
    libXrandr
    rapidjson
    zziplib
    SDL2
    libGLU
    tinyxml
    zlib
    openvr
  ];

  postPatch = ''
    substituteInPlace OgreMain/src/OgrePlatformInformation.cpp \
      --replace '#include <sys/sysctl.h>' ""
  '';

  patches = [
    (
      fetchpatch
      {
        url = "https://github.com/OGRECave/ogre-next/pull/74.patch";
        hash = "sha256-jzpP2Az+Ex97Nt7rFfrm8N6Wi60pWgNXI7+VgvjTONI=";
      }
    )
  ];

  meta = with lib; {
    description = "3D Object-Oriented Graphics Rendering Engine
    aka ogre v2 - scene-oriented, flexible 3D C++ engine ";
    homepage = "https://ogrecave.github.io/ogre-next/api/latest";
    maintainers = with maintainers; [muellerbernd];
    platforms = platforms.linux;
    license = licenses.mit;
  };
}
