{pkgs}: let
  nixgl = [pkgs.nixgl.nixGLIntel];
  gz = pkgs.writeShellApplication {
    name = "gz_sim";
    runtimeInputs = with pkgs; [
      gazebo_sim
    ];

    text = ''
      export GZ_CONFIG_PATH=${pkgs.gazebo_sim}/share/gz
      gz sim
    '';
  };
in
  pkgs.mkShell {
    name = "Gz sim development";
    buildInputs = [
      pkgs.gz-harmonic
      nixgl
    ];
    GZ_CONFIG_PATH = "${pkgs.gz-harmonic}/share/gz";
    QT_QPA_PLATFORM = "xcb";
    # shellHook = ''
    # '';
  }
# vim: set ts=2 sw=2:
