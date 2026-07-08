{ inputs, lib, ... }:
let
  inherit (inputs) xinux-modules;
in
{
  imports = [
    xinux-modules.nixosModules.efiboot
    xinux-modules.nixosModules.meta
    xinux-modules.inputs.relago.nixosModules.default
  ];

  programs.firefox.enable = lib.mkForce false;

  modules.efiboot.bootloader = "systemd-boot";
  modules.xinux = {
    nixSoftwareCenter.enable = false;
    xinuxModuleManager.enable = false;
    relago.enable = false;
    eimzoIntegraion.enable = false;
    binaryCompat.enable = false;
  };
  aagl.enableNixpkgsReleaseBranchCheck = false;
}
