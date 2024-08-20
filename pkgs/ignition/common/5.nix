# { callPackage, ignition, gz-cmake_3, gz-math_7, gz-utils_2, ... }@args:
{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "5";
    version = "5.4.2";
    srcHash = "sha256-vq7JMho7wSDkIRiptfwK5kT6wYLcaLIpfYBTFHQFJYk=";
    ignition-math = ignition.math;
    ignition-utils = ignition.utils;
    ignition-cmake = ignition.cmake;
  }
  // args)
