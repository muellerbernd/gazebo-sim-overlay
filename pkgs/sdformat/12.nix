{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./generic.nix (args
  // {
    version = "12.0.0";
    srcHash = "";
    gz-cmake = ignition.cmake;
    gz-math = ignition.math;
    gz-utils = ignition.utils;
  })
