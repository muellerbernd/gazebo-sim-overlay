{ fetchFromGitHub
, stdenv
, lib
, cmake
, libGLU
, libGL
, freetype
, freeimage
, zziplib
, xorgproto
, libXrandr
, libXaw
, freeglut
, libXt
, libpng
, boost
, ois
, libX11
, libXmu
, libSM
, pkg-config
, libXxf86vm
, libICE
, libXrender
, withNvidiaCg ? false
, nvidia_cg_toolkit
, withSamples ? false
, ninja
, tinyxml
, rapidjson
, renderdoc
, openvr
, cppunit
, poco
, tbb
, vulkan-headers
, SDL2
, doxygen
, mesa
, graphviz
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

  # fix for ARM. sys/sysctl.h has moved in later glibcs, and
  # https://github.com/OGRECave/ogre-next/issues/132 suggests it isn't
  # needed anyway.
  # postPatch = ''
  #   substituteInPlace OgreMain/src/OgrePlatformInformation.cpp \
  #     --replace '#include <sys/sysctl.h>' ""
  # '';

  # cmakeFlags = [
  #   "-DOGRE_BUILD_SAMPLES=${toString withSamples}"
  # ]
  # ++ map (x: "-DOGRE_BUILD_PLUGIN_${x}=on")
  #   ([ "BSP" "OCTREE" "PCZ" "PFX" ] ++ lib.optional withNvidiaCg "CG")
  # ++ map (x: "-DOGRE_BUILD_RENDERSYSTEM_${x}=on") [ "GL" ];

  cmakeFlags = [
    "-CMAKE_COMPILE_WARNING_AS_ERROR=OFF"
    "-Bbuild"
    "-GNinja"
    "-DOGRE_USE_NEW_PROJECT_NAME=ON"
    "-DOGRE_CONFIG_ENABLE_JSON=ON"
    "-DOGRE_CONFIG_THREADS=1"
    "-DOGRE_CONFIG_THREAD_PROVIDER='std'"
    "-DOGRE_BUILD_COMPONENT_PLANAR_REFLECTIONS=ON"
    "-DOGRE_BUILD_COMPONENT_PROPERTY=ON"
    "-DOGRE_BUILD_COMPONENT_SCENE_FORMAT=ON"
    "-DOGRE_BUILD_COMPONENT_HLMS_UNLIT=ON"
    "-DOGRE_BUILD_TESTS=ON"
    "-DOGRE_INSTALL_SAMPLES_SOURCE=ON"
  ];

  nativeBuildInputs = [
    ninja
    cmake
    # pkg-config
  ];

  buildInputs = [
    tinyxml
    rapidjson
    renderdoc
    openvr
    cppunit
    poco
    tbb
    vulkan-headers
    mesa
    SDL2
    doxygen
    graphviz
    #
    libGLU
    libGL
    freetype
    freeimage
    zziplib
    libXaw
    boost
    libX11
    libXrender
  ];

  meta = with lib; {
    description = "3D Object-Oriented Graphics Rendering Engine";
    homepage = "https://www.ogre3d.org/";
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.linux;
    license = licenses.mit;
  };
}
