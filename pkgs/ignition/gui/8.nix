{ callPackage, ignition, ... }@args:

callPackage ./. ({
  majorVersion = "8";
  version = "8.0.0";
  srcHash = "sha256-l/DUgeXZfeBJWOLEveME/NrAqoi619gQrwAReYy7olc=";
  ignition-math = ignition.math;
  ignition-plugin = ignition.plugin;
  ignition-common = ignition.common;
  ignition-transport = ignition.transport;
  ignition-rendering = ignition.rendering;
  ignition-msgs = ignition.msgs;
  ignition-tools = ignition.tools;
  ignition-cmake = ignition.cmake;
} // args)
