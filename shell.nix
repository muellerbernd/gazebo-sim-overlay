{
  pkgs ? import <nixpkgs> { },
  ...
}:
let
  nixgl = [ pkgs.nixgl.nixGLIntel ];
in
rec {
  # classic = pkgs.mkShell {
  #   name = "Gazebo classic development";
  #   buildInputs = [
  #     pkgs.gazebo
  #     nixgl
  #   ];
  #   shellHook = "
  #     unset QT_QPA_PLATFORM
  #     unset QT_PLUGIN_PATH
  #   ";
  # };
  default = ionic;
  ionic = pkgs.mkShell {
    name = "Gz sim development";
    buildInputs = [
      pkgs.gz-ionic
      nixgl
    ];
    shellHook = "\n      unset QT_QPA_PLATFORM\n      unset QT_PLUGIN_PATH\n    ";
  };
  harmonic = pkgs.mkShell {
    name = "Gz sim development";
    buildInputs = [
      pkgs.gz-harmonic
      nixgl
    ];
    shellHook = "\n      unset QT_QPA_PLATFORM\n      unset QT_PLUGIN_PATH\n    ";
  };
  fortress = pkgs.mkShell {
    name = "Gz sim development";
    buildInputs = [
      pkgs.ignition-fortress
      nixgl
    ];
    shellHook = "\n      unset QT_QPA_PLATFORM\n      unset QT_PLUGIN_PATH\n    ";
  };
}
