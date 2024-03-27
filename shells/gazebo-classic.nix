{ pkgs }:
let
  nixgl = [ pkgs.nixgl.nixGLIntel ];
  extra = [ pkgs.gazebo ];
in
pkgs.mkShell {
  name = "Gz classic development";
  buildInputs =
    if pkgs.lib.strings.hasInfix "/run/current-system/sw"
      (builtins.getEnv "NIX-PROFILES") then
      [ extra ]
    else [
      extra
      # nixgl
    ];
  shellHook = ''
    export QT_QPA_PLATFORM=xcb
  '';
}

# vim: set ts=2 sw=2:

