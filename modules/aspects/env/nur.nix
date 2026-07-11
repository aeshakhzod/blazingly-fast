{ inputs, ... }: {
  den.aspects.env.nur = {
    nixos.imports = [
      inputs.nur.modules.nixos.default
    ];
  };

  flake-file.inputs.nur = {
    url = "github:nix-community/NUR";
    inputs.nixpkgs.follows = "nixpkgs";
  };
}
