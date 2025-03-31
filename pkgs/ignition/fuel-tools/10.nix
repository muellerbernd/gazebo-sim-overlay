{
  callPackage,
  ignition,
} @ args:
callPackage ./. ({
    majorVersion = "10";
    version = "10.0.1";
    srcHash = "sha256-/Xfhec6kpv6srSp+hudqBaK4dKFn0QK45aGqxzNyytw=";
    ignition-common = ignition.common6;
    ignition-msgs = ignition.msgs11;
    ignition-cmake = ignition.cmake4;
  }
  // args)
