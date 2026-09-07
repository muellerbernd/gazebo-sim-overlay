{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./generic.nix (
  args
  // {
    version = "16.0.1";
    srcHash = "sha256-45uCKPk7ZgNE1TLltM87azt/WL+v2G0XS0xjLAAFdas=";
    gz-cmake = ignition.cmake5;
    gz-math = ignition.math9;
    gz-utils = ignition.utils4;
  }
)
