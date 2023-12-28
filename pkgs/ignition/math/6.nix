{ callPackage, ignition, ... } @ args :

callPackage ./. ({
  majorVersion = "6";
  version = "6.13.0";
  srcHash = "sha256-4kWbHdsDCCEgXHy3Dv4oZKdVBY4eJLKovYu+HUgkSjE=";
  # ignition-cmake = ignition.cmake0;
} // args)
