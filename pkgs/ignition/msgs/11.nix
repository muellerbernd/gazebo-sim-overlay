{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "11";
    version = "11.1.0";
    srcHash = "sha256-M/rzUrL6uzpaRNLWJsGViY6Jk0bLtooEe+0eEEPS7PA=";
    ignition-cmake = ignition.cmake4;
    ignition-math = ignition.math8;
    ignition-utils = ignition.utils3;
  }
  // args
)
