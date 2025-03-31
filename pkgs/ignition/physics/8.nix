{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "8";
    version = "8.1.0";
    srcHash = "sha256-FnVKVbPCn3B6/sZKiPJqUjUgVilwoeP/H97eg/dirz8";
    ignition-cmake = ignition.cmake4;
    ignition-utils = ignition.utils3;
    ignition-plugin = ignition.plugin3;
    ignition-common = ignition.common6;
    ignition-math = ignition.math8;
  }
  // args)
