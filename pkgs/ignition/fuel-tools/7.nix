{
  callPackage,
  ignition,
} @ args:
callPackage ./. ({
    majorVersion = "7";
    version = "7.0.0";
    srcHash = "sha256-yHiHfYjZuLOzly30nAE//r65ibzZ6DGoZSCQiWRXIHg=";
    ignition-common = ignition.common4;
    ignition-msgs = ignition.msgs8;
    ignition-cmake = ignition.cmake2;
  }
  // args)
