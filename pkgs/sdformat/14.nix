{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./generic.nix (args
  // {
    version = "14.4.0";
    srcHash = "sha256-U1K2BialJVBgrEDD+47UGJ4Ct6v1vdLuX1r3IO7h4Sk=";
    gz-cmake = ignition.cmake;
    gz-math = ignition.math;
    gz-utils = ignition.utils;
  })
