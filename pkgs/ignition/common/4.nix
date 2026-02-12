{ callPackage, ignition, ... }@args:
callPackage ./. (
  {
    majorVersion = "4";
    version = "4.7.0";
    srcHash = "sha256-y8qp0UVXxSJm0aJeUD64+aG+gfNEboInW7F6tvHYTPI=";
    ignition-math = ignition.math6;
    ignition-utils = ignition.utils1;
    ignition-cmake = ignition.cmake2;
  }
  // args
)
