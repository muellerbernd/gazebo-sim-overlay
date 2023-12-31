{ lib
, mkDerivation
, ignition
, ignition-cmake ? ignition.cmake
, ignition-common ? ignition.common
, ignition-math ? ignition.math
, ignition-transport ? ignition.transport
, ignition-msgs ? ignition.msgs
, ignition-fuel-tools ? ignition.fuel-tools
, ignition-gazebo
}:

mkDerivation {
  pname = "gazebo-new";

  buildInputs = [
    ignition-cmake
    ignition-common
    ignition-msgs

    ignition-math
    ignition-transport
    ignition-fuel-tools
    ignition-gazebo
  ];

  meta = with lib; {
    homepage = "http://gazebosim.org/";
    description = "wrapper for all gz tools";
    license = licenses.asl20;
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.all;
  };
}
