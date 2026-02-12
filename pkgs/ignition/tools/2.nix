{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "2";
    version = "2.0.1";
    srcHash = "sha256-sV/T53oVk1fgjwqn/SRTaPTukt+vAlGGxGvTN8+G6Mo=";
    ignition-cmake = ignition.cmake;
  }
  // args
)
