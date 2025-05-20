{
  callPackage,
  ignition,
  ...
} @ args:
callPackage ./generic.nix (args
  // {
    version = "14.7.0";
    srcHash = "sha256-HOTY/h3mIjlAoJAFzaWwTBBk3WxiLVjfpvvHPaAxH6Q=";
    gz-cmake = ignition.cmake3;
    gz-math = ignition.math7;
    gz-utils = ignition.utils2;
  })
