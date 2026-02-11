{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "8";
    version = "8.7.0";
    srcHash = "sha256-hG4UJfcq6DsyMqTWIcUQ15UCQNfdzTzwvJBpR9kmu84=";
    ignition-cmake = ignition.cmake2;
    ignition-math = ignition.math6;
    ignition-utils = ignition.utils1;
  }
  // args
)
