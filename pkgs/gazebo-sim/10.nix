{
  callPackage,
  ignition,
  sdformat_16,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "10";
    version = "10.3.0";
    srcHash = "sha256-EnzynxbSOZugZJOlXOAK+JNe5zCMvpwkqnoKp0ijdzY=";
    ignition-cmake = ignition.cmake5;
    ignition-common = ignition.common7;
    ignition-math = ignition.math9;
    ignition-transport = ignition.transport15;
    ignition-msgs = ignition.msgs12;
    ignition-fuel-tools = ignition.fuel-tools11;
    ignition-plugin = ignition.plugin4;
    ignition-physics = ignition.physics9;
    ignition-rendering = ignition.rendering10;
    ignition-gui = ignition.gui10;
    ignition-sensors = ignition.sensors10;
    ignition-tools = ignition.tools2-qt6;
    ignition-utils = ignition.utils4;
    ignition-sim = ignition.sim10;
    sdformat = sdformat_16;
  }
  // args
)
