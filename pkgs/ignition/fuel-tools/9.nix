{ callPackage, ignition } @ args :

callPackage ./. ({
  majorVersion = "9";
  version = "9.0.0";
  srcHash = "sha256-7d+jbXvAOt6FZQ2vOBaFyygoysGa7rUv9WRzH2GbWMM=";
  ignition-common = ignition.common5;
  ignition-msgs = ignition.msgs10;
  ignition-cmake = ignition.cmake3;
} // args)
