{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    guvcview
    obs-studio
    pinentry-all
    spotify
    telegram-desktop
    vlc
    wl-clipboard
    xclip
    bitwarden-desktop
    fractal
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];
}
