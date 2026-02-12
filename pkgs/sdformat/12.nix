{ callPackage, ignition, ... }@args:
callPackage ./generic.nix (
  args
  // {
    version = "12.8.0";
    srcHash = "sha256-XA1leXOP8U+En41uEBRoqPCrxDAAsrgEAXD+CCpjBIk=";
    gz-cmake = ignition.cmake2;
    gz-math = ignition.math6;
    gz-utils = ignition.utils1;
  }
)
