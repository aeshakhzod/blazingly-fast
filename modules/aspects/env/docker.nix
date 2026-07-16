{
  den.aspects.env.docker = {
    nixos = {
      virtualisation.docker = {
        enable = true;
        rootless = {
          enable = true;
          setSocketVariable = true;
        };
      };
    };

    darwin.homebrew.casks = [ "docker-desktop" ];
  };
}
