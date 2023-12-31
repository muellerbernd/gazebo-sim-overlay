{ callPackage, ignition, ... }@args:

callPackage ./. ({
  majorVersion = "7";
  version = "7.0.0";
  srcHash = "sha256-6UawCCH/Zc41yUbbPEz1qIF+cV6XMOTN4+FJO/0uTds=";
  ignition-cmake = ignition.cmake;
  ignition-utils = ignition.utils;
  ignition-plugin = ignition.plugin;
  ignition-common = ignition.common;
  ignition-transport = ignition.transport;
  ignition-msgs = ignition.msgs;
  ignition-math = ignition.math;
  ignition-gui = ignition.gui;
  ignition-rendering = ignition.rendering;
} // args)
