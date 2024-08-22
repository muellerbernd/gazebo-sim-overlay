{
  callPackage,
  ignition,
} @ args:
callPackage ./. ({
    majorVersion = "9";
    version = "9.0.3";
    srcHash = "sha256-36WwY3YUeCAUDBY8N+Mbw7FuNRn1fQUifLZvoGhXtcc=";
    ignition-common = ignition.common5;
    ignition-msgs = ignition.msgs10;
    ignition-cmake = ignition.cmake3;
  }
  // args)
