{ fetchFromGitHub
, stdenv
, lib
, cmake
, libGLU
, libGL
, freetype
, freeimage
, zziplib
, libXaw
, boost
, libX11
, pkg-config
, libXrender
, ninja
, tinyxml
, rapidjson
, renderdoc
, openvr
, cppunit
, poco
, tbb
, vulkan-loader
, vulkan-headers
, shaderc
, SDL2
, doxygen
, mesa
, graphviz
, glslang
, libglvnd
, libXrandr
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

  cmakeFlags = [
    # "-Bbuild"
    # "-GNinja"
    # "-DOGRE_USE_NEW_PROJECT_NAME=ON"
    # "-DOGRE_CONFIG_ENABLE_JSON=ON"
    # "-DOGRE_CONFIG_THREADS=1"
    # "-DOGRE_CONFIG_THREAD_PROVIDER='std'"
    # "-DOGRE_BUILD_COMPONENT_PLANAR_REFLECTIONS=ON"
    # "-DOGRE_BUILD_COMPONENT_PROPERTY=ON"
    # "-DOGRE_BUILD_COMPONENT_SCENE_FORMAT=ON"
    # "-DOGRE_BUILD_COMPONENT_HLMS_UNLIT=ON"
    # "-DOGRE_BUILD_TESTS=ON"
    # "-DOGRE_INSTALL_SAMPLES_SOURCE=ON"
  ];

  nativeBuildInputs = [
    cmake
    doxygen
    glslang
    graphviz
    mesa
    ninja
    cppunit
    vulkan-headers
    shaderc
  ];

  buildInputs = [
    libX11
    libXrandr
    ninja
    tinyxml
    rapidjson
    renderdoc
    openvr
    cppunit
    poco
    tbb
    vulkan-headers
    vulkan-loader
    shaderc
    mesa
    SDL2
    doxygen
    graphviz
    #
    libGLU
    libGL
    libglvnd
    freetype
    freeimage
    zziplib
    libXaw
    boost
    libX11
    libXrender
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
