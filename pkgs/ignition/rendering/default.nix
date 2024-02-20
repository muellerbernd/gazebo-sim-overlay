{ lib
, stdenv
, fetchFromGitHub
, cmake
, pkg-config
, majorVersion ? "8"
, version ? "8.0.0"
, srcHash ? "sha256-JHRa84uED+dqu0EHrVFTh6o7eiVpgPbTYqpv8vZtJM4="
, ignition-plugin
, ignition-common
, ignition-math
, ogre-next
, ogre
, eigen
, freeimage
, libGL
, libGLU
, xorg
, boost
, ...
}:

stdenv.mkDerivation rec {
  pname = "gz-rendering${majorVersion}";
  inherit version;

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-rendering";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  nativeBuildInputs = [ cmake pkg-config ];
  # pkg-config is needed to use some CMake modules in this package
  propagatedBuildInputs = [ pkg-config ];
  # propagatedNativeBuildInputs = [
  # ];
  buildInputs = [
    ignition-math
    ignition-plugin
    ignition-common
    # ogre-next
    ogre
    eigen
    freeimage
    libGL
    xorg.libX11
    boost
    libGLU
  ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/rendering";
    description = ''
            C++ library designed to provide an abstraction for different rendering
      engines. It offers unified APIs for creating 3D graphics applications.'';
    license = licenses.asl20;
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.all;
  };
}
