{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "9";
    version = "9.0.1";
    srcHash = "sha256-ZBDgd37TPBOldorGZimsCk57fVa7tTc8wRwUGFBZnDk=";
    ignition-math = ignition.math8;
    ignition-plugin = ignition.plugin3;
    ignition-common = ignition.common6;
    ignition-transport = ignition.transport14;
    ignition-rendering = ignition.rendering9;
    ignition-msgs = ignition.msgs11;
    ignition-tools = ignition.tools2;
    ignition-cmake = ignition.cmake4;
  }
  // args)
