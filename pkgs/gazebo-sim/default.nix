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
  ignition-launch ? ignition.launch,
  ignition-utils ? ignition.utils,
  ignition-sim ? ignition.sim,
  makeWrapper,
}:
symlinkJoin {
  name = "sim";

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
    ignition-launch
  ];
  buildInputs = [makeWrapper];
  postBuild = ''
    wrapProgram $out/bin/gz --set GZ_CONFIG_PATH "$out/share/gz"
  '';
}
