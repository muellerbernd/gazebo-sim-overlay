{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "13";
    version = "13.4.0";
    srcHash = "sha256-2Akd3vKr07IdgoJppvUV1nZlHE4RdQfI2R18ihHTDHk=";
    ignition-msgs = ignition.msgs10;
    ignition-cmake = ignition.cmake3;
    ignition-math = ignition.math7;
    ignition-utils = ignition.utils2;
  }
  // args)
