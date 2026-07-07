{ ... }: {
  services.kanata = {
    enable = true;
    keyboards.default.configFile = ../../dotfiles/keyboard.kbd;
  };

  hardware.keyboard.qmk = {
    enable = true;
    keychronSupport = true;
  };
}
