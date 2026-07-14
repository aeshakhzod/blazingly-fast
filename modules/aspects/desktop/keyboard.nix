{
  den.aspects.desktop.keyboard = {
    nixos = {
      services.kanata = {
        enable = true;
        keyboards.default.configFile = ./keyboard.kbd;
      };

      hardware.keyboard.qmk = {
        enable = true;
        keychronSupport = true;
      };
    };

    darwin = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.kanata
        (pkgs.writeScriptBin "kanata-gallium" ''
          sudo ${pkgs.kanata}/bin/kanata -c ${./keyboard.kbd}
        '')
      ];

      homebrew.casks = ["karabiner-elements"];
    };
  };
}
