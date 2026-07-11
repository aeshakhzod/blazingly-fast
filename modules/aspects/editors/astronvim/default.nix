{
  den.aspects.editors.astronvim = {
    homeManager = { config, pkgs, ... }: {
      home.file.".config/astronvim".source =
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/blazingly-fast/modules/aspects/editors/astronvim/_config";
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
    };
  };
}
