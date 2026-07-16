{
  den.aspects.desktop.fonts = {
    nixos =
      { pkgs, ... }:
      {
        fonts = {
          fontDir.enable = true;
          enableDefaultPackages = true;
          packages = with pkgs; [
            font-awesome
            hack-font
            jetbrains-mono
            liberation_ttf
            nerd-fonts.jetbrains-mono
            noto-fonts
            noto-fonts-cjk-sans
            # noto-fonts-color-emoji
            times-newer-roman
            ubuntu-classic
          ];

          fontconfig = {
            enable = true;
            defaultFonts = {
              serif = [ "Times Newer Roman" ];
              sansSerif = [ "Noto Sans" ];
              monospace = [ "JetBrainsMono" ];
            };
          };
        };
      };
  };
}
