{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "10";
    version = "10.0.1";
    srcHash = "sha256:1c9kdxypidnn9mxyrxhyy1zyz8zcb3lavqmkfjgc8ms0wffal5vl";
    ignition-plugin = ignition.plugin4;
    ignition-transport = ignition.transport15;
    ignition-rendering = ignition.rendering10;
    ignition-msgs = ignition.msgs12;
    ignition-cmake = ignition.cmake5;
    ignition-common = ignition.common7;
  }
  // args
)
