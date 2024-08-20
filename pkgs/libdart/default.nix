{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  pkg-config,
  eigen,
  fmt,
  libccd,
  fcl,
  assimp,
  libGLU,
  ipopt,
  nlopt,
  pagmo2,
  ode,
  bullet,
  flann,
  tinyxml-2,
  lapack,
  doxygen,
  urdfdom,
  urdfdom-headers,
  freeglut,
  openscenegraph,
  blas,
  boost,
}:
stdenv.mkDerivation rec {
  pname = "libdart";
  version = "6.13.2";

  src = fetchFromGitHub {
    owner = "dartsim";
    repo = "dart";
    rev = "v${version}";
    sha256 = "sha256-AfKPqUiW6BsM98TIzTY2ZcFP1WvURs8/dGOzanIiB9g=";
  };

  # nativeBuildInputs = [cmake doxygen pkg-config];
  nativeBuildInputs = [cmake doxygen pkg-config];

  buildInputs = [
    eigen
    fmt
    assimp
    libGLU
    ipopt
    nlopt
    libccd
    fcl
    pagmo2
    ode
    bullet
    flann
    tinyxml-2
    lapack
    urdfdom
    urdfdom-headers
    freeglut
    openscenegraph
    blas
    boost
  ];

  propagatedBuildInputs = [
    libccd
    fcl
    fmt
    ode
    urdfdom
    urdfdom-headers
  ];

  # postPatchPhase = ''
  #   sed -i '9s/7/9/' cmake/DARTFindpagmo.cmake
  # '';
  #
  patches = [
    #   ./gnu13.patch
    ./fix_cmake.patch
  ];

  cmakeFlags = [
    "-DDART_TREAT_WARNINGS_AS_ERRORS='off'"
    "-DCMAKE_INSTALL_LIBDIR='lib'"
  ];

  meta = with lib; {
    homepage = "https://dartsim.github.io";
    description = "Dynamic Animation and Robotics Toolkit";
    license = licenses.asl20;
    maintainers = with maintainers; [muellerbernd];
    platforms = platforms.all;
  };
}
