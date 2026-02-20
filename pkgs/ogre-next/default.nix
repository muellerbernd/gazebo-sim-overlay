{
  fetchFromGitHub,
  fetchpatch,
  stdenv,
  lib,
  cmake,
  libGLU,
  freetype,
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
  libxcb,
}:
stdenv.mkDerivation rec {
  pname = "ogre-next";
  version = "2.3.3";

  src = fetchFromGitHub {
    owner = "OGRECave";
    repo = "ogre-next";
    rev = "v${version}";
    sha256 = "sha256-elSj35LwsLzj1ssDPsk9NW/KSXfiOGYmw9hQSAWdpFM=";
  };
  patches = [
    (fetchpatch {
      url = "https://github.com/wentasah/ogre-next/commit/d56e58a8d6db56bf7095f722169cf1a2e4ea9c9c.patch?full_index=1";
      hash = "sha256-e3UJGM8O29Y6xCzhbfLMeQYL8fqD8ohzsuTHyvHC9vo=";
    })
  ];

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
    "-DOGRE_CONFIG_ENABLE_STBI=ON"
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
    libxcb
  ];

  meta = with lib; {
    description = "3D Object-Oriented Graphics Rendering Engine
    aka ogre v2 - scene-oriented, flexible 3D C++ engine ";
    homepage = "https://ogrecave.github.io/ogre-next/api/latest";
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.linux;
    license = licenses.mit;
  };
}

