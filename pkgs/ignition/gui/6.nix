{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "6";
    version = "6.0.0";
    srcHash = "";
    ignition-math = ignition.math;
    ignition-plugin = ignition.plugin;
    ignition-common = ignition.common;
    ignition-transport = ignition.transport;
    ignition-rendering = ignition.rendering;
    ignition-msgs = ignition.msgs;
    ignition-tools = ignition.tools;
    ignition-cmake = ignition.cmake;
  }
  // args)
