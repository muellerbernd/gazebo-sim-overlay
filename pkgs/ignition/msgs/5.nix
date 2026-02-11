{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "5";
    version = "5.11.0";
    srcHash = "sha256-i2n8x6ubf7ibujfC8v8BcKyPRQTzLoyWMGoOEoKTBys=";
    ignition-cmake = ignition.cmake2;
    ignition-math = ignition.math6;
    ignition-utils = ignition.utils1;
  }
  // args
)
