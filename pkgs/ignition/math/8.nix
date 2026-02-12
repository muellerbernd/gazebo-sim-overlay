{ callPackage, ignition, ... }@args:
callPackage ./. (
  {
    majorVersion = "8";
    version = "8.1.1";
    srcHash = "sha256-E7u3EtpqNLvcqI5ycezwwAlbVHM3JdqeyLFWYlEaOYo=";
    ignition-cmake = ignition.cmake4;
    ignition-utils = ignition.utils3;
  }
  // args
)
