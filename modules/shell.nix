{
  perSystem =
    { pkgs, ... }:
    let
      # something is from my old blazingly-fast file:
      #  https://codeberg.org/aeshakhzod/blazingly-fast/src/commit/810eaef00c7e72c31d9c15f52cad6114275323d7/home-manager/blazingly-fast.nix
      qulf-update = pkgs.writeShellScriptBin "qulf-update" ''
        set -euo pipefail
        read -p "Commit message (enter for default): " msg
        git -C "$FLAKE_ROOT/qulf" add .
        git -C "$FLAKE_ROOT/qulf" commit -m "''${msg:-automatically updated by qulf-update}"
        git -C "$FLAKE_ROOT/qulf" push origin HEAD:main
        git -C "$FLAKE_ROOT" submodule update --remote
      '';
    in
    {
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
          sops

          qulf-update
        ];

        shellHook = ''
          export EDITOR="nvim"
          export FLAKE_ROOT="$(git rev-parse --show-toplevel)"
        '';
      };
    };
}
