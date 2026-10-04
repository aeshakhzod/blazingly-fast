{ den, ... }: {
  den.aspects.profiles.workhorse = {
    includes = with den.aspects; [
      desktop.fonts
      desktop.keyboard
      desktop.mouse
      desktop.sound

      # desktop.xinux
      # desktop.gnome
      desktop.plasma
      # desktop.cosmic

      packages.npm

      editors.astronvim
      # editors.doom-emacs
      editors.emacs
      # editors.lem
      editors.zed
      editors.vscode

      env.alacritty
      env.direnv
      env.docker
      env.git
      env.nix
      env.nur
      # env.podman
      env.ssh
      env.starship
      env.tailscale
      # env.wezterm
      env.zsh

      secrets.gpg
      secrets.keepass
      secrets.sops

      www.floorp
      www.thunderbird

      communication.discord
      communication.matrix
      communication.telegram

      work.e-imzo
      work.libreoffice
    ];
  };
}
