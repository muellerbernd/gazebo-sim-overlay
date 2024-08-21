{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "2";
    version = "2.0.0";
    srcHash = "sha256-TPDVluvC76X0bli8CMiCxUoAXNl/V4Cc6hrsge9ajsU=";
    ignition-cmake = ignition.cmake;
  }
  // args)
