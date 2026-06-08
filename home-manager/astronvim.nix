{ pkgs, ... }:
{
  my-dotfiles.".config/astronvim" = "astronvim";

  programs.neovim = {
    enable = true;

    extraWrapperArgs = [
      "--suffix"
      "NVIM_APPNAME"
      ":"
      "astronvim"
    ];

    extraPackages = with pkgs; [
      nodejs
      selene
      nixd
      deadnix
      statix
      gdu
      lazygit
      python3
      djlint

      lua-language-server
      luarocks
      stylua

      tree-sitter
      isort
      black
    ];
  };
}
