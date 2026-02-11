{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "10";
    version = "10.3.2";
    srcHash = "sha256-gxhRqLzBCaDmK67T5RryDpxbDR3WLgV9DFs7w6ieMxQ=";
    # version = "10.3.0";
    # srcHash = "sha256-PQT8EpTxafldnKG3hDSXw2P22gLRg2EfMllrzaTaDEw=";
    ignition-cmake = ignition.cmake3;
    ignition-math = ignition.math7;
    ignition-utils = ignition.utils2;
  }
  // args
)
