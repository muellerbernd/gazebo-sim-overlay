{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "8";
    version = "8.2.0";
    srcHash = "sha256-j/8kS+Bvaim2gtsZcp+/u8CAE+N24/5qZhciFR0Q8+M=";
    ignition-plugin = ignition.plugin;
    ignition-transport = ignition.transport;
    ignition-rendering = ignition.rendering;
    ignition-msgs = ignition.msgs;
    ignition-cmake = ignition.cmake;
    ignition-common = ignition.common;
  }
  // args)
