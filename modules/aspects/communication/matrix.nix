{
  den.aspects.communication.matrix = { host, ... }: {
    homeManager = { pkgs, lib, ... }: {
      home.packages = [ (lib.mkIf (host.class == "nixos") pkgs.element-desktop) ];
    };

    darwin.homebrew.casks = [ "element" ];
  };
}
