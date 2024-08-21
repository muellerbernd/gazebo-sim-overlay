{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "11";
    version = "11.4.1";
    srcHash = "sha256-wQ/ugKYopWgSaa6tqPrp8oQexPpnA6fa28L383OGNXM=";
    ignition-msgs = ignition.msgs8;
    ignition-cmake = ignition.cmake2;
    ignition-math = ignition.math6;
    ignition-utils = ignition.utils1;
  }
  // args)
