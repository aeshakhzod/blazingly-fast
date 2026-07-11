{
  perSystem = { pkgs, ... }: {
    formatter = pkgs.nixfmt;
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        nixfmt
        nixfmt-tree

        nixd
        deadnix
        statix

        git
        # kanata-lsp
      ];

      shellHook = ''
        export EDITOR="nvim"
        export FLAKE_ROOT="$(git rev-parse --show-toplevel)"
      '';
    };
  };
}
