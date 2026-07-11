{
  den.aspects.env.direnv = {
    homeManager.programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = true;
    };
  };
}
