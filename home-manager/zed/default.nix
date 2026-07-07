{ pkgs, pkgs-unstable, ... }:
{
  my-dotfiles = {
    ".config/zed/settings.json" = "zed/settings.json";
    ".config/zed/keymap.json" = "zed/keymap.json";
  };

  programs.zed-editor = {
    enable = true;
    package = pkgs-unstable.zed-editor;
    extraPackages = with pkgs; [
      nixd
      nixfmt
      nil
      bash-language-server
      typescript-language-server
      (pkgs.callPackage ./_wit-cli.nix { })
    ];
  };

  programs.zed-editor-extensions = {
    enable = true;
    packages = with pkgs.zed-extensions; [
      biome
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
}
