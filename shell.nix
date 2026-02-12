{
  pkgs ? import <nixpkgs> { },
  ...
}:
let
  nixgl = [ pkgs.nixgl.nixGLIntel ];
in
{
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
  default = pkgs.mkShell {
    name = "Gz sim development";
    buildInputs = [
      pkgs.gz-ionic
      nixgl
    ];
    shellHook = "
      unset QT_QPA_PLATFORM
      unset QT_PLUGIN_PATH
    ";
  };
  harmonic = pkgs.mkShell {
    name = "Gz sim development";
    buildInputs = [
      pkgs.gz-harmonic
      nixgl
    ];
    shellHook = "
      unset QT_QPA_PLATFORM
      unset QT_PLUGIN_PATH
    ";
  };
  fortress = pkgs.mkShell {
    name = "Gz sim development";
    buildInputs = [
      pkgs.ignition-fortress
      nixgl
    ];
    shellHook = "
      unset QT_QPA_PLATFORM
      unset QT_PLUGIN_PATH
    ";
  };
}
