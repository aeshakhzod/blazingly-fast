{
  den.batteries.systemd-boot = {
    nixos = {
      boot.loader.systemd-boot = {
        enable = true;
        editor = false;
      };

      boot.loader.efi.canTouchEfiVariables = true;
    };
  };
}
