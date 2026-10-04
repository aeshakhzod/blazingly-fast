{
  den.aspects.communication.matrix = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        element-desktop
        cinny-desktop
      ];
    };

    darwin.homebrew.casks = [ "element" ];
  };
}
