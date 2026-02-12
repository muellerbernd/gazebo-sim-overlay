{
  pkgs ? import <nixpkgs> { },
  ...
}:
rec {
  gazebo_classic = pkgs.libsForQt5.callPackage ./gazebo-classic { };
  # gazebo_sim = pkgs.callPackage ./gazebo-sim {};
  gazebo = gazebo_classic;
  gazebo_11 = gazebo_classic;
  gz-harmonic = pkgs.callPackage ./ignition/sim/8.nix { };
  gz-ionic = pkgs.callPackage ./ignition/sim/9.nix { };
  ignition-fortress = pkgs.callPackage ./ignition/sim/6.nix { };

  libdart = pkgs.callPackage ./libdart { };

  ignition = rec {
    cmake0 = pkgs.callPackage ./ignition/cmake/0.nix { };
    cmake2 = pkgs.callPackage ./ignition/cmake { };
    cmake3 = pkgs.callPackage ./ignition/cmake/3.nix { };
    cmake4 = pkgs.callPackage ./ignition/cmake/4.nix { };
    cmake = cmake4;

    common3 = pkgs.callPackage ./ignition/common/3.nix { };
    common4 = pkgs.callPackage ./ignition/common/4.nix { };
    common5 = pkgs.callPackage ./ignition/common/5.nix { };
    common6 = pkgs.callPackage ./ignition/common/6.nix { };
    common = common6;

    fuel-tools4 = pkgs.callPackage ./ignition/fuel-tools/4.nix { };
    fuel-tools7 = pkgs.callPackage ./ignition/fuel-tools/7.nix { };
    fuel-tools9 = pkgs.callPackage ./ignition/fuel-tools/9.nix { };
    fuel-tools10 = pkgs.callPackage ./ignition/fuel-tools/10.nix { };
    fuel-tools = fuel-tools10;

    math4 = pkgs.callPackage ./ignition/math/4.nix { };
    math6 = pkgs.callPackage ./ignition/math/6.nix { };
    math7 = pkgs.callPackage ./ignition/math/7.nix { };
    math8 = pkgs.callPackage ./ignition/math/8.nix { };
    math = math8;

    msgs5 = pkgs.callPackage ./ignition/msgs/5.nix { };
    msgs8 = pkgs.callPackage ./ignition/msgs/8.nix { };
    msgs10 = pkgs.callPackage ./ignition/msgs/10.nix { };
    msgs11 = pkgs.callPackage ./ignition/msgs/11.nix { };
    msgs = msgs11;

    tools1 = pkgs.callPackage ./ignition/tools/1.nix {
      inherit (pkgs.libsForQt5)
        wrapQtAppsHook
        qtquickcontrols2
        qtgraphicaleffects
        ;

    };
    tools2 = pkgs.callPackage ./ignition/tools/2.nix {
      inherit (pkgs.libsForQt5)
        wrapQtAppsHook
        qtquickcontrols2
        qtgraphicaleffects
        ;
    };
    tools = tools2;

    transport8 = pkgs.callPackage ./ignition/transport/8.nix { };
    transport11 = pkgs.callPackage ./ignition/transport/11.nix { };
    transport13 = pkgs.callPackage ./ignition/transport/13.nix { };
    transport14 = pkgs.callPackage ./ignition/transport/14.nix { };
    transport = transport14;

    utils1 = pkgs.callPackage ./ignition/utils/1.nix { };
    utils2 = pkgs.callPackage ./ignition/utils/2.nix { };
    utils3 = pkgs.callPackage ./ignition/utils/3.nix { };
    utils = utils3;

    plugin1 = pkgs.callPackage ./ignition/plugin/1.nix { };
    plugin2 = pkgs.callPackage ./ignition/plugin/2.nix { };
    plugin3 = pkgs.callPackage ./ignition/plugin/3.nix { };
    plugin = plugin3;

    physics5 = pkgs.callPackage ./ignition/physics/5.nix { };
    physics7 = pkgs.callPackage ./ignition/physics/7.nix { };
    physics8 = pkgs.callPackage ./ignition/physics/8.nix { };
    physics = physics8;

    rendering6 = pkgs.callPackage ./ignition/rendering/6.nix { };
    rendering8 = pkgs.callPackage ./ignition/rendering/8.nix { };
    rendering9 = pkgs.callPackage ./ignition/rendering/9.nix { };
    rendering = rendering9;
    gui6 = pkgs.callPackage ./ignition/gui/6.nix {
      inherit (pkgs.libsForQt5)
        qtbase
        qtquickcontrols2
        qtdeclarative
        qwt
        wrapQtAppsHook
        ;
    };
    gui8 = pkgs.callPackage ./ignition/gui/8.nix {
      inherit (pkgs.libsForQt5)
        qtbase
        qtquickcontrols2
        qtdeclarative
        qwt
        wrapQtAppsHook
        ;
    };
    gui9 = pkgs.callPackage ./ignition/gui/9.nix {
      inherit (pkgs.libsForQt5)
        qtbase
        qtquickcontrols2
        qtdeclarative
        qwt
        wrapQtAppsHook
        ;
    };
    gui = gui9;
    sensors6 = pkgs.callPackage ./ignition/sensors/6.nix {
      inherit (pkgs.libsForQt5) wrapQtAppsHook;
    };
    sensors8 = pkgs.callPackage ./ignition/sensors/8.nix {
      inherit (pkgs.libsForQt5) wrapQtAppsHook;
    };
    sensors9 = pkgs.callPackage ./ignition/sensors/9.nix {
      inherit (pkgs.libsForQt5) wrapQtAppsHook;
    };
    sensors = sensors9;
    launch7 = pkgs.callPackage ./ignition/launch/7.nix {
      inherit (pkgs.libsForQt5)
        qtbase
        qtquickcontrols2
        qwt
        wrapQtAppsHook
        ;
    };
    launch = launch7;
    sim6 = pkgs.callPackage ./ignition/sim/6.nix {
      inherit (pkgs.libsForQt5)
        qtbase
        qwt
        qtdeclarative
        qtgraphicaleffects
        qtquickcontrols
        qtquickcontrols2
        ;
    };
    sim8 = pkgs.callPackage ./ignition/sim/8.nix {
      inherit (pkgs.libsForQt5)
        qtbase
        qwt
        qtdeclarative
        qtgraphicaleffects
        qtquickcontrols
        qtquickcontrols2
        ;
    };
    sim9 = pkgs.callPackage ./ignition/sim/9.nix {
      inherit (pkgs.libsForQt5)
        qtbase
        qwt
        qtdeclarative
        qtgraphicaleffects
        qtquickcontrols
        qtquickcontrols2
        ;
    };
    sim = sim9;
  };
  sdformat_9 = pkgs.callPackage ./sdformat/9.nix { };
  sdformat_12 = pkgs.callPackage ./sdformat/12.nix { };
  sdformat_13 = pkgs.callPackage ./sdformat/13.nix { };
  sdformat_14 = pkgs.callPackage ./sdformat/14.nix { };
  sdformat_15 = pkgs.callPackage ./sdformat/15.nix { };
  sdformat = sdformat_15;
  ogre1_9 = pkgs.callPackage ./ogre/1.9.nix { };
  ogre-next = pkgs.callPackage ./ogre-next { };
}
