{ callPackage, gz-cmake_3, gz-math_7, gz-utils_2, ... } @ args:

callPackage ./generic.nix (args // {
  version = "14.0.0";
  srcHash = "sha256-iMCFiiPvSk82qbMWLktDiHiuhnBgivc9F5fWejqqQkY=";
  gz-cmake = gz-cmake_3;
  gz-math = gz-math_7;
  gz-utils = gz-utils_2;
})

