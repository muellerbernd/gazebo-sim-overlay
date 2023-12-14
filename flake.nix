{
  description = "Gazebosim overlay for the Nix package manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };
  # flake-utils.lib.eachDefaultSystem (system:
  outputs = { self, nixpkgs, flake-utils, ... }:
    with nixpkgs.lib;
    with flake-utils.lib;

    eachSystem allSystems (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlays.default ];
        };
      in {

        # let pkgs = nixpkgs.outputs.legacyPackages.${system};
        packages.ignition-gazebo = pkgs.libsForQt5.callPackage ./pkgs/ignition-gazebo { };
        packages.default = self.outputs.packages.${system}.ignition-gazebo;

      }) // {
        overlays.default = import ./overlay.nix;

        # overlays.default = final: prev: {
        #   inherit (self.packages.${final.system}) rofi-music-rs;
        # };
      };

}

