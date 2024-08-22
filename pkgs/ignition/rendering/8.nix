{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "8";
    version = "8.2.0";
    srcHash = "sha256-eaWkZKHu566Rub7YSO2lnKdj8YQbhl86v+JR4zrgtjs=";
    ignition-math = ignition.math;
    ignition-plugin = ignition.plugin;
    ignition-common = ignition.common;
    ignition-cmake = ignition.cmake;
  }
  // args)
