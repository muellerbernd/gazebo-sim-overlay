{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "1";
    version = "1.4.0";
    srcHash = "sha256-i5kmsyE+n171oW0CG4x3NcZCJ999F6LdSI3Rx8oPCIo=";
    ignition-cmake = ignition.cmake2;
    ignition-utils = ignition.utils1;
  }
  // args)
