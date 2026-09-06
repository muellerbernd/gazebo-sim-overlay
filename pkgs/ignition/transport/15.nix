{
  callPackage,
  ignition,
  ...
}@args:
callPackage ./. (
  {
    majorVersion = "15";
    version = "15.0.2";
    srcHash = "sha256:1kyjq1d48cz244scqnrm1zm399bnysvqpm4qzpl5kd7p3k85x6gn";
  }
  // args
)
