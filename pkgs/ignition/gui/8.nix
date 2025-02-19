{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "8";
    version = "8.0.0";
    srcHash = "sha256-l/DUgeXZfeBJWOLEveME/NrAqoi619gQrwAReYy7olc=";
    # version = "8.3.0";
    # srcHash = "sha256-V0zaL6qrd510hMECCr3/mMkyqf4yu2aaKLRZ6Rw0s/4=";
    ignition-math = ignition.math7;
    ignition-plugin = ignition.plugin2;
    ignition-common = ignition.common5;
    ignition-transport = ignition.transport13;
    ignition-rendering = ignition.rendering8;
    ignition-msgs = ignition.msgs10;
    ignition-tools = ignition.tools2;
    ignition-cmake = ignition.cmake3;
  }
  // args)
