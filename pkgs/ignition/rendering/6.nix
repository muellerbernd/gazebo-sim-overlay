{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "6";
    version = "6.0.0";
    srcHash = "";
    ignition-math = ignition.math6;
    ignition-plugin = ignition.plugin1;
    ignition-common = ignition.common4;
    ignition-cmake = ignition.cmake2;
  }
  // args)
