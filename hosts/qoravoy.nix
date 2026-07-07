{
  inputs,
  glib,
  m,
  ...
}:
let
  system = "x86_64-linux";
in
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs glib m;
    isDarwin = false;
    isLinux = true;
    pkgs-unstable = import inputs.nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  };

  inherit system;

  modules =
    m.configurations.common.__all
    ++ m.configurations.nixos.__all
    ++ [
      m.users.shakhzod

      inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-intel-gen6

      {
        boot.binfmt.emulatedSystems = [
          "aarch64-linux"
          "armv7l-linux"
        ];
        networking.hostName = "qoravoy";
        system.stateVersion = "26.05";
      }

      {
        zramSwap = {
          enable = true;
          algorithm = "zstd";
          memoryPercent = 50;
          priority = 32767;
        };

        swapDevices = [
          {
            device = "/swap/swapfile";
            size = 36 * 1024;
            priority = 1;
          }
        ];

        boot.initrd.systemd.enable = true;
        # boot.initrd.luks.devices."luks-root" = {
        #   device = "/dev/disk/by-uuid/YOUR_RAW_SSD_PARTITION_UUID";
        #   allowDiscards = true;
        # };
        boot.resumeDevice = "/dev/mapper/cryptroot";

        # Crucial Systemd bypass rule to prevent Btrfs hibernation space panics
        systemd.services.systemd-logind.environment = {
          SYSTEMD_BYPASS_HIBERNATION_MEMORY_CHECK = "1";
        };

        # Mandatory Btrfs Resume Target (Fill this after executing the command below)
        # boot.kernelParams = [ "resume_offset=YOUR_BTRFS_SWAP_OFFSET" ];

        # 1. Natively initialize the Btrfs swap file blocks into the subvolume
        # sudo btrfs filesystem mkswapfile --size 36g /swap/swapfile

        # 2. Extract the physical block calculation mapping offset
        # sudo btrfs inspect-internal map-swapfile -r /swap/swapfile
      }

      ({ pkgs, lib, ... }: {
        boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-lts-lto-x86_64-v3;
        nix.settings.system-features = lib.systems.architectures.features.x86-64-v3;
        nixpkgs.overlays = [
          inputs.nix-cachyos-kernel.overlays.pinned
        ];

        nixpkgs.hostPlatform = {
          gcc.arch = "x86-64-v3";
          gcc.tune = "x86-64-v3";
          system = "x86_64-linux";
        };
      })

      ({ pkgs, ... }: {
        services.fprintd.enable = true;
        services.fprintd.tod.enable = true;
        services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix-550a;
      })

      {
        services.fwupd.enable = true;

        powerManagement = {
          enable = true;
          powertop.enable = true;
        };

        powerManagement.cpuFreqGovernor = "powersave";
        services.power-profiles-daemon.enable = true;

        services.tlp = {
          enable = false;
          settings = {
            CPU_SCALING_GOVERNOR_ON_AC = "performance";
            CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

            CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
            CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

            CPU_MIN_PERF_ON_AC = 0;
            CPU_MAX_PERF_ON_AC = 100;
            CPU_MIN_PERF_ON_BAT = 0;
            CPU_MAX_PERF_ON_BAT = 20;

            #Optional helps save long term battery health
            START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
            STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
          };
        };
      }

      (
        {
          config,
          lib,
          modulesPath,
          ...
        }:
        {
          imports = [
            (modulesPath + "/installer/scan/not-detected.nix")
          ];

          boot.initrd.availableKernelModules = [
            "xhci_pci"
            "thunderbolt"
            "nvme"
            "usb_storage"
            "sd_mod"
          ];
          boot.initrd.kernelModules = [ ];
          boot.kernelModules = [ "kvm-intel" ];
          boot.extraModulePackages = [ ];

          fileSystems."/" = {
            device = "/dev/mapper/cryptroot";
            fsType = "ext4";
          };

          boot.initrd.luks.devices."cryptroot".device =
            "/dev/disk/by-uuid/f000980e-6415-4cc6-8343-4dd535f1d950";

          fileSystems."/boot" = {
            device = "/dev/disk/by-uuid/3457-123F";
            fsType = "vfat";
            options = [
              "fmask=0077"
              "dmask=0077"
            ];
          };

          swapDevices = [
            { device = "/dev/disk/by-uuid/3b139cd3-08ab-4329-ad37-44507bbfe916"; }
          ];

          nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
          hardware.cpu.intel.npu.enable = true;
          hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
        }
      )
    ];
}
