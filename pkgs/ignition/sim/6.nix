{
  callPackage,
  ignition,
  sdformat_12,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "6";
    version = "6.16.0";
    srcHash = "sha256-APdkPPYuB/oPQRWslwWAkPF0LE6cL23ivmm9rSFi2BM=";
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
    sdformat = sdformat_12;
  }
  // args
)
