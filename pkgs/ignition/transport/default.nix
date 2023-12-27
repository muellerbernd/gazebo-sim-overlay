{ lib, stdenv, fetchFromGitHub, fetchpatch, cmake, ignition
, ignition-cmake ? ignition.cmake, ignition-math ? ignition.math
, ignition-msgs ? ignition.msgs, ignition-utils ? ignition.utils, protobuf
, libuuid, sqlite, libsodium, cppzmq, zeromq, majorVersion ? "11"
, version ? "11.4.1"
, srcHash ? "sha256-wQ/ugKYopWgSaa6tqPrp8oQexPpnA6fa28L383OGNXM=", python3, ...
}:

stdenv.mkDerivation rec {
  pname = if (majorVersion < "13") then
    "ignition-transport${majorVersion}"
  else
    "gz-transport${majorVersion}";
  inherit version;

  src = fetchFromGitHub rec {
    name = "${rev}-source";
    owner = "gazebosim";
    repo = "gz-transport";
    rev = "${pname}_${version}";
    hash = srcHash;
  };

  patches =
    # Fix compatibility with protobuf 22
    lib.optional (majorVersion == "8") (fetchpatch {
      url =
        "https://github.com/gazebosim/gz-transport/commit/3d68f46329ec6e4efe20c5125caceae83d4f8e45.patch";
      hash = "sha256-23qSKsMSVL4sXFQrTggyUmxBJm/6RsKsB5EI09GRNKQ=";
    });

  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ignition-cmake ];
  buildInputs = [ ignition-math sqlite libsodium ignition-utils ]
    ++ lib.optional (lib.versionAtLeast version "13") [ python3 ];
  propagatedBuildInputs = [ protobuf cppzmq zeromq libuuid ignition-msgs ];

  # postInstall = ''
  #   mkdir ~/.gz/tools/configs -p
  #   cd ~/.gz/tools/configs/
  #   ln -s $out/share/gz/*.yaml .
  # '';
  postInstall = ''
    export GZ_CONFIG_PATH=$out/share/gz:$GZ_CONFIG_PATH
  '';

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/transport";
    description =
      "Provides fast and efficient asyncronous message passing, services, and data logging.";
    license = licenses.asl20;
    maintainers = with maintainers; [ lopsided98 ];
    platforms = platforms.all;
  };
}
