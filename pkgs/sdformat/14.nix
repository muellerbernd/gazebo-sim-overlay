{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./generic.nix (args
  // {
    version = "14.0.0";
    srcHash = "sha256-iMCFiiPvSk82qbMWLktDiHiuhnBgivc9F5fWejqqQkY=";
    gz-cmake = ignition.cmake;
    gz-math = ignition.math;
    gz-utils = ignition.utils;
  })
