{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "9";
    version = "9.0.0";
    srcHash = "sha256:056y3limrjcyqvmhwpfgdc7z81b2dg90fwmk70i44az1r4bd273x";
    ignition-cmake = ignition.cmake5;
    ignition-utils = ignition.utils4;
    ignition-common = ignition.common7;
    ignition-math = ignition.math9;
    ignition-msgs = ignition.msgs12;
    ignition-transport = ignition.transport15;
    ignition-gui = ignition.gui10;
    ignition-sim = ignition.sim10;
    ignition-rendering = ignition.rendering10;
    ignition-sensors = ignition.sensors10;
    ignition-plugin = ignition.plugin4;
    ignition-tools = ignition.tools2-qt6;
    ignition-fuel-tools = ignition.fuel-tools11;
    ignition-physics = ignition.physics9;
  }
  // args
)
