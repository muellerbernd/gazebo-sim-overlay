{
  description = "Gazebosim overlay for the Nix package manager";

  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    # nixpkgs.url = "github:muellerbernd/nixpkgs/nix-ros-overlay";

    flake-utils.url = "github:numtide/flake-utils";
    nixgl.url = "github:guibou/nixGL";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    nixgl,
    ...
  }:
    with nixpkgs.lib;
    with flake-utils.lib;
      eachSystem allSystems
      (system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [self.overlays.default nixgl.overlay];
        };
      in {
        # let pkgs = nixpkgs.outputs.legacyPackages.${system};
        # packages.ignition-gazebo =
        #   pkgs.libsForQt5.callPackage ./pkgs/ignition-gazebo { };
        # packages.default = self.outputs.packages.${system}.ignition-gazebo;

        devShells = {
          default = import ./shells/gazebo-ignition.nix {inherit pkgs;};
          classic = import ./shells/gazebo-classic.nix {inherit pkgs;};
        };
      })
      // {
        overlays.default = import ./overlay.nix;
      };
}
