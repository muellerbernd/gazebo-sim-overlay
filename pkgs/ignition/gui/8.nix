{ callPackage, ignition, ... }@args:
callPackage ./. (
  {
    majorVersion = "8";
    version = "8.4.0";
    srcHash = "sha256-gf9XZzAX2g6r9ThIA0v2H2X/+uu9VnwvyvrdL5ZazM0=";
    ignition-math = ignition.math7;
    ignition-plugin = ignition.plugin2;
    ignition-common = ignition.common5;
    ignition-transport = ignition.transport13;
    ignition-rendering = ignition.rendering8;
    ignition-msgs = ignition.msgs10;
    ignition-tools = ignition.tools2;
    ignition-cmake = ignition.cmake3;
  }
  // args
)
