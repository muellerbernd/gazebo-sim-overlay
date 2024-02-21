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

### crashes

```bash
/nix/store/zf641vp3qv7sh48742pf45dwnh8qqhf7-gazebo-sim-gz-sim8_8.0.0/lib/ruby/gz/cmdsim8.rb:510: [BUG] Segmentation fault at 0x0000000000000000
ruby 3.1.4p223 (2023-03-30 revision 957bb7cb81) [x86_64-linux]

-- Control frame information -----------------------------------------------
c:0007 p:---- s:0064 e:000063 CFUNC  :call
c:0006 p:0016 s:0055 e:000054 METHOD /nix/store/zf641vp3qv7sh48742pf45dwnh8qqhf7-gazebo-sim-gz-sim8_8.0.0/lib/ruby/gz/cmdsim8.rb:510
c:0005 p:0079 s:0049 e:000048 BLOCK  /nix/store/zf641vp3qv7sh48742pf45dwnh8qqhf7-gazebo-sim-gz-sim8_8.0.0/lib/ruby/gz/cmdsim8.rb:562 [FINISH]
c:0004 p:---- s:0046 e:000045 CFUNC  :fork
c:0003 p:0721 s:0042 e:000041 METHOD /nix/store/zf641vp3qv7sh48742pf45dwnh8qqhf7-gazebo-sim-gz-sim8_8.0.0/lib/ruby/gz/cmdsim8.rb:558
c:0002 p:0718 s:0020 E:0009e0 EVAL   /nix/store/jbps3v347b7wq4a52cv6bl6wdhi86r9k-gz-tools2-2.0.0/bin/.gz-wrapped:308 [FINISH]
c:0001 p:0000 s:0003 E:001510 (none) [FINISH]

-- Ruby level backtrace information ----------------------------------------
/nix/store/jbps3v347b7wq4a52cv6bl6wdhi86r9k-gz-tools2-2.0.0/bin/.gz-wrapped:308:in `<main>'
/nix/store/zf641vp3qv7sh48742pf45dwnh8qqhf7-gazebo-sim-gz-sim8_8.0.0/lib/ruby/gz/cmdsim8.rb:558:in `execute'
/nix/store/zf641vp3qv7sh48742pf45dwnh8qqhf7-gazebo-sim-gz-sim8_8.0.0/lib/ruby/gz/cmdsim8.rb:558:in `fork'
/nix/store/zf641vp3qv7sh48742pf45dwnh8qqhf7-gazebo-sim-gz-sim8_8.0.0/lib/ruby/gz/cmdsim8.rb:562:in `block in execute'
/nix/store/zf641vp3qv7sh48742pf45dwnh8qqhf7-gazebo-sim-gz-sim8_8.0.0/lib/ruby/gz/cmdsim8.rb:510:in `runGui'
/nix/store/zf641vp3qv7sh48742pf45dwnh8qqhf7-gazebo-sim-gz-sim8_8.0.0/lib/ruby/gz/cmdsim8.rb:510:in `call'

-- Machine register context ------------------------------------------------
 RIP: 0x00007fff9e09961f RBP: 0x0000000000000000 RSP: 0x00007fffffff6790
 RAX: 0x000000000273abf0 RBX: 0x0000000001cd9480 RCX: 0x0000000003b97510
 RDX: 0x0000000000000008 RDI: 0x0000000000000000 RSI: 0x0000000002d1da60
  R8: 0x0000000000000005  R9: 0x0000000000000004 R10: 0x0000000000000007
 R11: 0x0000000003b97510 R12: 0x00007fffffff69a0 R13: 0x0000000000000001
 R14: 0x00000000006d23e0 R15: 0x00000000ffffffff EFL: 0x0000000000010246

-- C level backtrace information -------------------------------------------
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/libruby-3.1.4.so.3.1(rb_vm_bugreport+0x50a) [0x7ffff7cb253a]
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/libruby-3.1.4.so.3.1(0xd0cf0) [0x7ffff7ad0cf0]
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/libruby-3.1.4.so.3.1(0x20461b) [0x7ffff7c0461b]
/nix/store/cyrrf49i2hm1w7vn2j945ic3rrzgxbqs-glibc-2.38-44/lib/libc.so.6(__restore_rt+0x0) [0x7ffff7854eb0]
/nix/store/zf641vp3qv7sh48742pf45dwnh8qqhf7-gazebo-sim-gz-sim8_8.0.0/lib/gz-sim-8/plugins/gui/libSelectEntities.so(_ZN2gz3sim3gui14SelectEntities11eventFilterEP7QObjectP6QEvent+0x3df) [0x7fff9e09961f]
/nix/store/znk677nrcipl9jrnwjfzfx65wdmh77iy-qtbase-5.15.12/lib/libQt5Core.so.5(_ZN23QCoreApplicationPrivate29sendThroughObjectEventFiltersEP7QObjectP6QEvent+0x93) [0x7fffedcdb9d3]
/nix/store/znk677nrcipl9jrnwjfzfx65wdmh77iy-qtbase-5.15.12/lib/libQt5Widgets.so.5(_ZN19QApplicationPrivate13notify_helperEP7QObjectP6QEvent+0x6e) [0x7fffee970dbe]
/nix/store/znk677nrcipl9jrnwjfzfx65wdmh77iy-qtbase-5.15.12/lib/libQt5Core.so.5(_ZN16QCoreApplication15notifyInternal2EP7QObjectP6QEvent+0x118) [0x7fffedcdbc58]
/nix/store/zf641vp3qv7sh48742pf45dwnh8qqhf7-gazebo-sim-gz-sim8_8.0.0/lib/gz-sim-8/plugins/gui/libEntityTree.so(_ZN2gz3sim10EntityTree23OnEntitySelectedFromQmlEm+0xda) [0x7fff950d38ca]
/nix/store/zf641vp3qv7sh48742pf45dwnh8qqhf7-gazebo-sim-gz-sim8_8.0.0/lib/gz-sim-8/plugins/gui/libEntityTree.so(_ZN2gz3sim10EntityTree11qt_metacallEN11QMetaObject4CallEiPPv+0x72) [0x7fff950e90d2]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Qml.so.5(_ZNK18QQmlObjectOrGadget8metacallEN11QMetaObject4CallEiPPv+0x63) [0x7fffefccec73]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Qml.so.5(0x1ab469) [0x7fffefbab469]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Qml.so.5(_ZNK3QV413QObjectMethod12callInternalEPKNS_5ValueES3_i+0x6ab) [0x7fffefbad10b]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Qml.so.5(0x1c9e7f) [0x7fffefbc9e7f]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Qml.so.5(0x1cd57f) [0x7fffefbcd57f]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Qml.so.5(_ZN3QV48Function4callEPKNS_5ValueES3_iPKNS_16ExecutionContextE+0x192) [0x7fffefb5fa22]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Qml.so.5(_ZN24QQmlJavaScriptExpression8evaluateEPN3QV48CallDataEPb+0x1ad) [0x7fffefce99dd]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Qml.so.5(_ZN25QQmlBoundSignalExpression8evaluateEPPv+0x3bf) [0x7fffefc9a34f]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Qml.so.5(0x29b530) [0x7fffefc9b530]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Qml.so.5(_ZN12QQmlNotifier10emitNotifyEP20QQmlNotifierEndpointPPv+0x215) [0x7fffefcce755]
/nix/store/znk677nrcipl9jrnwjfzfx65wdmh77iy-qtbase-5.15.12/lib/libQt5Core.so.5(0x313ebd) [0x7fffedd13ebd]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Quick.so.5(_ZN15QQuickMouseArea7clickedEP16QQuickMouseEvent+0x42) [0x7ffff02cc332]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Quick.so.5(_ZN15QQuickMouseArea10setPressedEN2Qt11MouseButtonEbNS0_16MouseEventSourceE+0x2af) [0x7ffff02cdb4f]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Quick.so.5(_ZN15QQuickMouseArea17mouseReleaseEventEP11QMouseEvent+0x8a) [0x7ffff02cec7a]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Quick.so.5(_ZN10QQuickItem5eventEP6QEvent+0x118) [0x7ffff0264598]
/nix/store/znk677nrcipl9jrnwjfzfx65wdmh77iy-qtbase-5.15.12/lib/libQt5Widgets.so.5(_ZN19QApplicationPrivate13notify_helperEP7QObjectP6QEvent+0x7e) [0x7fffee970dce]
/nix/store/znk677nrcipl9jrnwjfzfx65wdmh77iy-qtbase-5.15.12/lib/libQt5Core.so.5(_ZN16QCoreApplication15notifyInternal2EP7QObjectP6QEvent+0x118) [0x7fffedcdbc58]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Quick.so.5(_ZN19QQuickWindowPrivate17deliverMouseEventEP23QQuickPointerMouseEvent+0xfa) [0x7ffff027f34a]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Quick.so.5(_ZN19QQuickWindowPrivate19deliverPointerEventEP18QQuickPointerEvent+0x59) [0x7ffff0280ac9]
/nix/store/r3ijpv1lwb91hfyqk17xy8zqkyj3j2i9-qtdeclarative-5.15.12/lib/libQt5Quick.so.5(_ZN19QQuickWindowPrivate16handleMouseEventEP11QMouseEvent+0x9d) [0x7ffff0281d8d]
/nix/store/znk677nrcipl9jrnwjfzfx65wdmh77iy-qtbase-5.15.12/lib/libQt5Gui.so.5(_ZN7QWindow5eventEP6QEvent+0x125) [0x7fffee13b975]
/nix/store/znk677nrcipl9jrnwjfzfx65wdmh77iy-qtbase-5.15.12/lib/libQt5Widgets.so.5(_ZN19QApplicationPrivate13notify_helperEP7QObjectP6QEvent+0x7e) [0x7fffee970dce]
/nix/store/znk677nrcipl9jrnwjfzfx65wdmh77iy-qtbase-5.15.12/lib/libQt5Core.so.5(_ZN16QCoreApplication15notifyInternal2EP7QObjectP6QEvent+0x118) [0x7fffedcdbc58]
/nix/store/znk677nrcipl9jrnwjfzfx65wdmh77iy-qtbase-5.15.12/lib/libQt5Gui.so.5(_ZN22QGuiApplicationPrivate17processMouseEventEPN29QWindowSystemInterfacePrivate10MouseEventE+0x87b) [0x7fffee12fa0b]
/nix/store/znk677nrcipl9jrnwjfzfx65wdmh77iy-qtbase-5.15.12/lib/libQt5Gui.so.5(_ZN22QWindowSystemInterface22sendWindowSystemEventsE6QFlagsIN10QEventLoop17ProcessEventsFlagEE+0xac) [0x7fffee102cac]
/nix/store/xhxa2nm4s99snk0qng6ai555z6zrj9wq-qtbase-5.15.12-bin/lib/qt-5.15.12/plugins/platforms/../../../../../znk677nrcipl9jrnwjfzfx65wdmh77iy-qtbase-5.15.12/lib/libQt5XcbQpa.so.5(_ZL17xcbSourceDispatchP8_GSourcePFiPvES1_+0x1a) [0x7fffd6ee310a]
/nix/store/hbdl12ck2ibhn5zsi8nsfa6v471pf0j6-glib-2.78.4/lib/libglib-2.0.so.0(g_main_dispatch+0x1e4) [0x7fffebb12744]
/nix/store/hbdl12ck2ibhn5zsi8nsfa6v471pf0j6-glib-2.78.4/lib/libglib-2.0.so.0(0x5d797) [0x7fffebb15797]
/nix/store/hbdl12ck2ibhn5zsi8nsfa6v471pf0j6-glib-2.78.4/lib/libglib-2.0.so.0(g_main_context_iteration+0x2c) [0x7fffebb15d8c]
/nix/store/znk677nrcipl9jrnwjfzfx65wdmh77iy-qtbase-5.15.12/lib/libQt5Core.so.5(_ZN20QEventDispatcherGlib13processEventsE6QFlagsIN10QEventLoop17ProcessEventsFlagEE+0x66) [0x7fffedd351b6]
/nix/store/znk677nrcipl9jrnwjfzfx65wdmh77iy-qtbase-5.15.12/lib/libQt5Core.so.5(_ZN10QEventLoop4execE6QFlagsINS_17ProcessEventsFlagEE+0x13b) [0x7fffedcda67b]
/nix/store/znk677nrcipl9jrnwjfzfx65wdmh77iy-qtbase-5.15.12/lib/libQt5Core.so.5(_ZN16QCoreApplication4execEv+0x90) [0x7fffedce2ef0]
/nix/store/zf641vp3qv7sh48742pf45dwnh8qqhf7-gazebo-sim-gz-sim8_8.0.0/lib/libgz-sim8-gui.so.8(_ZN2gz3sim2v83gui6runGuiERiPPcPKcS7_iS7_S7_+0x52) [0x7ffff38dc172]
/nix/store/zf641vp3qv7sh48742pf45dwnh8qqhf7-gazebo-sim-gz-sim8_8.0.0/lib/libgz-sim8-gz.so.8.0.0(runGui+0x42) [0x7ffff51c9812]
/nix/store/zabxhfpsgkb9c4sb7fy50pn1l1kczzv2-libffi-3.4.4/lib/libffi.so.8(ffi_call_unix64+0x52) [0x7ffff72be052]
/nix/store/zabxhfpsgkb9c4sb7fy50pn1l1kczzv2-libffi-3.4.4/lib/libffi.so.8(0x7ec5) [0x7ffff72bbec5]
/nix/store/zabxhfpsgkb9c4sb7fy50pn1l1kczzv2-libffi-3.4.4/lib/libffi.so.8(ffi_call+0xd8) [0x7ffff72bcab8]
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/x86_64-linux/fiddle.so(nogvl_ffi_call+0x18) [0x7ffff72cba28]
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/libruby-3.1.4.so.3.1(rb_nogvl+0xce) [0x7ffff7c50d5e]
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/x86_64-linux/fiddle.so(0x7214) [0x7ffff72cc214]
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/libruby-3.1.4.so.3.1(0x287be7) [0x7ffff7c87be7]
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/libruby-3.1.4.so.3.1(0x2975b8) [0x7ffff7c975b8]
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/libruby-3.1.4.so.3.1(rb_vm_exec+0x9e) [0x7ffff7c9ccde]
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/libruby-3.1.4.so.3.1(rb_yield+0x1bb) [0x7ffff7ca156b]
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/libruby-3.1.4.so.3.1(rb_protect+0xec) [0x7ffff7ad9c8c]
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/libruby-3.1.4.so.3.1(0x1aa69f) [0x7ffff7baa69f]
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/libruby-3.1.4.so.3.1(0x287be7) [0x7ffff7c87be7]
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/libruby-3.1.4.so.3.1(0x2975b8) [0x7ffff7c975b8]
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/libruby-3.1.4.so.3.1(rb_vm_exec+0x54c) [0x7ffff7c9d18c]
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/libruby-3.1.4.so.3.1(0xd5be5) [0x7ffff7ad5be5]
/nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/libruby-3.1.4.so.3.1(ruby_run_node+0x55) [0x7ffff7adc125]
gz sim gui(0x4010fb) [0x4010fb]
/nix/store/cyrrf49i2hm1w7vn2j945ic3rrzgxbqs-glibc-2.38-44/lib/libc.so.6(0x280ce) [0x7ffff783f0ce]
/nix/store/cyrrf49i2hm1w7vn2j945ic3rrzgxbqs-glibc-2.38-44/lib/libc.so.6(__libc_start_main+0x89) [0x7ffff783f189]
gz sim gui(_start+0x25) [0x401145]

-- Other runtime information -----------------------------------------------

* Loaded script: /nix/store/jbps3v347b7wq4a52cv6bl6wdhi86r9k-gz-tools2-2.0.0/bin/.gz-wrapped

* Loaded features:

    0 enumerator.so
    1 thread.rb
    2 fiber.so
    3 rational.so
    4 complex.so
    5 ruby2_keywords.rb
    6 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/x86_64-linux/enc/encdb.so
    7 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/x86_64-linux/enc/trans/transdb.so
    8 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/x86_64-linux/rbconfig.rb
    9 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/compatibility.rb
   10 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/defaults.rb
   11 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/deprecate.rb
   12 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/errors.rb
   13 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/unknown_command_spell_checker.rb
   14 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/exceptions.rb
   15 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/basic_specification.rb
   16 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/stub_specification.rb
   17 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/platform.rb
   18 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/util/list.rb
   19 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/version.rb
   20 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/requirement.rb
   21 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/specification.rb
   22 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/util.rb
   23 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/dependency.rb
   24 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/core_ext/kernel_gem.rb
   25 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/x86_64-linux/monitor.so
   26 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/monitor.rb
   27 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems.rb
   28 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/rubygems/path_support.rb
   29 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/error_highlight/version.rb
   30 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/error_highlight/base.rb
   31 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/error_highlight/formatter.rb
   32 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/error_highlight/core_ext.rb
   33 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/error_highlight.rb
   34 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/did_you_mean/version.rb
   35 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/did_you_mean/core_ext/name_error.rb
   36 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/did_you_mean/levenshtein.rb
   37 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/did_you_mean/jaro_winkler.rb
   38 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/did_you_mean/spell_checker.rb
   39 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/did_you_mean/spell_checkers/name_error_checkers/class_name_checker.rb
   40 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/did_you_mean/spell_checkers/name_error_checkers/variable_name_checker.rb
   41 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/did_you_mean/spell_checkers/name_error_checkers.rb
   42 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/did_you_mean/spell_checkers/method_name_checker.rb
   43 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/did_you_mean/spell_checkers/key_error_checker.rb
   44 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/did_you_mean/spell_checkers/null_checker.rb
   45 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/did_you_mean/tree_spell_checker.rb
   46 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/did_you_mean/spell_checkers/require_path_checker.rb
   47 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/did_you_mean/spell_checkers/pattern_key_name_checker.rb
   48 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/did_you_mean/formatter.rb
   49 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/did_you_mean.rb
   50 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/optparse.rb
   51 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/versions.rb
   52 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/exception.rb
   53 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/syntax_error.rb
   54 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/x86_64-linux/psych.so
   55 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/x86_64-linux/stringio.so
   56 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/omap.rb
   57 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/set.rb
   58 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/class_loader.rb
   59 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/scalar_scanner.rb
   60 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/nodes/node.rb
   61 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/nodes/stream.rb
   62 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/nodes/document.rb
   63 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/nodes/sequence.rb
   64 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/nodes/scalar.rb
   65 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/nodes/mapping.rb
   66 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/nodes/alias.rb
   67 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/nodes.rb
   68 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/streaming.rb
   69 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/visitors/visitor.rb
   70 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1.4/lib/ruby/3.1.0/psych/visitors/to_ruby.rb
   71 /nix/store/lpp53qxl39gc5vwvd8qn6ps6nh6kkffk-ruby-3.1
```

## fixed errors

```bash
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

- gui is now starting
