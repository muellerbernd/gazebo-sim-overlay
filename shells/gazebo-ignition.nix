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
      export QT_QPA_PLATFORM_PLUGIN_PATH=${pkgs.libsForQt5.qt5.qtbase.bin}/lib/qt-${pkgs.libsForQt5.qt5.qtbase.version}/plugins/platforms
      # gz launch sim.gzlaunch
      # gz physics -h
      # gz gui
      gz sim -g
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
      # pkgs.gazebo_test
      pkgs.gazebo_new
      # nixgl
      # gz
    ];
  shellHook = ''
    export GZ_CONFIG_PATH=${pkgs.gazebo_new}/share/gz
      export QT_QPA_PLATFORM_PLUGIN_PATH=${pkgs.libsForQt5.qt5.qtbase.bin}/lib/qt-${pkgs.libsForQt5.qt5.qtbase.version}/plugins/platforms
  '';
  # QT_XCB_GL_INTEGRATION = "none";
  # export GZ_CONFIG_PATH=${pkgs.sdformat}/share/gz:${pkgs.ignition.transport}/share/gz:${pkgs.ignition.msgs}/share/gz:${pkgs.ignition.plugin}/share/gz:${pkgs.ignition.fuel-tools}/share/gz:${pkgs.ignition.gui}/share/gz:${pkgs.gazebo_sim}/share/gz
}

# vim: set ts=2 sw=2:

