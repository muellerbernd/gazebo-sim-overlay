{ callPackage, ignition, ... }@args:

callPackage ./. ({
  majorVersion = "2";
  version = "2.0.2";
  srcHash = "sha256-qOpSphg/zuufvPcWVpJejvkDmZ4e23ie+j5pPciEohQ=";
  ignition-cmake = ignition.cmake;
  ignition-utils = ignition.utils;
} // args)
