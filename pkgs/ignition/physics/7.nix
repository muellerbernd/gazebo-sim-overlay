{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "7";
    version = "7.3.0";
    srcHash = "sha256-PTalEQc9C/QsYMO+XK7aOzZUzC01jxiW6bjdItB5hlM=";
    ignition-cmake = ignition.cmake;
    ignition-utils = ignition.utils;
    ignition-plugin = ignition.plugin;
    ignition-common = ignition.common;
    ignition-math = ignition.math;
  }
  // args)
