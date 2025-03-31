# { callPackage, ignition, gz-cmake_3, gz-math_7, gz-utils_2, ... }@args:
{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "5";
    version = "5.6.0";
    srcHash = "sha256-vM+/V2F+Nr/LReqcMAmAbgAyaph/vMZVb0BO0MAUp6I=";
    ignition-math = ignition.math7;
    ignition-utils = ignition.utils2;
    ignition-cmake = ignition.cmake3;
  }
  // args)
