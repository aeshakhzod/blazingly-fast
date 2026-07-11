{ inputs, ... }: {
  den.batteries.nixos-hardware = model: {
    nixos.imports = [
      inputs.nixos-hardware.nixosModules.${model}
    ];
  };

  flake-file.inputs.nixos-hardware = {
    url = "github:NixOS/nixos-hardware";
    inputs.nixpkgs.follows = "nixpkgs";
  };
}
