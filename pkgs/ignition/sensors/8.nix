{ callPackage, ignition, ... }@args:

callPackage ./. ({
  majorVersion = "8";
  version = "8.0.0";
  srcHash = "sha256-b5wTwAy50oukLjh47SwTpvVm+LBx4NsPSTFtGTVtW8A=";
  ignition-plugin = ignition.plugin;
  ignition-transport = ignition.transport;
  ignition-rendering = ignition.rendering;
  ignition-msgs = ignition.msgs;
  ignition-cmake = ignition.cmake;
  ignition-common = ignition.common;
} // args)
