{
  callPackage,
  ignition,
  sdformat_12,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "5";
    version = "5.3.2";
    srcHash = "sha256-pvBAdMQJwtWp9mGjcp1Yd0MpyYzwojfoBlQotpPxOHk=";
    ignition-cmake = ignition.cmake2;
    ignition-utils = ignition.utils1;
    ignition-plugin = ignition.plugin1;
    ignition-common = ignition.common4;
    ignition-math = ignition.math6;
    sdformat = sdformat_12;
  }
  // args)
