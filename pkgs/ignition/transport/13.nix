{ callPackage, ignition, ... } @ args :

callPackage ./. ({
  majorVersion = "13";
  version = "13.0.0";
  srcHash = "sha256-m0EpsLYXm3oRWJ3x7n20aP8DHsMyKAQSStWdFmVUWZo=";
} // args)
