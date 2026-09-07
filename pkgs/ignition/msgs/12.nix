{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "12";
    version = "12.0.1";
    srcHash = "sha256:12rl21qlj44vply63cn8dsbab2lgpv918gxinn1ph3gsd29fik2w";
    ignition-cmake = ignition.cmake5;
    ignition-math = ignition.math9;
    ignition-utils = ignition.utils4;
  }
  // args
)
