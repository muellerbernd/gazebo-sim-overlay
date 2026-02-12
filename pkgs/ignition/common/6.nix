# { callPackage, ignition, gz-cmake_3, gz-math_7, gz-utils_2, ... }@args:
{ callPackage, ignition, ... }@args:
callPackage ./. (
  {
    majorVersion = "6";
    version = "6.3.0";
    srcHash = "sha256-9IsV8Mc6evJAO+5tXNdb0j3kmieR96e/OKLNXii3WKk=";
    ignition-math = ignition.math8;
    ignition-utils = ignition.utils3;
    ignition-cmake = ignition.cmake4;
  }
  // args
)
