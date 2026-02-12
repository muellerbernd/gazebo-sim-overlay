{ callPackage, ignition, ... }@args:
callPackage ./. (
  {
    majorVersion = "1";
    version = "1.5.0";
    srcHash = "sha256-HgYT7MARRnOdUuUllxRn9pl7tsWO5RDIFDObzJQgZpc=";
    ignition-cmake = ignition.cmake2;
  }
  // args
)
