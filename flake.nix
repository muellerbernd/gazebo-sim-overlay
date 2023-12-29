{
  description = "Gazebosim overlay for the Nix package manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # nixpkgs.url = "github:muellerbernd/nixpkgs/nix-ros-overlay";

    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    nixgl.url = "github:guibou/nixGL";

  };
  # flake-utils.lib.eachDefaultSystem (system:
  outputs = { self, nixpkgs, flake-utils, nixgl, ... }:
    with nixpkgs.lib;
    with flake-utils.lib;

    eachSystem allSystems
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ self.overlays.default nixgl.overlay ];
          };
        in
        {

          # let pkgs = nixpkgs.outputs.legacyPackages.${system};
          # packages.ignition-gazebo =
          #   pkgs.libsForQt5.callPackage ./pkgs/ignition-gazebo { };
          # packages.default = self.outputs.packages.${system}.ignition-gazebo;

          devShells = {
            default = import ./shells/gazebo-ignition.nix { inherit pkgs; };
            classic = import ./shells/gazebo-classic.nix { inherit pkgs; };
          };
        }) // {
      overlays.default = import ./overlay.nix;

      # overlays.default = final: prev: {
      #   inherit (self.packages.${final.system}) rofi-music-rs;
      # };
    };
  # nixConfig = {
  #   extra-substituters = [
  #     # "http://192.168.178.142:5000" # my home server
  #     # "http://192.168.1.28" # EIS-machine
  #     "http://192.168.1.111" # EIS-buildserver
  #   ];
  #   extra-trusted-public-keys = [
  #     # "192.168.178.142:3qJNJbeIjoWRcb+E0YEoek2Bpumh/4IXrAkyk96izqQ=%" # my home server
  #     # "192.168.1.28:w7i6RsBxxkKqAcPkNDbQznnOmb+ps1XvaQFlLw7YgvY=#" # EIS-machine
  #     "192.168.1.111:Rmrfo6TPC1rUxh4ik2m5zt6yaCSVZABbrPSDADxIbak=#" # EIS-buildserver
  #   ];
  # };
}

