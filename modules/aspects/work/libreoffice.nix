{
  den.aspects.work.libreoffice = {
    nixos = { pkgs, ... }: { environment.systemPackages = [ pkgs.libreoffice ]; };
  };
}
