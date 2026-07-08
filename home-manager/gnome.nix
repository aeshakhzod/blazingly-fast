{ pkgs, ... }: {
  programs.gnome-shell = {
    enable = true;
    extensions = with pkgs.gnomeExtensions; [
      { id = "power-off-options@axelitama.github.io"; package = power-off-options;}
      { id = "runcat@kolesnikov.se"; package = runcat;}
    ];
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
        font-antialiasing = "rgba";
        show-battery-percentage = true;
        clock-format = "24h";
        clock-show-seconds = true;
        enable-animations = true;
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
      # https://github.com/emilisacson/nix-config-dell/blob/main/desktop/hibernation.nix
      "org/gnome/settings-daemon/plugins/power" = {
        lid-close-ac-action = "suspend";
        lid-close-battery-action = "hibernate";

        sleep-inactive-ac-type = "nothing";
        sleep-inactive-ac-timeout = 3600;
        sleep-inactive-battery-type = "suspend";
        sleep-inactive-battery-timeout = 1800;

        idle-dim = true;
        show-battery-percentage = true;
        power-button-action = "interactive"; # Show power dialog

        critical-battery-action = "hibernate";
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
  };
}
