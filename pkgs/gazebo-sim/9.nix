{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "9";
    version = "9.0.0";
    srcHash = "sha256-B8H5lnQKJx9lULMcBVCsuEOGDeRYBh/biiiBUW91wAk=";
    ignition-cmake = ignition.cmake4;
    ignition-common = ignition.common6;
    ignition-math = ignition.math8;
    ignition-transport = ignition.transport14;
    ignition-msgs = ignition.msgs11;
    ignition-fuel-tools = ignition.fuel-tools10;
    ignition-plugin = ignition.plugin3;
    ignition-physics = ignition.physics8;
    ignition-rendering = ignition.rendering9;
    ignition-gui = ignition.gui9;
    ignition-sensors = ignition.sensors9;
    ignition-tools = ignition.tools2;
    ignition-utils = ignition.utils3;
    ignition-sim = ignition.sim9;
    sdformat = ignition.sdformat15;
  }
  // args
)
