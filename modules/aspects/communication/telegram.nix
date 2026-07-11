{
  den.aspects.communication.telegram = {
    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.telegram-desktop ];
    };
  };
}
