{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "6";
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
    ignition-utils = ignition.utils1;
    ignition-sim = ignition.sim6;
    ignition-launch = ignition.launch7;
  }
  // args)
