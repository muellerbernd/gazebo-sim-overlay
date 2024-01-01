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

```bash
gz sim -s
Library error: libgz-tools2-backward.so not found. Improved backtrace generation will be disabled
[Err] [Physics.cc:816] Failed to find plugin [gz-physics-dartsim-plugin]. Have you checked the GZ_SIM_PHYSICS_ENGINE_PATH environment variable?

gz gui -v
Library error: libgz-tools2-backward.so not found. Improved backtrace generation will be disabled
[GUI] [Wrn] [Application.cc:904] [QT] QQmlApplicationEngine failed to load component
[GUI] [Wrn] [Application.cc:904] [QT] qrc:qml/Main.qml:21:1: module "QtQuick.Layouts" is not installed
[GUI] [Wrn] [Application.cc:904] [QT] qrc:qml/Main.qml:20:1: module "QtQuick.Dialogs" is not installed
[GUI] [Wrn] [Application.cc:904] [QT] qrc:qml/Main.qml:19:1: module "QtQuick.Controls.Material" is not installed
[GUI] [Wrn] [Application.cc:904] [QT] qrc:qml/Main.qml:18:1: module "QtQuick.Controls" is not installed
[GUI] [Wrn] [Application.cc:904] [QT] qrc:qml/Main.qml:21:1: module "QtQuick.Layouts" is not installed
[GUI] [Wrn] [Application.cc:904] [QT] qrc:qml/Main.qml:20:1: module "QtQuick.Dialogs" is not installed
[GUI] [Wrn] [Application.cc:904] [QT] qrc:qml/Main.qml:19:1: module "QtQuick.Controls.Material" is not installed
[GUI] [Wrn] [Application.cc:904] [QT] qrc:qml/Main.qml:18:1: module "QtQuick.Controls" is not installed
[GUI] [Wrn] [Application.cc:904] [QT] qrc:qml/Main.qml:21:1: module "QtQuick.Layouts" is not installed
[GUI] [Wrn] [Application.cc:904] [QT] qrc:qml/Main.qml:20:1: module "QtQuick.Dialogs" is not installed
[GUI] [Wrn] [Application.cc:904] [QT] qrc:qml/Main.qml:19:1: module "QtQuick.Controls.Material" is not installed
[GUI] [Wrn] [Application.cc:904] [QT] qrc:qml/Main.qml:18:1: module "QtQuick.Controls" is not installed
[GUI] [Wrn] [Application.cc:904] [QT] qrc:qml/Main.qml:21:1: module "QtQuick.Layouts" is not installed
[GUI] [Wrn] [Application.cc:904] [QT] qrc:qml/Main.qml:20:1: module "QtQuick.Dialogs" is not installed
[GUI] [Wrn] [Application.cc:904] [QT] qrc:qml/Main.qml:19:1: module "QtQuick.Controls.Material" is not installed
[GUI] [Wrn] [Application.cc:904] [QT] qrc:qml/Main.qml:18:1: module "QtQuick.Controls" is not installed
[GUI] [Err] [MainWindow.cc:116] Internal error: Failed to instantiate QML file [qrc:qml/Main.qml]
[GUI] [Err] [Application.cc:207] Failed to initialize main window.

```
