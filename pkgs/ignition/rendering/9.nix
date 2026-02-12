{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "9";
    version = "9.1.0";
    srcHash = "sha256-L2xkd93zhXtvbbzRrdjsoxbDtopp/RpcWBh1tfGvLeM=";
    ignition-math = ignition.math8;
    ignition-plugin = ignition.plugin3;
    ignition-common = ignition.common6;
    ignition-cmake = ignition.cmake4;
  }
  // args
)
