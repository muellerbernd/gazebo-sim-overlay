{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "10";
    version = "10.0.1";
    srcHash = "sha256:1cyfa443awi801kshp6jklmgvc5hdshnp6pq7qqfgym4zixlcww2";
    ignition-math = ignition.math9;
    ignition-plugin = ignition.plugin4;
    ignition-common = ignition.common7;
    ignition-cmake = ignition.cmake5;
  }
  // args
)
