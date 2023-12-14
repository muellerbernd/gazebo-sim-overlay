{ lib, stdenv, fetchFromGitHub, fetchpatch, cmake, tinyxml-2, ignition
, ignition-cmake ? ignition.cmake, protobuf, ignition-math ? ignition.math
, majorVersion ? "10", version ? "10.0.0"
, srcHash ? "sha256-hG4UJfcq6DsyMqTWIcUQ15UCQNfdzTzwvJBpR9kmu84=", gz-cmake_3
, gz-math_7, gz-utils_2, python3, ... }:

stdenv.mkDerivation rec {
  pname = if (lib.versionAtLeast version "8") then
    "gz-msgs${majorVersion}"
  else
    "ignition-msgs${majorVersion}";
  inherit version;

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-msgs";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  # Don't require Protobuf 3
  patches = lib.optional (majorVersion == "8") [
    (fetchpatch {
      url =
        "https://github.com/gazebosim/gz-msgs/commit/0c0926c37042ac8f5aeb49ac36101acd3e084c6b.patch";
      hash = "sha256-QnR1WtB4gbgyJKbQ4doMhfSjJBksEeQ3Us4y9KqCWeY=";
    })
  ];

  nativeBuildInputs = [ cmake ]
    ++ lib.optional (lib.versionAtLeast version "8") [
      gz-cmake_3
      gz-math_7
      gz-utils_2
      python3
    ];
  propagatedNativeBuildInputs = [ ignition-cmake ];
  propagatedBuildInputs = [ protobuf ignition-math tinyxml-2 ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/msgs";
    description = "Protobuf messages and functions for robot applications.";
    license = licenses.asl20;
    maintainers = with maintainers; [ lopsided98 ];
    platforms = platforms.all;
  };
}
