{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "1";
    version = "1.5.1";
    srcHash = "sha256-Ymlw1SBoSlHwxe/4E3jdMy8ECCFNy8YGboqTQi6UIs4=";
    ignition-cmake = ignition.cmake2;
  }
  // args
)
