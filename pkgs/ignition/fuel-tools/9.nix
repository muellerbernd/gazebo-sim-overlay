{
  callPackage,
  ignition,
}@args:
callPackage ./. (
  {
    majorVersion = "9";
    version = "9.1.1";
    srcHash = "sha256-XQoBcCtzwzzPypS1kIeTCIbjtxrzaW3JvZLCYbwXAOk=";
    ignition-common = ignition.common5;
    ignition-msgs = ignition.msgs10;
    ignition-cmake = ignition.cmake3;
  }
  // args
)
