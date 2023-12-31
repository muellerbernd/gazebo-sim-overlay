{ stdenv
, wrapQtAppsHook
, gazebo_new
, ...
}:
stdenv.mkDerivation {
  pname = "gazebo-test";
  version = "1.0.0";
  nativeBuildInputs = [ wrapQtAppsHook ];
  buildInputs = [ gazebo_new ];
  dontWrapQtApps = true;
  preFixup = ''
    wrapQtApp "$out/bin/gz"
  '';

}
