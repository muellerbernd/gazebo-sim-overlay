{ pkgs }:
let
  nixgl = [ pkgs.nixgl.nixGLIntel ];
  extra = [ pkgs.gazebo_sim pkgs.ignition.gui pkgs.ignition.tools ];
in pkgs.mkShell {
  name = "Gz sim development";
  buildInputs = if pkgs.lib.strings.hasInfix "/run/current-system/sw"
  (builtins.getEnv "NIX-PROFILES") then
    [ extra ]
  else [
    extra
    nixgl
  ];
  shellHook = ''
    export GZ_CONFIG_PATH=${pkgs.ignition.fuel-tools}/share/gz:${pkgs.ignition.gui}/share/gz:${pkgs.gazebo_sim}/share/gz:$GZ_CONFIG_PATH
  '';
}

# vim: set ts=2 sw=2:

