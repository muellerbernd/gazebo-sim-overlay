{
  callPackage,
  ignition,
} @ args:
callPackage ./. ({
    majorVersion = "7";
    version = "7.0.0";
    srcHash = "";
    ignition-common = ignition.common4;
    ignition-msgs = ignition.msgs8;
    ignition-cmake = ignition.cmake2;
  }
  // args)
