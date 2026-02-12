{
  callPackage,
  ignition,
  sdformat_12,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "6";
    version = "6.8.0";
    srcHash = "sha256-9p5waE51b8eGzpkFaw5QIrOnWPqj7wlTF7zGCFPKuOQ=";
    ignition-plugin = ignition.plugin1;
    ignition-transport = ignition.transport11;
    ignition-rendering = ignition.rendering6;
    ignition-msgs = ignition.msgs8;
    ignition-cmake = ignition.cmake2;
    ignition-common = ignition.common4;
    sdformat = sdformat_12;
  }
  // args
)
