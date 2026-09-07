{ lib, stdenv, fetchsvn, darwin, libtiff
, libpng, zlib, libwebp, libraw, openexr, openjpeg
, libjpeg, jxrlib, pkg-config, imath
, fixDarwinDylibNames ? null, autoSignDarwinBinariesHook ? null }:

stdenv.mkDerivation (finalAttrs: {
  pname = "freeimage";
  version = "3.18.0";

  src = fetchsvn {
    url = "svn://svn.code.sf.net/p/freeimage/svn/";
    rev = "1911";
    hash = "sha256-JznVZUYAbsN4FplnuXxCd/ITBhH7bfGKWXep2A6mius=";
  };

  sourceRoot = "${finalAttrs.src.name}/FreeImage/trunk";

  # Ensure that the bundled libraries are not used at all, but keep transupp.h and transupp.c
  # along with LibJPEG headers to compile transupp.c.
  prePatch = ''
    mkdir -p transupp_tmp
    cp Source/LibJPEG/*.h transupp_tmp/
    cp Source/LibJPEG/transupp.c transupp_tmp/
    rm -rf Source/Lib* Source/OpenEXR Source/ZLib
    mkdir -p Source/LibJPEG
    mv transupp_tmp/* Source/LibJPEG/
    rmdir transupp_tmp
  '';

  # Tell patch to work with trailing carriage returns
  patchFlags = [
    "-p1"
    "--binary"
  ];

  patches = [
    ./unbundle.diff
    ./libtiff-4.5.0.diff
  ];

  postPatch = ''
    # Push/pop visibility default in transupp.c and transupp.h to export the symbols from the shared library
    sed -i '1s/^/#pragma GCC visibility push(default)\n/' Source/LibJPEG/transupp.h
    echo '#pragma GCC visibility pop' >> Source/LibJPEG/transupp.h
    sed -i '1s/^/#pragma GCC visibility push(default)\n/' Source/LibJPEG/transupp.c
    echo 'void jpeg_core_output_dimensions(j_decompress_ptr cinfo) { jpeg_calc_output_dimensions(cinfo); }' >> Source/LibJPEG/transupp.c
    echo '#pragma GCC visibility pop' >> Source/LibJPEG/transupp.c

    # Copy transupp.h so that it can be found under include paths
    cp Source/LibJPEG/transupp.h Source/transupp.h
    cp Source/LibJPEG/transupp.h Source/FreeImageToolkit/transupp.h

    # Add transupp.c back to compilation sources
    substituteInPlace Makefile.srcs \
      --replace-fail "./Source/FreeImageToolkit/Resize.cpp" "./Source/FreeImageToolkit/Resize.cpp ./Source/LibJPEG/transupp.c"

    # To support cross compilation, use the correct `pkg-config`.
    substituteInPlace Makefile.fip \
      --replace "pkg-config" "$PKG_CONFIG"
    substituteInPlace Makefile.gnu \
      --replace "pkg-config" "$PKG_CONFIG"

    # Fix OpenEXR 3 / Imath compatibility
    substituteInPlace Source/FreeImage/PluginEXR.cpp \
      --replace-fail "#include <OpenEXR/half.h>" "#include <Imath/half.h>" \
      --replace-fail "Imath::Int64" "uint64_t"
    substituteInPlace Source/FreeImage/PluginTIFF.cpp \
      --replace-fail "#include <OpenEXR/half.h>" "#include <Imath/half.h>"



  '' + lib.optionalString (stdenv.isDarwin && stdenv.isAarch64) ''
    # Upstream Makefile hardcodes i386 and x86_64 architectures only
    substituteInPlace Makefile.osx --replace "x86_64" "arm64"
  '';

  nativeBuildInputs = [
    pkg-config
  ] ++ lib.optionals stdenv.isDarwin [
    darwin.cctools
    fixDarwinDylibNames
  ] ++ lib.optionals (stdenv.isDarwin && stdenv.isAarch64) [
    autoSignDarwinBinariesHook
  ];

  buildInputs = [
    libtiff libtiff.dev_private libpng zlib libwebp libraw openexr openjpeg
    libjpeg jxrlib imath
  ];

  hardeningDisable = [ "fortify" ];
  NIX_CFLAGS_COMPILE = [ "-Wno-error" ];

  postBuild = lib.optionalString (!stdenv.isDarwin) ''
    make -f Makefile.fip
  '';

  INCDIR = "${placeholder "out"}/include";
  INSTALLDIR = "${placeholder "out"}/lib";

  preInstall = ''
    mkdir -p $INCDIR $INSTALLDIR
  ''
  # Workaround for Makefiles.osx not using ?=
  + lib.optionalString stdenv.isDarwin ''
    makeFlagsArray+=( "INCDIR=$INCDIR" "INSTALLDIR=$INSTALLDIR" )
  '';

  postInstall = lib.optionalString (!stdenv.isDarwin) ''
    make -f Makefile.fip install
  '' + lib.optionalString stdenv.isDarwin ''
    ln -s $out/lib/libfreeimage.3.dylib $out/lib/libfreeimage.dylib
  '';

  enableParallelBuilding = true;

  meta = {
    description = "Open Source library for accessing popular graphics image file formats";
    homepage = "http://freeimage.sourceforge.net/";
    license = "GPL";
    maintainers = with lib.maintainers; [viric l-as];
    platforms = with lib.platforms; unix;
  };
})
