{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "2";
    version = "2.0.3";
    srcHash = "sha256-xMFJylj7OnDc7zVWiI4a/mvNpu9scz83F3bGopCt8l8=";
    ignition-cmake = ignition.cmake;
  }
  // args
)
