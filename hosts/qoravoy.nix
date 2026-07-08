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

      inputs.disko.nixosModules.disko
      ./qoravoy-disko.nix

      ({ pkgs, lib, ... }: {
        networking.hostName = "qoravoy";
        system.stateVersion = "26.05";

        boot.binfmt.emulatedSystems = [
          "aarch64-linux"
          "armv7l-linux"
        ];

        systemd.services.systemd-suspend = {
          serviceConfig = {
            ExecStart = [
              ""
              "${pkgs.systemd}/lib/systemd/systemd-suspend-then-hibernate"
            ];
          };
        };

        systemd.sleep.settings = {
          Sleep = {
            HibernateDelaySec = "30m";
            SuspendState = "mem";
          };
        };

        services.btrfs.autoScrub = {
          enable = true;
          interval = "weekly";
          fileSystems = [ "/" ];
        };

        nix.settings.system-features = lib.systems.architectures.features.x86-64-v3;

        services.fprintd = {
          enable = true;
          tod = {
            enable = true;
            driver = pkgs.libfprint-2-tod1-goodix-550a;
          };
        };

        services.fwupd.enable = true;

        services.thermald.enable = true;

        # services.auto-cpufreq = {
        #   enable = true;
        #   settings = {
        #     battery = {
        #       governor = "powersave";
        #       turbo = "never";
        #     };
        #     charger = {
        #       governor = "performance";
        #       turbo = "auto";
        #     };
        #   };
        # };
        services.power-profiles-daemon.enable = true;

        powerManagement = {
          enable = true;
          powertop.enable = true;
          cpuFreqGovernor = "powersave";
        };
        # https://nixos.wiki/wiki/Power_Management#Troubleshooting
        services.udev.extraRules = ''
          ACTION=="add", SUBSYSTEM=="pci", DRIVER=="pcieport", ATTR{power/wakeup}="disabled"
        '';
      })

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
            "usbhid"
            "sd_mod"
          ];
          boot.initrd.kernelModules = [ ];
          boot.kernelModules = [ "kvm-intel" ];
          boot.extraModulePackages = [ ];

          nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
          hardware.cpu.intel.npu.enable = true;
          hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

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
          boot.initrd.luks.devices."luks-root" = {
            device = "/dev/disk/by-uuid/99797f0c-f858-4eb1-b712-6c00c92b4031";
            allowDiscards = true;
          };
          # boot.resumeDevice = "/dev/mapper/cryptroot";

          systemd.services.systemd-logind.environment = {
            SYSTEMD_BYPASS_HIBERNATION_MEMORY_CHECK = "1";
          };

          boot.kernelParams = [
            "resume=/dev/mapper/cryptroot"
            "resume_offset=3679488"
          ];

        }
      )
    ];
}
