{ callPackage, ignition, ... }@args:
callPackage ./. (
  {
    majorVersion = "7";
    version = "7.5.0";
    srcHash = "sha256-TEadejtPCR3FAUbyAAME28tmqaxypPTJDYidjZ3FPIY=";
    ignition-cmake = ignition.cmake3;
    ignition-utils = ignition.utils2;
  }
  // args
)
