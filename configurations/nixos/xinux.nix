{ inputs, lib, ... }:
let
  inherit (inputs) xinux-modules;
in
{
  imports = [
    xinux-modules.nixosModules.efiboot
    xinux-modules.nixosModules.meta
  ];

  programs.firefox.enable = lib.mkForce false;

  modules.efiboot.bootloader = "systemd-boot";
  modules.xinux = {
    nixSoftwareCenter.enable = false;
    xinuxModuleManager.enable = false;
    binaryCompat.enable = true;
    # eimzoIntegration.enable = false;
  };
}
