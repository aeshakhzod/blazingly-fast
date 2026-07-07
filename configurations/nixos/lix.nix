{ inputs, ... }:
{
  imports = [ inputs.lix-module.nixosModules.lixFromNixpkgs ];

  lix.enable = true;

  nix = {
    enable = true;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operator"
      ];
      # extra-deprecated-features = [
      #   "or-as-identifier"
      #   "broken-string-escape"
      # ];
    };
  };
}
