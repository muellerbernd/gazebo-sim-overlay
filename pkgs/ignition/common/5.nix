{ callPackage, ignition, gz-cmake_3, gz-math_7, gz-utils_2, ... }@args:

callPackage ./. ({
  majorVersion = "5";
  version = "5.4.2";
  srcHash = "sha256-vq7JMho7wSDkIRiptfwK5kT6wYLcaLIpfYBTFHQFJYk=";
  gz-cmake = gz-cmake_3;
  gz-math = gz-math_7;
  gz-utils = gz-utils_2;
} // args)
