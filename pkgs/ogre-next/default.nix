{
  fetchFromGitHub,
  stdenv,
  lib,
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
  vulkan-loader,
  shaderc,
  SDL2,
  doxygen,
  mesa,
  graphviz,
  zlib,
  libXrandr,
  pkg-config,
  libxcb,
  libGL,
  xorg,
  libxkbcommon,
  wayland,
  libglvnd,
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

  patches = [ ./fix_gcc15.patch ];

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
    "-DOGRE_USE_NEW_PROJECT_NAME=ON"
    "-DOGRE_CONFIG_ENABLE_JSON=ON"
    "-DOGRE_CONFIG_THREADS=0"
    "-DOGRE_CONFIG_THREAD_PROVIDER=std"
    "-DOGRE_BUILD_COMPONENT_PLANAR_REFLECTIONS=ON"
    "-DOGRE_BUILD_COMPONENT_OVERLAY=ON"
    "-DOGRE_BUILD_COMPONENT_PROPERTY=ON"
    "-DOGRE_BUILD_COMPONENT_SCENE_FORMAT=ON"
    "-DOGRE_BUILD_COMPONENT_HLMS_UNLIT=ON"
    "-DOGRE_BUILD_TESTS=OFF"
    "-DOGRE_INSTALL_SAMPLES_SOURCE=OFF"
    "-DOGRE_BUILD_RENDERSYSTEM_GL3PLUS=ON"
    "-DOGRE_BUILD_RENDERSYSTEM_GLES2=OFF"
    "-DOGRE_BUILD_RENDERSYSTEM_VULKAN=ON"
    "-DOGRE_CONFIG_UNIX_NO_X11=OFF"
    "-DOGRE_GLSUPPORT_USE_EGL=ON"
    "-DOGRE_GLSUPPORT_USE_EGL_HEADLESS=OFF"
    "-DOGRE_GLSUPPORT_USE_GLX=ON"
    "-DOGRE_CONFIG_ENABLE_WAYLAND=ON"
    "-DVulkan_INCLUDE_DIR=${vulkan-headers}/include"
    "-DVulkan_LIBRARY=${vulkan-loader}/lib/libvulkan.so"
  ];

  NIX_CFLAGS_COMPILE = [
    "-Wno-error"
    "-Wno-deprecated-copy"
    "-Wno-implicit-fallthrough"
    "-Wno-class-memaccess"
    "-Wno-int-in-bool-context"
    "-Wno-unused-result"
    "-Wno-array-bounds"
    "-Wno-shadow"
    "-Wno-maybe-uninitialized"
  ];

  nativeBuildInputs = [
    cmake
    ninja
    pkg-config
  ];

  buildInputs = [
    freeimage
    freetype
    zziplib
    SDL2
    libglvnd
    tinyxml
    zlib
    openvr
    libxkbcommon
    wayland
    mesa
    rapidjson
    vulkan-headers
    vulkan-loader
    shaderc
    xorg.libX11
    xorg.libXext
    xorg.libXt
    xorg.libXaw
    libXrandr
    libxcb
  ];
  
  postInstall = ''
    # Ogre-Next 2.3 failure to install critical platform headers
    mkdir -p $out/include/OGRE-Next/GLX
    cp ../OgreMain/include/GLX/*.h $out/include/OGRE-Next/GLX/
  '';

  propagatedBuildInputs = [
    libglvnd
    mesa
    wayland
    vulkan-loader
  ];

  meta = with lib; {
    description = "3D Object-Oriented Graphics Rendering Engine (Vulkan/EGL/GLX)";
    homepage = "https://ogrecave.github.io/ogre-next/api/latest";
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.linux;
    license = licenses.mit;
  };
}
