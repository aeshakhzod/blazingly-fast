{
  den.aspects.communication.fractal = { host, ... }: {
    homeManager = { pkgs, lib, ... }: {
      home.packages = [ (lib.mkIf (host.class == "nixos") pkgs.fractal) ];
    };
  };
}
