{ inputs, ... }: {
  den.aspects.secrets.sops = {
    nixos = {
      imports = [ inputs.sops-nix.nixosModules.sops ];

      sops = {
        age.keyFile = "/home/shakhzod/.config/sops/age/keys.txt";
        defaultSopsFile = ../../../qulf/secrets/global.yaml;
        defaultSopsFormat = "yaml";
      };
    };

    homeManager = {
      sops = {
        age.keyFile = "/home/shakhzod/.config/sops/age/keys.txt";
        defaultSopsFile = ../../../qulf/secrets/global.yaml;
        defaultSopsFormat = "yaml";
      };
    };

    # TODO: darwin (if necessary)

    os.home-manager.sharedModules = [
      inputs.sops-nix.homeManagerModules.sops
    ];
  };

  flake-file.inputs.sops-nix = {
    url = "github:Mic92/sops-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
}
