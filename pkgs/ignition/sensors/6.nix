{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "6";
    version = "6.0.0";
    srcHash = "";
    ignition-plugin = ignition.plugin1;
    ignition-transport = ignition.transport11;
    ignition-rendering = ignition.rendering6;
    ignition-msgs = ignition.msgs8;
    ignition-cmake = ignition.cmake2;
    ignition-common = ignition.common4;
  }
  // args)
