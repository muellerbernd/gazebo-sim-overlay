{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "6";
    version = "6.0.0";
    srcHash = "sha256-P8woNbRuR6hzz6vtWvryOrgGKq/tTQYchZm9pU85u24=";
    ignition-math = ignition.math6;
    ignition-plugin = ignition.plugin1;
    ignition-common = ignition.common4;
    ignition-transport = ignition.transport11;
    ignition-rendering = ignition.rendering6;
    ignition-msgs = ignition.msgs8;
    ignition-tools = ignition.tools;
    ignition-cmake = ignition.cmake2;
  }
  // args)
