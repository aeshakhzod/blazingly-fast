{ lib, den, ... }: {
  den.default.nixos.system.stateVersion = "26.05";
  den.default.darwin.system.stateVersion = 7;
  den.default.os.home-manager = {
    useGlobalPkgs = true;
    backupFileExtension = "hm-backup";

    # targets.darwin.copyApps.enable = false;
    # targets.darwin.linkApps.enable = false;
  };
  den.default.homeManager = {
    home.stateVersion = "26.05";
  };
  den.default.includes = [ den.batteries.self' ];

  den.schema.host.includes = [
    den.batteries.hostname
    den.batteries.host-aspects
  ];
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}
