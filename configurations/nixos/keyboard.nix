{ ... }: {
  services.kanata = {
    enable = true;
    keyboards.default.configFile = ../../dotfiles/keyboard.kbd;
  };
}
