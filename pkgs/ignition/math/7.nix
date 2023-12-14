{ callPackage, ignition, ... } @ args :

callPackage ./. ({
  majorVersion = "7";
  version = "7.3.0";
  srcHash = "sha256-+3Nu56agHXWEBKK/+z47n0y9CI70ggEBIpOzR/13d88=";
  ignition-cmake = ignition.cmake2;
} // args)
