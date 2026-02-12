{
  pkgs ? import <nixpkgs> { },
  ...
}:
let
  nixgl = [ pkgs.nixgl.nixGLIntel ];
  extra = [ pkgs.gazebo ];
in
{
  # classic = pkgs.mkShell {
  #   name = "Gz classic development";
  #   buildInputs =
  #     if
  #       pkgs.lib.strings.hasInfix "/run/current-system/sw"
  #       (builtins.getEnv "NIX-PROFILES")
  #     then [extra]
  #     else [
  #       extra
  #       # nixgl
  #     ];
  #   shellHook = ''
  #     export QT_QPA_PLATFORM=xcb
  #   '';
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
