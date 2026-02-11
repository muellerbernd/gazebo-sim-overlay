{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "6";
    ignition-cmake = ignition.cmake2;
    ignition-common = ignition.common4;
    ignition-math = ignition.math7;
    ignition-transport = ignition.transport11;
    ignition-msgs = ignition.msgs8;
    ignition-fuel-tools = ignition.fuel-tools7;
    ignition-plugin = ignition.plugin1;
    ignition-physics = ignition.physics5;
    ignition-rendering = ignition.rendering6;
    ignition-gui = ignition.gui6;
    ignition-sensors = ignition.sensors6;
    ignition-tools = ignition.tools1;
    ignition-utils = ignition.utils1;
    ignition-sim = ignition.sim6;
  }
  // args
)
