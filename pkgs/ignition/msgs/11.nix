{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "11";
    version = "11.0.2";
    srcHash = "sha256-PUhFOmVPRiOVWfOjAU8z8dcxKPdcoTrgRwDGXP/vsUs=";
    ignition-cmake = ignition.cmake4;
    ignition-math = ignition.math8;
    ignition-utils = ignition.utils3;
  }
  // args)
