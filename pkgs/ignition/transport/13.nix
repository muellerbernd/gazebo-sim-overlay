{ callPackage, ignition, ... } @ args :

callPackage ./. ({
  majorVersion = "13";
  version = "13.0.0";
  srcHash = "sha256-ca11gJkGzK8AiFQc+0F98968yrnvzS4lHjWYA/JF5g8=";
} // args)
