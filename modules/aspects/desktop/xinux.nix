{ inputs, ... }:
let
  inherit (inputs) xinux-modules;
in
{
  den.aspects.desktop.xinux = {
    nixos = { lib, ... }: {
      imports = [
        "${xinux-modules}/modules/nixos/branding/version.nix"
        "${xinux-modules}/modules/nixos/graphical/desktop.nix"
      ];

      options.modules.gnome.gsconnect.enable = lib.mkEnableOption "";

      config = {
        xinux = {
          osInfo.enable = true;
        };

        security = {
          sudo-rs.enable = true;
        };

        programs = {
          mtr.enable = true;
        };

        modules.desktop.enable = true;

        nixpkgs.overlays = [
          xinux-modules.inputs.xinux-wallpaper.overlays.default
        ];

        nix.settings.experimental-features = [
          "pipe-operators"
        ];
      };
    };
  };

  # flake-file.inputs.xinux-modules = {
  #   url = "git+https://git.oss.uzinfocom.uz/xinux/modules?ref=release-26.05&shallow=1";
  #   inputs.nixpkgs.follows = "nixpkgs";
  # };
}
