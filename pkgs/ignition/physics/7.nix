{ callPackage, ignition, ... }@args:

callPackage ./. ({
  majorVersion = "7";
  version = "7.0.0";
  srcHash = "sha256-y+nn1esfzGuKIV8MQ0ZigYqdYsO8qmFB5cFj/rRJRt0=";
  ignition-cmake = ignition.cmake;
  ignition-utils = ignition.utils;
  ignition-plugin = ignition.plugin;
  ignition-common = ignition.common;
} // args)
