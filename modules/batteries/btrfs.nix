{
  den.batteries.btrfs = {
    nixos = {
      services.btrfs.autoScrub = {
        enable = true;
        interval = "weekly";
        fileSystems = [ "/" ];
      };

      virtualisation.docker.storageDriver = "btrfs";
    };
  };
}
