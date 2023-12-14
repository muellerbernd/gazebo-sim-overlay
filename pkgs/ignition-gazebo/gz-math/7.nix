{ callPackage, gz-cmake_3, gz-utils_2, ... } @ args:

callPackage ./generic.nix (args // {
  version = "7.3.0";
  srcHash = "sha256-+3Nu56agHXWEBKK/+z47n0y9CI70ggEBIpOzR/13d88=";
  gz-cmake = gz-cmake_3;
  gz-utils = gz-utils_2;
})
