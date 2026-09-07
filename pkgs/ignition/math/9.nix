{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "9";
    version = "9.1.0";
    srcHash = "sha256:0l1nzl6qny1d730za48kdfgwylqqp3zk3sc2h5rdby3n7vj61kr9";
    ignition-cmake = ignition.cmake5;
    ignition-utils = ignition.utils4;
  }
  // args
)
