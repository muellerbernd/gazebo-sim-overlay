{ callPackage, ... }@args:
callPackage ./. (
  {
    majorVersion = "5";
    version = "5.0.0";
    srcHash = "sha256:1sy095067gzm2mjmdq559kiv95k35f6bmfmgy62vwppxb21fhpjw";
  }
  // args
)
