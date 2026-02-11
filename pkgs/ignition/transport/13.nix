{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "13";
    version = "13.4.1";
    srcHash = "sha256-hCP+yVoyl1c3KNmQ5jKrYvPT1IlAy9JkCh0c0mOF+KM=";
    ignition-msgs = ignition.msgs10;
    ignition-cmake = ignition.cmake3;
    ignition-math = ignition.math7;
    ignition-utils = ignition.utils2;
  }
  // args
)
