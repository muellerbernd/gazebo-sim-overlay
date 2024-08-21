{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "1";
    version = "1.4.0";
    srcHash = "";
    ignition-cmake = ignition.cmake2;
    ignition-utils = ignition.utils1;
  }
  // args)
