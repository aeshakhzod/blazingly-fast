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
      nixosConfigurations.qoravoy = import ./hosts/qoravoy.nix { inherit inputs glib m; };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zed-extensions.url = "github:DuskSystems/nix-zed-extensions";
    nix-doom-emacs-unstraightened = {
      url = "github:marienz/nix-doom-emacs-unstraightened";
      inputs.nixpkgs.follows = "";
    };
    lem = {
      url = "github:lem-project/lem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xinux-modules = {
      url = "git+https://git.oss.uzinfocom.uz/xinux/modules?ref=release-26.05&shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    haumea = {
      url = "github:nix-community/haumea";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
