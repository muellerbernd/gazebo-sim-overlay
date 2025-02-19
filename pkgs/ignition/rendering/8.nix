{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "8";
    version = "8.2.0";
    srcHash = "sha256-eaWkZKHu566Rub7YSO2lnKdj8YQbhl86v+JR4zrgtjs=";
    ignition-math = ignition.math7;
    ignition-plugin = ignition.plugin2;
    ignition-common = ignition.common5;
    ignition-cmake = ignition.cmake3;
  }
  // args)
