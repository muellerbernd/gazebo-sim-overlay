{ callPackage, ignition, ... }@args:

callPackage ./. ({
  majorVersion = "7";
  version = "7.0.0";
  srcHash = "sha256-qOpSphg/zuufvPcWVpJejvkDmZ4e23ie+j5pPciEohQ=";
  ignition-cmake = ignition.cmake;
  ignition-utils = ignition.utils;
  ignition-plugin = ignition.plugin;
  ignition-common = ignition.common;
} // args)
