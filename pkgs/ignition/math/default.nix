{ lib, stdenv, fetchFromGitHub, cmake, ignition, ignition-cmake ? ignition.cmake
, majorVersion ? "6", version ? "6.13.0"
, srcHash ? "sha256-4kWbHdsDCCEgXHy3Dv4oZKdVBY4eJLKovYu+HUgkSjE=", gz-cmake_3
, gz-math_7, gz-utils_2, ... }:

stdenv.mkDerivation rec {

  pname = if (majorVersion <= "6") then
    "ignition-math${majorVersion}"
  else
    "gz-math${majorVersion}";
  inherit version;

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-math";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ignition-cmake ]
    ++ lib.optional (lib.versionAtLeast version "7") [
      gz-cmake_3
      gz-math_7
      gz-utils_2
    ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/math";
    description = "Math classes and functions for robot applications";
    license = licenses.asl20;
    maintainers = with maintainers; [ lopsided98 ];
    platforms = platforms.all;
  };
}
