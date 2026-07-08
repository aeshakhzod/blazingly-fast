{ inputs, ... }:
{
  nix = {
    enable = true;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
    };
  };
}
