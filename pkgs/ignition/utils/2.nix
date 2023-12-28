{ callPackage, ignition, ... } @ args:

callPackage ./. ({
  majorVersion = "2";
  version = "2.2.0";
  srcHash = "sha256-dNoDOZtk/zseHuOM5mOPHkXKU7wqxxKrFnh7e09bjRA=";
  ignition-cmake = ignition.cmake3;
} // args)
