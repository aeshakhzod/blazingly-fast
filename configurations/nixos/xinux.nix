{ inputs, lib, ... }: let
inherit (inputs) xinux-modules;
in {
  imports = [
    xinux-modules.nixosModules.efiboot
    xinux-modules.nixosModules.meta
  ];

  programs.firefox.enable = lib.mkForce false;

  programs.dconf = {
    enable = true;
    profiles.user.databases =[
      {
        settings ={
          "org/gnome/desktop/interface"={
            color-scheme = "prefer-dark";
          };
        };
      }
    ];
  };
}
