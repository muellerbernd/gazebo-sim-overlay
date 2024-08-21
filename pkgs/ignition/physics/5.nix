{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "5";
    version = "5.0.0";
    srcHash = "";
    ignition-cmake = ignition.cmake2;
    ignition-utils = ignition.utils1;
    ignition-plugin = ignition.plugin1;
    ignition-common = ignition.common4;
    ignition-math = ignition.math6;
  }
  // args)
