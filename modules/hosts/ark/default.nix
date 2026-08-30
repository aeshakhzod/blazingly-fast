{ den, inputs, ... }: {
  den.hosts.aarch64-linux.ark = {
    users.shakhzod = { };
  };

  den.aspects.ark = {
    includes = [
      den.aspects.profiles.workhorse
      den.aspects.profiles.gaming

      den.aspects.packages.nixos-packages
      den.aspects.packages.global-packages
    ];

    nixos = { lib, ... }: {
      imports = [
        inputs.apple-silicon.nixosModules.apple-silicon-support
        ./_imports/hardware-configuration.nix
      ];

      hardware = {
        asahi = {
          enable = true;
          peripheralFirmwareDirectory = ./_imports/firmware;
          setupAsahiSound = true;
        };
        # Provide the Asahi Mesa GPU userspace (incl. the Honeykrisp Vulkan ICD in
        # /run/opengl-driver) so any Asahi host can use the GPU (e.g. llama.cpp).
        graphics.enable = lib.mkDefault true;
      };

      boot = {
        loader.systemd-boot.enable = true;
        loader.efi.canTouchEfiVariables = false;

        extraModprobeConfig = ''
          options hid_apple fnmode=2 iso_layout=0 swap_opt_cmd=1
        '';
      };
      networking.networkmanager = {
        enable = true;
        wifi.backend = "iwd";
      };
      powerManagement.powertop.enable = lib.mkForce false;
      boot.binfmt.emulatedSystems = [ "x86_64-linux" ];

      services.pipewire = {
        enable = true;
        alsa.enable = true;
        pulse.enable = true;
      };

      swapDevices = [
        {
          device = "/var/lib/swapfile";
          size = 34 * 1024; # MiB
        }
      ];

      boot.kernelParams = [
        "zswap.enabled=1"
        "zswap.compressor=zstd"
        "zswap.zpool=zsmalloc"
        "zswap.max_pool_percent=20"
      ];

      boot.kernel.sysctl = {
        "vm.swappiness" = 100;
        "vm.page-cluster" = 0;
        "vm.watermark_scale_factor" = 125;
        "vm.max_map_count" = 1048576;
      };
    };
  };

  flake-file.inputs.apple-silicon.url = "github:nix-community/nixos-apple-silicon";
}
