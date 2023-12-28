{ callPackage, ignition, ... } @ args :

callPackage ./. ({
  majorVersion = "10";
  version = "10.0.0";
  srcHash = "sha256-wRbvGJAjwUD4YMlvgP70DytKGrPEhhxtIUcaLPkZ68I=";
  ignition-cmake = ignition.cmake3;
  ignition-math = ignition.math7;
  ignition-utils = ignition.utils2;
} // args)
