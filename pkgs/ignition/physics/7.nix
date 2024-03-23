{ callPackage, ignition, ... }@args:

callPackage ./. ({
  majorVersion = "7";
  version = "7.1.0";
  srcHash = "sha256-mTHw4seogXJdzg9eLqro8fbFQdVW7yPfsr1SEZEeti8=";
  ignition-cmake = ignition.cmake;
  ignition-utils = ignition.utils;
  ignition-plugin = ignition.plugin;
  ignition-common = ignition.common;
  ignition-math = ignition.math;
} // args)
