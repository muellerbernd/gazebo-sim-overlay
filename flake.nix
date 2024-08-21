{
  description = "Gazebosim overlay for the Nix package manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixgl.url = "github:guibou/nixGL";
    systems.url = "github:nix-systems/default-linux";
  };
  outputs = {
    self,
    nixpkgs,
    systems,
    nixgl,
    ...
  } @ inputs: let
    inherit (self) outputs;

    lib = nixpkgs.lib;
    forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs (import systems) (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          config.permittedInsecurePackages = [
            "freeimage"
            "freeimage-unstable-2021-11-01"
          ];

          overlays = [
            # self.overlays.modifications
            self.overlays.default
            nixgl.overlays.default
          ];
        }
    );
  in {
    inherit lib;
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc
    legacyPackages = forEachSystem (pkgs: import ./pkgs {inherit pkgs;});
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forEachSystem (pkgs: pkgs.alejandra);
    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};
    # checks
    # checks = self.legacyPackages;

    # dev shells
    devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs;});
  };
}
