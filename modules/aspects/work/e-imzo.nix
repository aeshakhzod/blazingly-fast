{
  den.aspects.work.e-imzo = {
    nixos = { pkgs, ... }: {
      services.e-imzo.enable = true;
      environment.systemPackages = [ pkgs.e-imzo-manager ];
    };
  };
}
