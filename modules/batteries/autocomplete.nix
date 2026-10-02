{ inputs, ... }: {
  den.batteries.autocomplete = {
    flake.flake.autocomplete = {
      nixpkgs = inputs.nixpkgs;
      nixos = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ];
      };
      homeManager = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        modules = [ ];
      };
    };
  };
}
