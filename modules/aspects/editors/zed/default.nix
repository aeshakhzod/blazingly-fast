{ inputs, ... }: {
  den.aspects.editors.zed = {
    os.home-manager.sharedModules = [
      inputs.zed-extensions.homeManagerModules.default
    ];

    homeManager = { pkgs, ... }: {
      programs.zed-editor = {
        enable = true;
        package = pkgs.zed-editor;
        extraPackages = with pkgs; [
          nixd
          nixfmt
          nil
          bash-language-server
          typescript
          typescript-language-server
          biome
          # (pkgs.callPackage ./_wit-cli.nix { })
          # (pkgs.callPackage ./_json-tool-lsp.nix { })
        ];
      };

      programs.zed-editor-extensions = {
        enable = true;
        packages = with pkgs.zed-extensions; [
          biome
          css-modules-kit
          docker-compose
          elisp
          env
          git-firefly
          gruvbox-baby
          html
          jq
          json-tool-lsp
          json5
          just
          markdownlint
          mdx
          mermaid
          nix
          org
          scheme
          sql
          toml
          wit
        ];
      };
    };
  };

  flake-file.inputs.zed-extensions.url = "github:DuskSystems/nix-zed-extensions";
}
