{
  callPackage,
  ignition,
  sdformat_14,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "7";
    version = "7.3.0";
    srcHash = "sha256-PTalEQc9C/QsYMO+XK7aOzZUzC01jxiW6bjdItB5hlM=";
    ignition-cmake = ignition.cmake3;
    ignition-utils = ignition.utils2;
    ignition-plugin = ignition.plugin2;
    ignition-common = ignition.common5;
    ignition-math = ignition.math7;
    sdformat = sdformat_14;
  }
  // args)
