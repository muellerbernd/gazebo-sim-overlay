# { callPackage, ignition, gz-cmake_3, gz-math_7, gz-utils_2, ... }@args:
{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "6";
    version = "6.0.1";
    srcHash = "sha256-gVyqzyvdGxXKRm0mpiR1nIYvceWwUDMmp85bHTEpZOE=";
    ignition-math = ignition.math8;
    ignition-utils = ignition.utils3;
    ignition-cmake = ignition.cmake4;
  }
  // args
)
