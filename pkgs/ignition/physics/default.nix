{ lib, stdenv, fetchFromGitHub, fetchpatch, cmake, pkg-config
, majorVersion ? "7", version ? "7.0.0"
, srcHash ? "sha256-JHRa84uED+dqu0EHrVFTh6o7eiVpgPbTYqpv8vZtJM4="
, ignition-cmake, ignition-utils, ignition-plugin, ignition-common, ... }:

stdenv.mkDerivation rec {
  pname = "gz-physics${majorVersion}";
  inherit version;

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-physics";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  nativeBuildInputs = [ cmake ];
  # pkg-config is needed to use some CMake modules in this package
  propagatedBuildInputs = [ pkg-config ];
  buildInputs =
    [ ignition-cmake ignition-utils ignition-plugin ignition-common ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/cmake";
    description = ''
      Abstract physics interface designed to support simulation and rapid
      development of robot applications.'';
    license = licenses.asl20;
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.all;
  };
}
