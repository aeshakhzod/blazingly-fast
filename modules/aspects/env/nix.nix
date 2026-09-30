{
  den.aspects.env.nix = {
    os = {
      nix = {
        enable = true;

        nixPath = [
          "nixpkgs=flake:nixpkgs"
        ];

        settings = {
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          trusted-users = [
            "root"
          ];
          substituters = [
            "https://cache.xinux.uz?priority=4"
            "https://mirror.sjtu.edu.cn/nix-channels/store?priority=1"
            "https://mirrors.ustc.edu.cn/nix-channels/store?priority=1"
            "https://nix-community.cachix.org?priority=2"
            "https://numtide.cachix.org?priority=2"
            "https://cache.nixos.org?priority=3"
          ];
          trusted-public-keys = [
            "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
            "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          ];
        };
      };

      nixpkgs = {
        config = {
          allowUnfree = true;
          allowBroken = false;
          allowInsecure = false;
          allowUnsupportedSystem = false;
        };
      };
    };

    homeManager = { config, ... }: {
      sops = {
        secrets.nix-github-access-token = { };
        templates."nix/nix.conf".content = ''
          access-tokens = github.com=${config.sops.placeholder.nix-github-access-token}
        '';
      };

      nix = {
        extraOptions = ''
          !include ${config.sops.templates."nix/nix.conf".path}
        '';
      };
    };
  };
}
