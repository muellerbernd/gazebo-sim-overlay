{pkgs}: let
  nixgl = [pkgs.nixgl.nixGLIntel];
  gz = pkgs.writeShellApplication {
    name = "gz sim";
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
      gz
      # pkgs.gazebo_sim
      nixgl
    ];
    shellHook = ''
      export GZ_CONFIG_PATH=${pkgs.gazebo_sim}/share/gz
      export QT_QPA_PLATFORM=xcb
    '';
  }
# vim: set ts=2 sw=2:

