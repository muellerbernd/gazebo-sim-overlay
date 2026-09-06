{
  pkgs ? import <nixpkgs> { },
  ...
}:
let
  qt6Scope = pkgs.qt6Packages;
in
rec {
  freeimage = pkgs.callPackage ./freeimage { };

  gazebo_classic = pkgs.libsForQt5.callPackage ./gazebo-classic { };
  gazebo = gazebo_classic;
  gazebo_11 = gazebo_classic;
  gz-harmonic = pkgs.libsForQt5.callPackage ./gazebo-sim/8.nix { };
  gz-ionic = pkgs.libsForQt5.callPackage ./gazebo-sim/9.nix { };
  gz-jetty = qt6Scope.callPackage ./gazebo-sim/10.nix {
    inherit freeimage sdformat_16 ignition;
  };
  gazebo-sim-10 = gz-jetty;
  gazebo_jetty = gz-jetty;
  ignition-fortress = pkgs.libsForQt5.callPackage ./gazebo-sim/6.nix { };

  libdart = pkgs.callPackage ./libdart { };

  ignition = rec {
    cmake0 = pkgs.callPackage ./ignition/cmake/0.nix { };
    cmake2 = pkgs.callPackage ./ignition/cmake { };
    cmake3 = pkgs.callPackage ./ignition/cmake/3.nix { };
    cmake5 = pkgs.callPackage ./ignition/cmake/5.nix { };
    cmake4 = pkgs.callPackage ./ignition/cmake/4.nix { };
    cmake = cmake5;

    common3 = pkgs.callPackage ./ignition/common/3.nix { };
    common4 = pkgs.callPackage ./ignition/common/4.nix { };
    common5 = pkgs.callPackage ./ignition/common/5.nix { };
    common6 = pkgs.callPackage ./ignition/common/6.nix { inherit freeimage; };
    common7 = pkgs.callPackage ./ignition/common/7.nix { 
      inherit freeimage;
    };
    common = common7;

    fuel-tools4 = pkgs.callPackage ./ignition/fuel-tools/4.nix { };
    fuel-tools7 = pkgs.callPackage ./ignition/fuel-tools/7.nix { };
    fuel-tools9 = pkgs.callPackage ./ignition/fuel-tools/9.nix { };
    fuel-tools10 = pkgs.callPackage ./ignition/fuel-tools/10.nix { };
    fuel-tools11 = pkgs.callPackage ./ignition/fuel-tools/11.nix { };
    fuel-tools = fuel-tools11;

    math4 = pkgs.callPackage ./ignition/math/4.nix { };
    math6 = pkgs.callPackage ./ignition/math/6.nix { };
    math7 = pkgs.callPackage ./ignition/math/7.nix { };
    math8 = pkgs.callPackage ./ignition/math/8.nix { };
    math9 = pkgs.callPackage ./ignition/math/9.nix { };
    math = math9;

    msgs5 = pkgs.callPackage ./ignition/msgs/5.nix { };
    msgs8 = pkgs.callPackage ./ignition/msgs/8.nix { };
    msgs10 = pkgs.callPackage ./ignition/msgs/10.nix { };
    msgs11 = pkgs.callPackage ./ignition/msgs/11.nix { };
    msgs12 = pkgs.callPackage ./ignition/msgs/12.nix { };
    msgs = msgs12;

    tools1 = pkgs.libsForQt5.callPackage ./ignition/tools/1.nix { };
    tools2 = pkgs.libsForQt5.callPackage ./ignition/tools/2.nix { };
    tools = tools2;
    # Qt6 version of tools
    tools2-qt6 = qt6Scope.callPackage ./ignition/tools/2.nix { 
      ignition-cmake = cmake5;
    };

    transport8 = pkgs.callPackage ./ignition/transport/8.nix { };
    transport11 = pkgs.callPackage ./ignition/transport/11.nix { };
    transport13 = pkgs.callPackage ./ignition/transport/13.nix { };
    transport14 = pkgs.callPackage ./ignition/transport/14.nix { };
    transport15 = pkgs.callPackage ./ignition/transport/15.nix { 
      ignition-tools = tools2-qt6;
    };
    transport = transport15;

    utils1 = pkgs.callPackage ./ignition/utils/1.nix { };
    utils2 = pkgs.callPackage ./ignition/utils/2.nix { };
    utils3 = pkgs.callPackage ./ignition/utils/3.nix { };
    utils4 = pkgs.callPackage ./ignition/utils/4.nix { };
    utils = utils4;

    plugin1 = pkgs.callPackage ./ignition/plugin/1.nix { };
    plugin2 = pkgs.callPackage ./ignition/plugin/2.nix { };
    plugin3 = pkgs.callPackage ./ignition/plugin/3.nix { };
    plugin4 = pkgs.callPackage ./ignition/plugin/4.nix { };
    plugin = plugin4;

    physics5 = pkgs.callPackage ./ignition/physics/5.nix { };
    physics7 = pkgs.callPackage ./ignition/physics/7.nix { };
    physics8 = pkgs.callPackage ./ignition/physics/8.nix { sdformat = sdformat_15; };
    physics9 = pkgs.callPackage ./ignition/physics/9.nix { };
    physics = physics9;

    rendering6 = pkgs.libsForQt5.callPackage ./ignition/rendering/6.nix { };
    rendering8 = pkgs.libsForQt5.callPackage ./ignition/rendering/8.nix { };
    rendering9 = pkgs.libsForQt5.callPackage ./ignition/rendering/9.nix { };
    rendering10 = qt6Scope.callPackage ./ignition/rendering/10.nix {
      inherit freeimage;
      ignition-math = math9;
      ignition-plugin = plugin4;
      ignition-common = common7;
      ignition-cmake = cmake5;
    };
    rendering = rendering10;
    
    gui6 = pkgs.libsForQt5.callPackage ./ignition/gui/6.nix { };
    gui8 = pkgs.libsForQt5.callPackage ./ignition/gui/8.nix { };
    gui9 = pkgs.libsForQt5.callPackage ./ignition/gui/9.nix { };
    gui10 = qt6Scope.callPackage ./ignition/gui/10.nix { 
      inherit freeimage;
      ignition-tools = tools2-qt6;
      ignition-rendering = rendering10;
      ignition-transport = transport15;
      ignition-msgs = msgs12;
      ignition-common = common7;
      ignition-plugin = plugin4;
      ignition-math = math9;
      ignition-cmake = cmake5;
    };
    gui = gui10;
    
    sensors6 = pkgs.libsForQt5.callPackage ./ignition/sensors/6.nix { };
    sensors8 = pkgs.libsForQt5.callPackage ./ignition/sensors/8.nix { };
    sensors9 = pkgs.libsForQt5.callPackage ./ignition/sensors/9.nix { sdformat = sdformat_15; };
    sensors10 = qt6Scope.callPackage ./ignition/sensors/10.nix { 
      inherit freeimage;
      ignition-rendering = rendering10;
      ignition-transport = transport15;
      ignition-msgs = msgs12;
      ignition-common = common7;
      ignition-plugin = plugin4;
      ignition-cmake = cmake5;
    };
    sensors = sensors10;
    
    launch7 = pkgs.libsForQt5.callPackage ./ignition/launch/7.nix { };
    launch9 = qt6Scope.callPackage ./ignition/launch/9.nix { 
      inherit freeimage;
      qwt = pkgs.qt6Packages.qwt;
      ignition-tools = tools2-qt6;
      ignition-rendering = rendering10;
      ignition-transport = transport15;
      ignition-msgs = msgs12;
      ignition-common = common7;
      ignition-plugin = plugin4;
      ignition-math = math9;
      ignition-cmake = cmake5;
      ignition-sim = sim10;
      ignition-fuel-tools = fuel-tools11;
      ignition-physics = physics9;
      ignition-sensors = sensors10;
      ignition-gui = gui10;
    };
    launch = launch9;
    
    sim6 = pkgs.libsForQt5.callPackage ./ignition/sim/6.nix { };
    sim8 = pkgs.libsForQt5.callPackage ./ignition/sim/8.nix { };
    sim9 = pkgs.libsForQt5.callPackage ./ignition/sim/9.nix { sdformat = sdformat_15; };
    sim10 = qt6Scope.callPackage ./ignition/sim/10.nix { 
      inherit freeimage;
      ignition-tools = tools2-qt6;
      ignition-rendering = rendering10;
      ignition-transport = transport15;
      ignition-msgs = msgs12;
      ignition-common = common7;
      ignition-plugin = plugin4;
      ignition-math = math9;
      ignition-cmake = cmake5;
      ignition-fuel-tools = fuel-tools11;
      ignition-physics = physics9;
      ignition-sensors = sensors10;
      ignition-gui = gui10;
      ignition-utils = utils4;
    };
    sim = sim10;
  };
  
  # Top-level aliases with gz- prefix
  gz-cmake = ignition.cmake;
  gz-common = ignition.common;
  gz-fuel-tools = ignition.fuel-tools;
  gz-sim = ignition.sim;
  gz-gui = ignition.gui;
  gz-launch = ignition.launch;
  gz-math = ignition.math;
  gz-msgs = ignition.msgs;
  gz-physics = ignition.physics;
  gz-plugin = ignition.plugin;
  gz-rendering = ignition.rendering;
  gz-sensors = ignition.sensors;
  gz-tools = ignition.tools;
  gz-transport = ignition.transport;
  gz-utils = ignition.utils;

  sdformat_9 = pkgs.callPackage ./sdformat/9.nix { };
  sdformat_12 = pkgs.callPackage ./sdformat/12.nix { };
  sdformat_13 = pkgs.callPackage ./sdformat/13.nix { };
  sdformat_14 = pkgs.callPackage ./sdformat/14.nix { };
  sdformat_15 = pkgs.callPackage ./sdformat/15.nix { };
  sdformat_16 = pkgs.callPackage ./sdformat/16.nix { };
  sdformat = sdformat_16;
  
  ogre1_9 = pkgs.callPackage ./ogre/1.9.nix { };
  ogre-next = pkgs.callPackage ./ogre-next { };
}
