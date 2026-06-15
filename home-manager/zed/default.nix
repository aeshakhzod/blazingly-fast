{ pkgs, ... }:
{
  my-dotfiles = {
    ".config/zed/settings.json" = "zed/settings.json";
    ".config/zed/keymap.json" = "zed/keymap.json";
  };

  programs.zed-editor-extensions = {
    enable = true;
    packages = with pkgs.zed-extensions; [
      nix
      wit
    ];
  };

  home.packages = [
    (pkgs.callPackage ./_wit-cli.nix { })
  ];
}
