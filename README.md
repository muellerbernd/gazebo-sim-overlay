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

CURRENTLY NOT WORKING !!!

# TODO

- [ ] get gz-sim working

## current errors

### gz-physics-dartsim-plugin not found

```bash
gz sim -s
Library error: libgz-tools2-backward.so not found. Improved backtrace generation will be disabled
[Err] [Physics.cc:816] Failed to find plugin [gz-physics-dartsim-plugin]. Have you checked the GZ_SIM_PHYSICS_ENGINE_PATH environment variable?
```

- fix for now: use other engine [official doc](https://gazebosim.org/api/sim/8/physics.html)

```bash
gz sim --physics-engine gz-physics-bullet-plugin
```

### ogre2 not found

```bash
gz sim --physics-engine gz-physics-bullet-plugin
Library error: libgz-tools2-backward.so not found. Improved backtrace generation will be disabled
[GUI] [Err] [Dialog.cc:131] Failed to save file: /home/bernd/.gz/sim/8/gui.config.
Check file permissions.
[GUI] [Err] [RenderEngineManager.cc:477] Failed to load plugin [ogre2] : couldn't find shared library.
[GUI] [Err] [RenderEngineManager.cc:477] Failed to load plugin [ogre2] : couldn't find shared library.
```

- for now use ogre

```bash
gz sim --physics-engine gz-physics-bullet-plugin --render-engine ogre
```
