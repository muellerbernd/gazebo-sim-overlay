{
  lib,
  stdenv,
  symlinkJoin,
  ignition,
  ignition-cmake ? ignition.cmake,
  ignition-common ? ignition.common,
  ignition-math ? ignition.math,
  ignition-transport ? ignition.transport,
  ignition-msgs ? ignition.msgs,
  ignition-fuel-tools ? ignition.fuel-tools,
  ignition-plugin ? ignition.plugin,
  ignition-physics ? ignition.physics,
  ignition-rendering ? ignition.rendering,
  ignition-gui ? ignition.gui,
  ignition-sensors ? ignition.sensors,
  ignition-tools ? ignition.tools,
  ignition-utils ? ignition.utils,
  ignition-sim ? ignition.sim,
  sdformat ? ignition.sdformat,
  makeWrapper,
  qt6Modules ? [ ],
  majorVersion ? "8",
  ...
}:
let
  qtQmlImportDirs = lib.concatStringsSep ":" (
    builtins.map (m: "${m}/lib/qt-6/qml") (builtins.filter (m: m ? qtQmlPrefix || true) qt6Modules)
  );
  qtPluginDirs = lib.concatStringsSep ":" (
    builtins.map (m: "${m}/lib/qt-6/plugins") qt6Modules
  );
in
symlinkJoin {
  name = "gz-sim_${majorVersion}";

  paths = [
    ignition-cmake
    ignition-common
    ignition-msgs
    ignition-plugin
    ignition-utils
    ignition-rendering
    ignition-sensors
    ignition-tools
    ignition-math
    ignition-transport
    ignition-fuel-tools
    ignition-physics
    ignition-gui
    ignition-sim
  ];
  buildInputs = [ makeWrapper ];
  postBuild =
    if (lib.versionAtLeast majorVersion "8") then
      ''
        wrapProgram $out/bin/gz \
          --set GZ_CONFIG_PATH "$out/share/gz" \
          --set GZ_SIM_SYSTEM_PLUGIN_PATH "$out/lib/gz-sim-${majorVersion}" \
          ${
            lib.optionalString (qtQmlImportDirs != "") ''
              --prefix NIXPKGS_QT6_QML_IMPORT_PATH : "${qtQmlImportDirs}" \
            ''
          }${
            lib.optionalString (qtPluginDirs != "") ''
              --prefix QT_PLUGIN_PATH : "${qtPluginDirs}" \
            ''
          }--set QT_STYLE_OVERRIDE Fusion
      ''
    else
      ''wrapProgram $out/bin/ign --set IGN_CONFIG_PATH "$out/share/ignition"'';
}
