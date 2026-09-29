{
  den.aspects.secrets.keepass = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [ pkgs.keepassxc ];
    };
  };
}
