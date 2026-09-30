{ inputs, ... }: {
  den.aspects.env.nur = {
    nixos.imports = [
      inputs.nur.modules.nixos.default
    ];

    os.nixpkgs.overlays = [
      inputs.nur.overlays.default
    ];
  };

  flake-file.inputs.nur = {
    url = "github:nix-community/NUR";
    inputs.nixpkgs.follows = "nixpkgs";
  };
}
