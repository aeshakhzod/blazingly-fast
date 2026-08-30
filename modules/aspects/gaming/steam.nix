{ inputs, ... }: {
  den.aspects.gaming.steam = {
    nixos = { pkgs, lib, ... }: {
      imports = [
        inputs.steam-asahi.nixosModules.default
      ];
      config = lib.mkMerge [
        (lib.mkIf pkgs.stdenv.hostPlatform.isx86_64 {
          programs.steam = {
            enable = true;
            extest.enable = true;
            gamescopeSession.enable = true;
            protontricks.enable = true;
          };
        })

        (lib.mkIf pkgs.stdenv.hostPlatform.isAarch64 {
          programs.steam-asahi = {
            enable = true;
            memoryMiB = 16 * 1024;
          };

          services.pipewire = {
            enable = true;
            alsa.enable = true;
            pulse.enable = true;
          };
        })
      ];
    };
    darwin.homebrew.casks = [ "steam" ];
  };

  flake-file.inputs.steam-asahi = {
    url = "github:sm-idk/steam-asahi";
  };
}
