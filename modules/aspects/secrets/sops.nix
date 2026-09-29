{ inputs, ... }: {
  den.aspects.secrets.sops = {
    nixos = {
      imports = [ inputs.sops-nix.nixosModules.sops ];

      sops = {
        gnupg.home = "/srv/.gnupg";
        defaultSopsFile = ../../../qulf/secrets/global.yaml;
        defaultSopsFormat = "yaml";
      };
    };

    homeManager = { config, ... }: {
      sops = {
        gnupg.home = "${config.home.homeDirectory}/.gnupg";
        defaultSopsFile = ../../../qulf/secrets/global.yaml;
        defaultSopsFormat = "yaml";
      };
    };

    os.home-manager.sharedModules = [
      inputs.sops-nix.homeManagerModules.sops
    ];
  };

  flake-file.inputs.sops-nix = {
    url = "github:Mic92/sops-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
}
