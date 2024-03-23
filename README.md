# gazebo-sim-overlay

This repo provides a overlay for the [Gazebo simulator](https://gazebosim.org/home).
It contains all the necessities to build the "old" [gazebo-classic](https://github.com/gazebosim/gazebo-classic) and the "new" [gz-sim](https://github.com/gazebosim/gz-sim) with the [Nix](https://nixos.org/) package manager

# Structure

The structure of the repo is as follows:

```bash
.
├── README.md
├── flake.lock
├── flake.nix
├── overlay.nix
├── pkgs
└── shells
    ├── gazebo-classic.nix
    └── gazebo-ignition.nix
```

# gazebo-classic

To use gazebo-classic simply call the following command to get an development shell, in which gazebo-classic is available:

```bash
nix develop git+https://github.com/muellerbernd/gazebo-sim-overlay#classic -c $SHELL
# start gazebo-classic
gazebo
```

# gz-sim

To use gz-sim simply call the following command to get an development shell, in which gz-sim is available:

```bash
nix develop git+https://github.com/muellerbernd/gazebo-sim-overlay#default -c $SHELL
# start gz-sim
gz sim
```

Is NOW WORKING !!!

- use alternative physics-engine or render-engine

```bash
gz sim --physics-engine gz-physics-bullet-plugin --render-engine ogre
```
