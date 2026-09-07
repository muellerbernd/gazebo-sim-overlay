{
  callPackage,
  ignition,
  pkgs,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "4";
    version = "4.0.0";
    srcHash = "sha256:1fzhrxcq00plbhpwrs5p3ix6and3500j4xzl5gfx221rz85jg6kx";
    ignition-cmake = ignition.cmake5;
  }
  // args
)
