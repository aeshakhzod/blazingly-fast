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
