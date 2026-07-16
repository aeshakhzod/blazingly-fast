{
  den.aspects.gaming.steam = {
    nixos.programs.steam = {
      enable = true;
      extest.enable = true;
      gamescopeSession.enable = true;
      protontricks.enable = true;
    };
    darwin.homebrew.casks = [ "steam" ];
  };
}
