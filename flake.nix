{
  description = "blazingly fast nix config";

  outputs =
    inputs:
    let
      glib = import ./glib.nix inputs;
      inherit (glib) forEachSupportedSystem m;
    in
    {
      devShell = forEachSupportedSystem (
        { pkgs, system }: pkgs.callPackage ./shell.nix { inherit inputs system pkgs; }
      );
      formatter = forEachSupportedSystem ({ pkgs, ... }: pkgs.nixfmt);
      darwinConfigurations.powerlaptop = import ./hosts/powerlaptop.nix { inherit inputs glib m; };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zed-extensions.url = "github:DuskSystems/nix-zed-extensions";
    lix = {
      # https://git.lix.systems/lix-project/lix/tags
      url = "https://git.lix.systems/lix-project/lix/archive/2.95.3.tar.gz";
      flake = false;
    };
    lix-module = {
      # https://git.lix.systems/lix-project/nixos-module/tags
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };
    haumea = {
      url = "github:nix-community/haumea";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
