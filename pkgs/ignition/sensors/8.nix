{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "8";
    version = "8.2.0";
    srcHash = "sha256-j/8kS+Bvaim2gtsZcp+/u8CAE+N24/5qZhciFR0Q8+M=";
    ignition-plugin = ignition.plugin2;
    ignition-transport = ignition.transport13;
    ignition-rendering = ignition.rendering8;
    ignition-msgs = ignition.msgs10;
    ignition-cmake = ignition.cmake3;
    ignition-common = ignition.common5;
  }
  // args)
