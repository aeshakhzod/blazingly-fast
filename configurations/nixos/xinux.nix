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

  modules.xinux = {
    nixSoftwareCenter.enable = false;
    xinuxModuleManager.enable = false;
    binaryCompat.enable = true;
    # eimzoIntegration.enable = false;
  };

  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        settings = {
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
          };
          "org/gnome/desktop/input-sources" = {
            xkb-options = [ "compose:ralt" ];
          };
        };
      }
    ];
  };
}
