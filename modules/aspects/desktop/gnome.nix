{
  den.aspects.desktop.gnome = {
    nixos =
      { pkgs, lib, ... }:
      let
        inherit (lib) gvariant;
      in
      {
        services = {
          displayManager.gdm.enable = true;
          desktopManager.gnome.enable = true;
          xserver.enable = true;
          gnome = {
            # gnome-keyring.enable = true;
            # gcr-ssh-agent.enable = true;
            sushi.enable = true;
          };
        };

        # programs.ssh.askPassword = "${pkgs.gcr}/libexec/gcr-ssh-askpass";

        # Fix GNOME autologin
        systemd = {
          services = {
            "getty@tty1" = {
              enable = false;
            };
            "autovt@tty1" = {
              enable = false;
            };
          };
        };

        environment.systemPackages = with pkgs; [
          adwaita-icon-theme
          papirus-icon-theme

          gnomeExtensions.power-off-options
          gnomeExtensions.runcat
        ];

        programs.dconf = {
          enable = true;

          profiles.user.databases = [
            {
              settings = {
                "org/gnome/desktop/interface" = {
                  color-scheme = "prefer-dark";
                  enable-hot-corners = false;
                  font-antialiasing = "rgba";
                  show-battery-percentage = true;
                  clock-format = "24h";
                  clock-show-seconds = true;
                  enable-animations = true;
                  cursor-theme = "Adwaita";
                  cursor-size = gvariant.mkUint32 24;
                };

                "org/gnome/system/locale" = {
                  region = "uz_UZ.UTF-8";
                };

                "system/locale" = {
                  region = "uz_UZ.UTF-8";
                };

                "org/gnome/desktop/input-sources" = {
                  xkb-options = [ "compose:ralt" ];
                };

                "org/gnome/desktop/session" = {
                  idle-delay = gvariant.mkUint32 0;
                };

                # https://github.com/emilisacson/nix-config-dell/blob/main/desktop/hibernation.nix
                "org/gnome/settings-daemon/plugins/power" = {
                  lid-close-ac-action = "suspend";
                  lid-close-battery-action = "hibernate";

                  sleep-inactive-ac-type = "nothing";
                  sleep-inactive-ac-timeout = gvariant.mkUint32 3600;
                  sleep-inactive-battery-type = "suspend";
                  sleep-inactive-battery-timeout = gvariant.mkUint32 1800;

                  idle-dim = true;
                  show-battery-percentage = true;
                  power-button-action = "interactive"; # Show power dialog

                  critical-battery-action = "hibernate";
                  ambient-enabled = false;
                };

                # Session manager logout settings
                "org/gnome/SessionManager" = {
                  logout-prompt = false; # Don't prompt on logout
                };

                "org/gnome/nautilus/preferences" = {
                  default-folder-viewer = "list-view";
                  search-filter-time-type = "last_modified";
                  show-create-link = true;
                  show-directory-item-counts = "always";
                  default-sort-order = "name";
                  default-sort-in-reverse-order = false;
                };

                "org/gnome/nautilus/list-view" = {
                  default-folder-viewer = "list-view";
                  use-tree-view = false;
                };

                "org/gnome/nautilus/icon-view" = {
                  default-zoom-level = "standard";
                };

                "org/gnome/shell/extensions/runcat" = {
                  displaying-items = "character-and-percentage";
                };
              };
            }
          ];
        };
      };
  };
}
