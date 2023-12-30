{ pkgs }:
let
  nixgl = [ pkgs.nixgl.nixGLIntel ];
  extra = [ pkgs.gazebo_sim pkgs.ignition.tools];
in
pkgs.mkShell {
  name = "Gz sim development";
  buildInputs =
    if pkgs.lib.strings.hasInfix "/run/current-system/sw"
      (builtins.getEnv "NIX-PROFILES") then
      [ extra ]
    else [
      extra
      # nixgl
    ];
  shellHook = ''
    # export GZ_CONFIG_PATH=${pkgs.ignition.msgs}/share/gz
    export GZ_CONFIG_PATH=${pkgs.sdformat}/share/gz:${pkgs.ignition.transport}/share/gz:${pkgs.ignition.msgs}/share/gz:${pkgs.ignition.plugin}/share/gz:${pkgs.ignition.fuel-tools}/share/gz:${pkgs.ignition.gui}/share/gz:${pkgs.gazebo_sim}/share/gz
  '';
}

# vim: set ts=2 sw=2:

