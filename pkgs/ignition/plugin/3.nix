{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "3";
    version = "3.0.1";
    srcHash = "sha256-7v6fzylJ4R1uoyQFM+eyl2/bXVy5MGC5dPjS7/taB8U=";
    ignition-cmake = ignition.cmake4;
    ignition-utils = ignition.utils3;
  }
  // args
)
