{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "7";
    version = "7.5.0";
    srcHash = "sha256-E7u3EtpqNLvcqI5ycezwwAlbVHM3JdqeyLFWYlEaOYo=";
    ignition-cmake = ignition.cmake3;
    ignition-utils = ignition.utils2;
  }
  // args)
