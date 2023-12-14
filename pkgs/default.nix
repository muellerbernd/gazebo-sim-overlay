self: super:
with self.lib; {
  gazebo_sim = self.libsForQt5.callPackage ./ignition-gazebo { };

  gz-cmake_3 = self.callPackage ./ignition-gazebo/gz-cmake/3.nix { };

  gz-math_7 = self.callPackage ./ignition-gazebo/gz-math/7.nix { };

  gz-utils_2 = self.callPackage ./ignition-gazebo/gz-utils/2.nix { };

  ignition = {
    # cmake0 = self.callPackage ./ignition/cmake/0.nix { };
    cmake2 = self.callPackage ./ignition/cmake { };
    cmake3 = self.callPackage ./ignition/cmake/3.nix { };
    cmake = self.ignition.cmake3;

    # common3 = self.callPackage ./ignition/common/3.nix { };
    # common4 = self.callPackage ./ignition/common { };
    common5 = self.callPackage ./ignition/common/5.nix { };
    common = self.ignition.common5;

    # fuel-tools4 = self.callPackage ./ignition/fuel-tools/4.nix { };
    # fuel-tools7 = self.callPackage ./ignition/fuel-tools { };
    fuel-tools9 = self.callPackage ./ignition/fuel-tools/9.nix { };
    fuel-tools = self.ignition.fuel-tools9;

    # math4 = self.callPackage ./ignition/math/4.nix { };
    # math6 = self.callPackage ./ignition/math { };
    math7 = self.callPackage ./ignition/math/7.nix { };
    math = self.ignition.math7;

    # msgs5 = self.callPackage ./ignition/msgs/5.nix { };
    # msgs8 = self.callPackage ./ignition/msgs { };
    msgs10 = self.callPackage ./ignition/msgs/10.nix { };
    msgs = self.ignition.msgs10;

    tools = self.callPackage ./ignition/tools { };

    # transport8 = self.callPackage ./ignition/transport/8.nix { };
    # transport11 = self.callPackage ./ignition/transport { };
    transport13 = self.callPackage ./ignition/transport/13.nix { };
    transport = self.ignition.transport13;

    utils1 = self.callPackage ./ignition/utils { };
    utils2 = self.callPackage ./ignition/utils/2.nix { };
    utils = self.ignition.utils2;
  };
  # sdformat_9 = self.callPackage ./sdformat/9.nix { };
  # sdformat_13 = self.callPackage ./sdformat/13.nix { };
  sdformat_14 = self.callPackage ./sdformat/14.nix { };
  sdformat = self.sdformat_14;

}

