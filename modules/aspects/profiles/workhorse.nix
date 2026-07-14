{ den, ... }: {
  den.aspects.profiles.workhorse = {
    includes = with den.aspects; [
      env.nix
      env.nur

      desktop.fonts
      desktop.keyboard
      desktop.mouse
      desktop.sound

      desktop.gnome

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

      secrets.gpg
      secrets.rbw

      www.floorp
      www.thunderbird

      communication.fractal
      communication.telegram
      communication.discord

      work.kerio
    ];
  };
}
