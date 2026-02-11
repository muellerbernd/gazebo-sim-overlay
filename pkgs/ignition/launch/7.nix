{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "7";
    version = "7.1.0";
    srcHash = "sha256-En3V8i/Ie8+KnSHGlm9Bap7REdLhYBaVHVbOM+/Pzno=";
    ignition-cmake = ignition.cmake;
    ignition-utils = ignition.utils;
    ignition-plugin = ignition.plugin;
    ignition-common = ignition.common;
    ignition-transport = ignition.transport;
    ignition-msgs = ignition.msgs;
    ignition-math = ignition.math;
    ignition-gui = ignition.gui;
    ignition-sim = ignition.sim;
    ignition-rendering = ignition.rendering;
    ignition-fuel-tools = ignition.fuel-tools;
    ignition-physics = ignition.physics;
    ignition-sensors = ignition.sensors;
  }
  // args
)
