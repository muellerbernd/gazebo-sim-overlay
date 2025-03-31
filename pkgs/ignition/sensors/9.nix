{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "9";
    version = "9.1.0";
    srcHash = "sha256-dMqJqp5229r/mKjBzUJD/tEbsYZANAFNycHYc7CIkz8=";
    ignition-plugin = ignition.plugin3;
    ignition-transport = ignition.transport14;
    ignition-rendering = ignition.rendering9;
    ignition-msgs = ignition.msgs11;
    ignition-cmake = ignition.cmake4;
    ignition-common = ignition.common6;
  }
  // args)
