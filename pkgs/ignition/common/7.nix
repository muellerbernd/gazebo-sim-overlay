# { callPackage, ignition, gz-cmake_3, gz-math_7, gz-utils_2, ... }@args:
{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "7";
    version = "7.1.1";
    srcHash = "sha256:1jsr2xv7p0qm08bpdk5ssg4xifmmvx55ypxl1py5zg7vyn1bdq6k";
    ignition-math = ignition.math9;
    ignition-utils = ignition.utils4;
    ignition-cmake = ignition.cmake5;
  }
  // args
)
