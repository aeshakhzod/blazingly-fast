{
  den.aspects.desktop.fonts = {
    nixos =
      { pkgs, ... }:
      {
        fonts = {
          fontDir.enable = true;
          enableDefaultPackages = true;
          packages = with pkgs; [
            liberation_ttf
            times-newer-roman
            ubuntu-classic
            noto-fonts
            noto-fonts-color-emoji
            noto-fonts-cjk-sans
            jetbrains-mono
            nerd-fonts.jetbrains-mono
            hack-font
            font-awesome
          ];

          fontconfig = {
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
