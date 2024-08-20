{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "8";
    version = "8.0.0";
    srcHash = "sha256-B8H5lnQKJx9lULMcBVCsuEOGDeRYBh/biiiBUW91wBk=";
    ignition-cmake = ignition.cmake3;
    ignition-common = ignition.common5;
    ignition-math = ignition.math7;
    ignition-transport = ignition.transport13;
    ignition-msgs = ignition.msgs10;
    ignition-fuel-tools = ignition.fuel-tools9;
    ignition-plugin = ignition.plugin2;
    ignition-physics = ignition.physics7;
    ignition-rendering = ignition.rendering8;
    ignition-gui = ignition.gui8;
    ignition-sensors = ignition.sensors8;
    ignition-tools = ignition.tools2;
  }
  // args)
