{
  den.aspects.packages.nixos-packages = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        usbutils
        pciutils
        dnsutils

        guvcview
        obs-studio
        pinentry-all
        spotify
        vlc
        wl-clipboard
        xclip
        obsidian
        resources
        chromium
        dconf-editor
        vim

        bruno
      ];
    };
  };
}
