{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "9";
    version = "9.3.0";
    srcHash = "sha256:131w05lxayllghdgpab1vw59vkcl0lkz9dj6igbgjpyfawsrsk0x";
    ignition-cmake = ignition.cmake5;
    ignition-utils = ignition.utils4;
    ignition-plugin = ignition.plugin4;
    ignition-common = ignition.common7;
    ignition-math = ignition.math9;
  }
  // args
)
