{ inputs, ... }: {
  den.batteries.disko = config: {
    nixos.imports = [
      inputs.disko.nixosModules.disko
      config
    ];
  };

  flake-file.inputs.disko = {
    url = "github:nix-community/disko";
    inputs.nixpkgs.follows = "nixpkgs";
  };
}
