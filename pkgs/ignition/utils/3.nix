{
  callPackage,
  ignition,
  pkgs,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "3";
    version = "3.0.0";
    srcHash = "sha256-maq0iGCGbrjVGwBNNIYYSAKXxszwlAJS4FLrGNxsA5c=";
    ignition-cmake = ignition.cmake4;
  }
  // args
)
