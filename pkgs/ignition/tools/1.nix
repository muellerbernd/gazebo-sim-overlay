{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "1";
    version = "1.0.0";
    srcHash = "";
    ignition-cmake = ignition.cmake;
    ignition-tools = ignition.tools;
  }
  // args)
