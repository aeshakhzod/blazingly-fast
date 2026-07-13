{
  den.aspects.communication.fractal = { host, ... }: {
    homeManager = { pkgs, lib, ... }: {
      home.packages = lib.mkMerge [ (lib.mkIf (host == "linux") pkgs.fractal) ];
    };
  };
}
