{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "11";
    version = "11.4.1";
    srcHash = "";
    ignition-msgs = ignition.msgs5;
    ignition-cmake = ignition.cmake2;
    ignition-math = ignition.math6;
    ignition-utils = ignition.utils1;
  }
  // args)
