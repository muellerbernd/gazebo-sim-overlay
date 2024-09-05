{
  callPackage,
  ignition,
  ogre-next2_20,
  ...
} @ args:
callPackage ./. ({
    majorVersion = "6";
    version = "6.6.3";
    srcHash = "sha256-FV35+LobIFJANJ+P6EOYQWVCIKVOpzmiDgLOk7axdMA=";
    ignition-math = ignition.math6;
    ignition-plugin = ignition.plugin1;
    ignition-common = ignition.common4;
    ignition-cmake = ignition.cmake2;
    ogre2 = ogre-next2_20;
  }
  // args)
