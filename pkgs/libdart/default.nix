{ lib
, stdenv
, fetchurl
, cmake
, pkg-config
, eigen
, fmt
, libccd
, fcl
, assimp
}:

stdenv.mkDerivation rec {
  pname = "libdart";
  version = "6.13.1";

  src = fetchurl {
    url = "https://github.com/dartsim/dart/archive/v${version}.tar.gz";
    hash = "sha256-03krYbwqeuZoK22H4JtdReMlywjFUDigHlgojdw9WNg=";
  };

  nativeBuildInputs = [ cmake pkg-config ];

  buildInputs = [
    eigen
    fmt
    assimp
  ];

  propagatedBuildInputs = [
    libccd
    fcl
  ];

  patches = [ ./fix_cmake.patch ];
  cmakeFlags = [
    "-DDART_TREAT_WARNINGS_AS_ERRORS='off'"
  ];

  meta = with lib; {
    homepage = "https://dartsim.github.io";
    description = "Dynamic Animation and Robotics Toolkit";
    license = licenses.asl20;
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.all;
  };
}
