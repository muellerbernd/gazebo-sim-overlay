{ callPackage, ignition, ... } @ args:

callPackage ./generic.nix (args // {
  version = "13.4.1";
  srcHash = "sha256-BlYXDccIs1kOj34Nwpuemzt1z8aSzZtD8zeWrIQTJHw=";
  gz-cmake = ignition.cmake;
  gz-math = ignition.math;
  gz-utils = ignition.utils;
})

