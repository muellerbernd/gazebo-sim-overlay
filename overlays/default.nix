# final: prev: with prev.lib;
# foldr composeExtensions (_: _: {}) [
#   (import ./pkgs)
# ] final prev
# This file defines overlays
{ inputs, ... }:
{
  # For every flake input, aliases 'pkgs.inputs.${flake}' to
  # 'inputs.${flake}.packages.${pkgs.system}' or
  # 'inputs.${flake}.legacyPackages.${pkgs.system}'
  flake-inputs = final: _: {
    inputs = builtins.mapAttrs (
      _: flake:
      let
        legacyPackages = (flake.legacyPackages or { }).${final.system} or { };
        packages = (flake.packages or { }).${final.system} or { };
      in
      if legacyPackages != { } then legacyPackages else packages
    ) inputs;
  };

  # This one brings our custom packages from the 'pkgs' directory
  default = final: _prev: import ../pkgs { pkgs = final; };
}
