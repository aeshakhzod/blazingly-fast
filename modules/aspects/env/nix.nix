{ inputs, ... }: {
  den.aspects.env.nix.os = {
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
          "https://cache.xinux.uz?priority=1"
          "https://nix-community.cachix.org?priority=2"
          "https://numtide.cachix.org?priority=2"
          "https://attic.xuyh0120.win/lantian?priority=2"
          "https://cache.nixos.org?priority=3"
        ];
        trusted-public-keys = [
          "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
          "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
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

      overlays = [
        inputs.nur.overlays.default
        inputs.zed-extensions.overlays.default
        inputs.lem.overlays.default
      ];
    };
  };
}
