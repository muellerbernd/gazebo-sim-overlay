{pkgs ? import <nixpkgs> {}, ...}: let
  nixgl = [pkgs.nixgl.nixGLIntel];
  extra = [pkgs.gazebo];
in {
  classic = pkgs.mkShell {
    name = "Gz classic development";
    buildInputs =
      if
        pkgs.lib.strings.hasInfix "/run/current-system/sw"
        (builtins.getEnv "NIX-PROFILES")
      then [extra]
      else [
        extra
        # nixgl
      ];
    shellHook = ''
      export QT_QPA_PLATFORM=xcb
    '';
  };
  default = pkgs.mkShell {
    name = "Gz sim development";
    buildInputs = [
      pkgs.gz-harmonic
      nixgl
    ];
    QT_QPA_PLATFORM = "xcb";
    shellHook = ''
    '';
  };
  fortress = pkgs.mkShell {
    name = "Gz sim development";
    buildInputs = [
      pkgs.ignition-fortress
    ];
    QT_QPA_PLATFORM = "xcb";
    shellHook = ''
    '';
  };
}
