{ den, ... }: {
  den.hosts.x86_64-linux.waffle = {
    users.shakhzod = { };
  };

  den.aspects.waffle = {
    includes = [
      den.batteries.btrfs
      den.batteries.hibernation
      den.batteries.systemd-boot

      den.batteries.fwupd

      den.aspects.profiles.workhorse

      den.aspects.packages.nixos-packages
      den.aspects.packages.global-packages
    ];

    nixos = {
      imports = [
        ./_imports/hardware.nix
      ];
    };
  };
}
