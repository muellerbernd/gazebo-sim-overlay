{
  callPackage,
  ignition,
}@args:
callPackage ./. (
  {
    majorVersion = "11";
    version = "11.0.0";
    srcHash = "sha256:1vbmszzas6fmvimz170l5fqg9nck35bqwi9c9iqxx90i2mfdln90";
    ignition-common = ignition.common7;
    ignition-msgs = ignition.msgs12;
    ignition-cmake = ignition.cmake5;
  }
  // args
)
