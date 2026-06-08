{
  inputs,
  system,
  pkgs,
}:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    inputs.self.formatter.${system}
    nixfmt-tree

    nixd
    deadnix
    statix

    git
  ];

  shellHook = ''
    export EDITOR="nvim"
    export FLAKE_ROOT="$(git rev-parse --show-toplevel)"
  '';
}
