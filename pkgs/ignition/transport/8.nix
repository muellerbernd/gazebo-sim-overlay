{ callPackage, ignition, ... }@args:
callPackage ./. (
  {
    majorVersion = "8";
    version = "8.4.0";
    srcHash = "sha256-ca11gJkGzK8AiFQc+0F98968yrnvzS4lHjWYA/JF5g8=";
    ignition-msgs = ignition.msgs5;
    ignition-cmake = ignition.cmake2;
    ignition-math = ignition.math6;
    ignition-utils = ignition.utils1;
  }
  // args
)
