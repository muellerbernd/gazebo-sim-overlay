{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "14";
    version = "14.1.0";
    ignition-cmake = ignition.cmake4;
    ignition-msgs = ignition.msgs11;
    ignition-utils = ignition.utils3;
    srcHash = "sha256-45jD5lwNDJRJw8TKxCVBifKJYZ+NZcygSJozrynbs9g=";
  }
  // args
)
