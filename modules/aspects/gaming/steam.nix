{ inputs, ... }: {
  den.aspects.gaming.steam = {
    nixos = {
      imports = [
        inputs.steam-asahi.nixosModules.default
      ];

      programs.steam = {
        enable = true;
        extest.enable = true;
        gamescopeSession.enable = true;
        protontricks.enable = true;
      };
    };
    darwin.homebrew.casks = [ "steam" ];
  };
}
