{ callPackage, ignition, ... }@args:

callPackage ./. ({
  majorVersion = "8";
  version = "8.0.0";
  srcHash = "sha256-sj7jCHmAlsVkwI4cfMgPDfEdR2xle3EGquLmaPSqng4=";
  ignition-math = ignition.math;
  ignition-plugin = ignition.plugin;
  ignition-common = ignition.common;
  ignition-cmake = ignition.cmake;
} // args)
