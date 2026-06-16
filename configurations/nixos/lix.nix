{ inputs, ... }:
{
  imports = [ inputs.lix-module.nixosModules.default ];

  lix.enable = true;

  nix = {
    enable = true;
    nixPath = [
      "nixpkgs=flake:nixpkgs"
    ];
    settings.experimental-features = [
      "nix-command"
      "flakes"
      "pipe-operator"
    ];
    settings.extra-deprecated-features = ["or-as-identifier" "broken-string-escape"];
    settings.trusted-users = [
      "root"
      "shakhzod"
    ];
  };
}
