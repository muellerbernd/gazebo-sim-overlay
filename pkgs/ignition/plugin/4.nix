{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "4";
    version = "4.0.0";
    srcHash = "sha256:14dmfy6ibch7dbxv707p01h92z1h9dbybjr64v4i3p56n9f52ykh";
    ignition-cmake = ignition.cmake5;
    ignition-utils = ignition.utils4;
  }
  // args
)
