{
  den.aspects.communication.fractal = {
    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.fractal ];
    };
  };
}
