{ pkgs }:
let
  nixgl = [ pkgs.nixgl.nixGLIntel ];
  gz = pkgs.writeShellApplication {
    name = "gazebo";
    runtimeInputs = with pkgs; [
      gazebo_new
    ];

    text = ''
      export GZ_CONFIG_PATH=${pkgs.gazebo_new}/share/gz
      echo "$GZ_CONFIG_PATH"
      # gz launch sim.gzlaunch
      # gz physics -h
    '';
  };

in
pkgs.mkShell {
  name = "Gz sim development";
  buildInputs =
    # if pkgs.lib.strings.hasInfix "/run/current-system/sw"
    #   (builtins.getEnv "NIX-PROFILES") then
    #   [ g ]
    # else
    [
      # pkgs.gazebo_sim
      # gz
      pkgs.gazebo_new
      nixgl
    ];
  shellHook = ''
    export GZ_CONFIG_PATH=${pkgs.gazebo_new}/share/gz
    # export GZ_CONFIG_PATH=${pkgs.sdformat}/share/gz:${pkgs.ignition.transport}/share/gz:${pkgs.ignition.msgs}/share/gz:${pkgs.ignition.plugin}/share/gz:${pkgs.ignition.fuel-tools}/share/gz:${pkgs.ignition.gui}/share/gz:${pkgs.gazebo_sim}/share/gz
  '';
}

# vim: set ts=2 sw=2:

