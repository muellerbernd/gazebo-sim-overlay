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

## Errors

gz gui -l
Library error: libgz-tools2-backward.so not found. Improved backtrace generation will be disabled
Library error: [/nix/store/s8qixldk9fbj5g8gvrm3qhpjsxsyy6ml-gz-gui8-8.0.0/nix/store/s8qixldk9fbj5g8gvrm3qhpjsxsyy6ml-gz-gui8-8.0.0/lib/libgz-gui8.so.8.0.0] not found.

gz model --list
Library error: libgz-tools2-backward.so not found. Improved backtrace generation will be disabled
Library error for [/nix/store/20ad7vivzg9wyanlmdc3rwys0ywn4g04-gazebo-sim-gz-sim8_8.0.0/nix/store/20ad7vivzg9wyanlmdc3rwys0ywn4g04-gazebo-sim-gz-sim8_8.0.0/lib/libgz-sim8-gz.so.8.0.0]: /nix/store/20ad7vivzg9wyanlmdc3rwys0ywn4g04-gazebo-sim-gz-sim8_8.0.0/nix/store/20ad7vivzg9wyanlmdc3rwys0ywn4g04-gazebo-sim-gz-sim8_8.0.0/lib/libgz-sim8-gz.so.8.0.0: cannot open shared object file: No such file or directory

gz msg -l
Library error: libgz-tools2-backward.so not found. Improved backtrace generation will be disabled
Library error: [/nix/store/ga0a19a4jqs9m2sd0k6kxxk23s62xixa-gz-msgs10-10.0.0/nix/store/ga0a19a4jqs9m2sd0k6kxxk23s62xixa-gz-msgs10-10.0.0/lib/libgz-msgs10.so.10.0.0] not found.

gz plugin -l
Library error: libgz-tools2-backward.so not found. Improved backtrace generation will be disabled
/nix/store/s15r0a6a5ssqd06kkbfn24c0dlysdww5-gz-plugin2-2.0.2/lib/ruby/gz/cmdplugin2.rb:42:in ``': No such file or directory - /nix/store/s15r0a6a5ssqd06kkbfn24c0dlysdww5-gz-plugin2-2.0.2/nix/store/s15r0a6a5ssqd06kkbfn24c0dlysdww5-gz-plugin2-2.0.2/libexec/gz/plugin2/gz-plugin (Errno::ENOENT)
        from /nix/store/s15r0a6a5ssqd06kkbfn24c0dlysdww5-gz-plugin2-2.0.2/lib/ruby/gz/cmdplugin2.rb:42:in `execute'
        from /nix/store/qi4n9b256w2jggyysn50qjrypllsdwlb-gazebo_new/bin/gz:308:in `<main>'

gz topic -l
Library error: libgz-tools2-backward.so not found. Improved backtrace generation will be disabled
/nix/store/98hk93bsqp09c0h71sxlwspks6fbjwzv-gz-transport13-13.0.0/lib/ruby/gz/cmdtransport13.rb:43:in ``': No such file or directory - /nix/store/98hk93bsqp09c0h71sxlwspks6fbjwzv-gz-transport13-13.0.0/nix/store/98hk93bsqp09c0h71sxlwspks6fbjwzv-gz-transport13-13.0.0/libexec/gz/transport13/gz-transport-topic (Errno::ENOENT)
        from /nix/store/98hk93bsqp09c0h71sxlwspks6fbjwzv-gz-transport13-13.0.0/lib/ruby/gz/cmdtransport13.rb:43:in `execute'
        from /nix/store/qi4n9b256w2jggyysn50qjrypllsdwlb-gazebo_new/bin/gz:308:in `<main>'

gz service -l
Library error: libgz-tools2-backward.so not found. Improved backtrace generation will be disabled
/nix/store/98hk93bsqp09c0h71sxlwspks6fbjwzv-gz-transport13-13.0.0/lib/ruby/gz/cmdtransport13.rb:43:in ``': No such file or directory - /nix/store/98hk93bsqp09c0h71sxlwspks6fbjwzv-gz-transport13-13.0.0/nix/store/98hk93bsqp09c0h71sxlwspks6fbjwzv-gz-transport13-13.0.0/libexec/gz/transport13/gz-transport-service (Errno::ENOENT)
        from /nix/store/98hk93bsqp09c0h71sxlwspks6fbjwzv-gz-transport13-13.0.0/lib/ruby/gz/cmdtransport13.rb:43:in `execute'
        from /nix/store/qi4n9b256w2jggyysn50qjrypllsdwlb-gazebo_new/bin/gz:308:in `<main>'

gz param -l
Library error: libgz-tools2-backward.so not found. Improved backtrace generation will be disabled
Library error for [/nix/store/98hk93bsqp09c0h71sxlwspks6fbjwzv-gz-transport13-13.0.0/nix/store/98hk93bsqp09c0h71sxlwspks6fbjwzv-gz-transport13-13.0.0/lib/libgz-transport13-parameters.so.13.0.0]: /nix/store/98hk93bsqp09c0h71sxlwspks6fbjwzv-gz-transport13-13.0.0/nix/store/98hk93bsqp09c0h71sxlwspks6fbjwzv-gz-transport13-13.0.0/lib/libgz-transport13-parameters.so.13.0.0: cannot open shared object file: No such file or directory
