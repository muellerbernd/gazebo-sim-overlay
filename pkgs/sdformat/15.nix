{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./generic.nix (args
  // {
    version = "15.2.0";
    srcHash = "sha256-ckLFg0msHxYHciprbyW2ktN/D+m0w/Lhl9tPqQwJbXY=";
    gz-cmake = ignition.cmake4;
    gz-math = ignition.math8;
    gz-utils = ignition.utils3;
  })
