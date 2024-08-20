{pkgs ? import <nixpkgs> {}, ...}: rec{
  gazebo_classic = pkgs.libsForQt5.callPackage ./gazebo-classic {};
  gazebo_sim = pkgs.callPackage ./gazebo-sim {};
  gazebo = gazebo_classic;
  gazebo_11 = gazebo_classic;
  gz-harmonic = gazebo_sim;

  libdart = pkgs.callPackage ./libdart {};

  ignition = rec {
    cmake0 = pkgs.callPackage ./ignition/cmake/0.nix {};
    cmake2 = pkgs.callPackage ./ignition/cmake {};
    cmake3 = pkgs.callPackage ./ignition/cmake/3.nix {};
    cmake = cmake3;

    common3 = pkgs.callPackage ./ignition/common/3.nix {};
    common4 = pkgs.callPackage ./ignition/common/4.nix {};
    common5 = pkgs.callPackage ./ignition/common/5.nix {};
    common = common5;

    fuel-tools4 = pkgs.callPackage ./ignition/fuel-tools/4.nix {};
    # fuel-tools7 = pkgs.callPackage ./ignition/fuel-tools { };
    fuel-tools9 = pkgs.callPackage ./ignition/fuel-tools/9.nix {};
    fuel-tools = fuel-tools9;

    math4 = pkgs.callPackage ./ignition/math/4.nix {};
    math6 = pkgs.callPackage ./ignition/math/6.nix {};
    math7 = pkgs.callPackage ./ignition/math/7.nix {};
    math = math7;

    msgs5 = pkgs.callPackage ./ignition/msgs/5.nix {};
    # msgs8 = pkgs.callPackage ./ignition/msgs { };
    msgs10 = pkgs.callPackage ./ignition/msgs/10.nix {};
    msgs = msgs10;

    tools2 = pkgs.libsForQt5.callPackage ./ignition/tools/2.nix {};
    tools = tools2;

    transport8 = pkgs.callPackage ./ignition/transport/8.nix {};
    # transport11 = pkgs.callPackage ./ignition/transport { };
    transport13 = pkgs.callPackage ./ignition/transport/13.nix {};
    transport = transport13;

    utils1 = pkgs.callPackage ./ignition/utils/1.nix {};
    utils2 = pkgs.callPackage ./ignition/utils/2.nix {};
    utils = utils2;

    plugin2 = pkgs.callPackage ./ignition/plugin/2.nix {};
    plugin = plugin2;

    physics7 = pkgs.callPackage ./ignition/physics/7.nix {};
    physics = physics7;

    rendering8 = pkgs.libsForQt5.callPackage ./ignition/rendering/8.nix {};
    rendering = rendering8;
    gui8 = pkgs.libsForQt5.callPackage ./ignition/gui/8.nix {};
    gui = gui8;
    sensors8 = pkgs.libsForQt5.callPackage ./ignition/sensors/8.nix {};
    sensors = sensors8;
    launch7 = pkgs.libsForQt5.callPackage ./ignition/launch/7.nix {};
    launch = launch7;
    sim8 = pkgs.libsForQt5.callPackage ./ignition/sim/8.nix {};
    sim = sim8;
  };
  sdformat_9 = pkgs.callPackage ./sdformat/9.nix {};
  sdformat_13 = pkgs.callPackage ./sdformat/13.nix {};
  sdformat_14 = pkgs.callPackage ./sdformat/14.nix {};
  sdformat = sdformat_14;
  ogre1_9 = pkgs.callPackage ./ogre/1.9.nix {};
  ogre-next = pkgs.callPackage ./ogre-next {};
}
