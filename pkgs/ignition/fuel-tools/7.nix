{
  callPackage,
  ignition,
} @ args:
callPackage ./. ({
    majorVersion = "7";
    version = "7.3.1";
    srcHash = "sha256-q5fH6g9jOZpVA4PTdvF1/nMejpcZVuPV19J2oPBVdSU=";
    ignition-common = ignition.common4;
    ignition-msgs = ignition.msgs8;
    ignition-cmake = ignition.cmake2;
  }
  // args)
