{ callPackage, ... } @ args :

callPackage ./generic.nix ({
  version = "3.4.1";
  srcHash = "sha256-O0cV9/t7j7neKg/grXRF8lujolPpmhsZgzTWmFk9HIA=";
} // args)
