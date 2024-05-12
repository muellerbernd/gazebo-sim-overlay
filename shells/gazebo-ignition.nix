{pkgs}: let
  nixgl = [pkgs.nixgl.nixGLIntel];
in
  pkgs.mkShell {
    name = "Gz sim development";
    buildInputs = [
      pkgs.gz-harmonic
      nixgl
    ];
    QT_QPA_PLATFORM = "xcb";
    shellHook = ''
    '';
  }
# vim: set ts=2 sw=2:
