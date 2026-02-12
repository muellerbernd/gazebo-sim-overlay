# gazebo-sim-overlay

A Nix flake providing packages and overlays for the [Gazebo simulator](https://gazebosim.org/home) ecosystem.

## Overview

This repository provides Nix packages for multiple Gazebo versions and their dependencies, making it easy to use Gazebo in NixOS or with the Nix package manager.

**Supported versions:**
- **gz-sim (Harmonic)** – Latest stable release ✅
- **gz-sim (Fortress)** – Previous LTS release ✅
- **gazebo-classic** – Legacy version (EOL, currently broken) ⚠️

## Quick Start

### Using gz-sim (Harmonic)

```bash
# Launch a development shell with gz-sim
nix develop git+https://github.com/muellerbernd/gazebo-sim-overlay#default -c $SHELL

# Start the simulator
gz sim
```

**Alternative physics or render engines:**

```bash
gz sim --physics-engine gz-physics-bullet-plugin --render-engine ogre
```

### Using gz-sim (Fortress)

```bash
# Launch a development shell with gz-sim Fortress
nix develop git+https://github.com/muellerbernd/gazebo-sim-overlay#fortress -c $SHELL

# Start the simulator
gz sim
```

### Using gazebo-classic

> ⚠️ **Note:** Gazebo Classic is EOL and currently broken in this overlay.

```bash
nix develop git+https://github.com/muellerbernd/gazebo-sim-overlay#classic -c $SHELL
gazebo
```

## Using as an Overlay

Add this flake as an input to your own `flake.nix`:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    gazebo-sim-overlay.url = "github:muellerbernd/gazebo-sim-overlay";
  };

  outputs = { self, nixpkgs, gazebo-sim-overlay }: {
    # Apply the overlay
    nixpkgs.overlays = [ gazebo-sim-overlay.overlays.default ];
  };
}
```

## Repository Structure

```
.
├── flake.nix              # Flake definition and outputs
├── flake.lock             # Locked dependencies
├── overlays/
│   └── default.nix        # Overlay definition
├── pkgs/                  # Package definitions
│   ├── default.nix        # Package set
│   ├── gazebo-classic/    # Gazebo Classic (legacy)
│   ├── gazebo-sim/        # gz-sim packages
│   ├── ignition/          # Ignition libraries
│   ├── libdart/           # DART physics engine
│   ├── ogre/              # OGRE 1.x graphics engine
│   ├── ogre-next/         # OGRE 2.x (OGRE-Next)
│   └── sdformat/          # SDF format library
├── shell.nix              # Legacy nix-shell support
├── treefmt.nix            # Code formatting configuration
└── README.md
```

## Alternatives

Development of this overlay is sporadic. For production use or more actively maintained alternatives, consider:

- **[gazebros2nix](https://github.com/Gepetto/gazeboros2nix)** – Gazebo with ROS 2 integration
- **[nix-ros-overlay](https://github.com/lopsided98/nix-ros-overlay)** – Comprehensive ROS and Gazebo packages

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.
