{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "10";
    version = "10.0.0";
    srcHash = "sha256:19w445cdrfn6wwa00adwpg5v8pbyb6myjcs6damaymsn66shazmk";
    ignition-math = ignition.math9;
    ignition-plugin = ignition.plugin4;
    ignition-common = ignition.common7;
    ignition-transport = ignition.transport15;
    ignition-rendering = ignition.rendering10;
    ignition-msgs = ignition.msgs12;
    ignition-tools = ignition.tools2-qt6;
    ignition-cmake = ignition.cmake5;
  }
  // args
)
