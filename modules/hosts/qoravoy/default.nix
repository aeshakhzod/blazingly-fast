{ den, ... }: {
  den.hosts.x86_64-linux.qoravoy = {
    users.shakhzod = { };
  };

  den.aspects.qoravoy = {
    includes = [
      den.batteries.btrfs
      den.batteries.hibernation
      den.batteries.systemd-boot

      (den.batteries.disko ./_imports/disko.nix)
      den.batteries.fwupd
      (den.batteries.nixos-hardware "lenovo-thinkpad-t14-intel-gen6")
      den.batteries.thermald
      den.aspects.desktop.fprintd
      den.batteries.intel-v3

      den.aspects.profiles.workhorse
      den.aspects.profiles.gaming

      den.aspects.packages.nixos-packages
      den.aspects.packages.global-packages
    ];

    nixos = { pkgs, ... }: {
      imports = [
        ./_imports/hardware.nix
      ];

      services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix-550a;
    };
  };
}
