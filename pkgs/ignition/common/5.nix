{ callPackage, ignition, gz-cmake_3, ... } @ args :

callPackage ./. ({
  majorVersion = "5";
  version = "5.4.2";
  srcHash = "sha256-vq7JMho7wSDkIRiptfwK5kT6wYLcaLIpfYBTFHQFJYk=";
  gz-cmake = gz-cmake_3;
} // args)
