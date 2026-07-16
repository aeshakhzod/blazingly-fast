{
  den,
  inputs,
  ...
}:
{
  den.aspects.editors.zed = {
    includes = with den.aspects.packages; [
      json-tool-lsp
      wit-cli
      kanata-lsp
    ];

    os.home-manager.sharedModules = [
      inputs.zed-extensions.homeManagerModules.default
    ];

    homeManager =
      { pkgs, self', ... }:
      {
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

            self'.packages.json-tool-lsp
            self'.packages.wit-cli
            self'.packages.kanata-lsp
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

    darwin.homebrew.casks = [ "zed" ];
  };

  flake-file.inputs.zed-extensions.url = "github:DuskSystems/nix-zed-extensions";
}
