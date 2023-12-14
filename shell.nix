{ pkgs }:
let
  nixgl = [ pkgs.nixgl.nixGLIntel ];
  extra = [ pkgs.gazebo_sim pkgs.ignition.gui ];
in pkgs.mkShell {
  name = "Gz sim development";
  buildInputs = if pkgs.lib.strings.hasInfix "/run/current-system/sw"
  (builtins.getEnv "NIX-PROFILES") then
    [ extra ]
  else [
    extra
    nixgl
  ];
  # RMW_IMPLEMENTATION = "rmw_fastrtps_dynamic_cpp";
  # ROS_VERSION = 2;
  # ROS_PYTHON_VERSION = 3;
  # ROS_DISTRO = "humble";
  # ROS_DOMAIN_ID = 41;
  # shellHook = ''
  #   echo "Hello ROS2 humble"
  #   echo "please run eval \"\$(mk-workspace-shell-setup-2)\" to enable completion in zsh"
  #   # eval "$(mk-workspace-shell-setup-2)"
  # '';
  # eval ${pkgs.python310Packages.argcomplete}/bin/register-python-argcomplete ros2
  # eval ${pkgs.python310Packages.argcomplete}/bin/register-python-argcomplete colcon
  # eval ${pkgs.python310Packages.argcomplete}/bin/register-python-argcomplete rosidl
}

# vim: set ts=2 sw=2:

