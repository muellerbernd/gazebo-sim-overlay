{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "10";
    version = "10.0.0";
    srcHash = "sha256-wRbvGJAjwUD4YMlvgP70DytKGrPEhhxtIUcaLPkZ68I=";
    # version = "10.3.0";
    # srcHash = "sha256-PQT8EpTxafldnKG3hDSXw2P22gLRg2EfMllrzaTaDEw=";
    ignition-cmake = ignition.cmake3;
    ignition-math = ignition.math7;
    ignition-utils = ignition.utils2;
  }
  // args)
