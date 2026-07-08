{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    usbutils
    pciutils
    dnsutils

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
    obsidian
    prismlauncher
    resources
    chromium
    dconf-editor
    vim

    bruno
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];
}
