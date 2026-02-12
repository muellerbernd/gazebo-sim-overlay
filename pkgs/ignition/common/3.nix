{
  callPackage,
  ignition,
  ffmpeg_6,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "3";
    version = "3.15.1";
    srcHash = "sha256-WhgCwbRgw6y4+LWpjBTauvDLpFbUvA3SJIMF9m9pdPY=";
    ignition-math = ignition.math6;
    ignition-utils = ignition.utils1;
    ignition-cmake = ignition.cmake2;
    ffmpeg = ffmpeg_6;
  }
  // args
)
