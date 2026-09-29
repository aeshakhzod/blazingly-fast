{ den, ... }: {
  den.aspects.profiles.workhorse = {
    includes = with den.aspects; [
      env.nix
      env.nur

      desktop.fonts
      desktop.keyboard
      desktop.mouse
      desktop.sound

      desktop.xinux
      desktop.gnome
      # desktop.plasma
      # desktop.cosmic

      packages.npm

      editors.astronvim
      # editors.doom-emacs
      # editors.lem
      editors.zed
      editors.vscode

      env.direnv
      env.git
      env.ssh
      env.starship
      env.wezterm
      env.zsh
      env.docker
      # env.podman
      env.tailscale

      secrets.gpg
      secrets.keepass
      secrets.sops

      www.floorp
      www.thunderbird

      communication.matrix
      communication.telegram
      communication.discord

      work.libreoffice
      work.kerio
      work.e-imzo
    ];
  };
}
