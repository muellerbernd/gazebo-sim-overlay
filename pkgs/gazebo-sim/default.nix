{
  lib,
  stdenv,
  pkgs,
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
}: let
  sim = pkgs.symlinkJoin {
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
  };
in
  stdenv.mkDerivation rec {
    name = "gazebo-sim";
    src = null;

    buildInputs = [sim];
    # postFixup = lib.optional (lib.versionAtLeast version "2") ''
    #   mkdir -p $out/nix-support
    #   cat > $out/nix-support/setup-hook <<EOF
    #   export GZ_CONFIG_PATH="$out/share/gz:$GZ_CONFIG_PATH"
    #   EOF
    # '';
    GZ_CONFIG_PATH = "$out/share/gz:$GZ_CONFIG_PATH";

    meta = with lib; {
      homepage = "http://gazebosim.org/";
      description = "wrapper for all gz tools";
      license = licenses.asl20;
      maintainers = with maintainers; [muellerbernd];
      platforms = platforms.all;
    };
  }
