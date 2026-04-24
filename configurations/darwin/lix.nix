{ inputs, ... }:
{
  imports = [ inputs.lix-module.darwinModules.default ];

  nix = {
    enable = true;
    nixPath = [ ];
    extraOptions = ''
      extra-experimental-features = nix-command flakes
      extra-deprecated-features = or-as-identifier
      nix-path = nixpkgs=flake:nixpkgs
    '';
    settings.trusted-users = [
      "root"
      "@admin"
    ];
    linux-builder = {
      enable = true;
      systems = [
        "aarch64-linux"
        "x86_64-linux"
      ];
      maxJobs = 8;
    };
  };
}
