{
  pkgs ? import <nixpkgs> { },
  ...
}:
let
  nixgl = [ pkgs.nixgl.nixGLIntel ];
in
rec {
  jetty = pkgs.mkShell {
    name = "Gz sim (Jetty) development";
    buildInputs = [
      pkgs.gz-jetty
      nixgl
      pkgs.gnumake
    ];
    shellHook = "
      unset QT_QPA_PLATFORM
      unset QT_PLUGIN_PATH
    ";
  };
  default = jetty;
  gz-jetty = jetty;

  ionic = pkgs.mkShell {
    name = "Gz sim (Ionic) development";
    buildInputs = [
      pkgs.gz-ionic
      nixgl
      pkgs.gnumake
    ];
    shellHook = "
      unset QT_QPA_PLATFORM
      unset QT_PLUGIN_PATH
    ";
  };
  gz-ionic = ionic;

  harmonic = pkgs.mkShell {
    name = "Gz sim (Harmonic) development";
    buildInputs = [
      pkgs.gz-harmonic
      nixgl
      pkgs.gnumake
    ];
    shellHook = "
      unset QT_QPA_PLATFORM
      unset QT_PLUGIN_PATH
    ";
  };
  gz-harmonic = harmonic;

  fortress = pkgs.mkShell {
    name = "Gz sim (Fortress) development";
    buildInputs = [
      pkgs.ignition-fortress
      nixgl
      pkgs.gnumake
    ];
    shellHook = "
      unset QT_QPA_PLATFORM
      unset QT_PLUGIN_PATH
    ";
  };
  gz-fortress = fortress;
  ignition-fortress = fortress;
}
