{
  inputs,
  system,
  pkgs,
}:
let
  kanata-lsp = pkgs.callPackage ./packages/kanata-lsp.nix { };
in
pkgs.mkShellNoCC {
  packages = with pkgs; [
    inputs.self.formatter.${system}
    nixfmt-tree

    nixd
    deadnix
    statix

    git
    kanata-lsp
  ];

  shellHook = ''
    export EDITOR="nvim"
    export FLAKE_ROOT="$(git rev-parse --show-toplevel)"
  '';
}
