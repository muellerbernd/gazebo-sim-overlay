{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "2";
    version = "2.0.3";
    srcHash = "sha256-9t6vcnBbfRWu6ptmqYAhmWKDoKAaK631JD9u1C0G0mY=";
    ignition-cmake = ignition.cmake3;
    ignition-utils = ignition.utils2;
  }
  // args
)
