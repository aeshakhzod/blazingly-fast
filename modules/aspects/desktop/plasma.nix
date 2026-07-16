{ inputs, ... }: {
  den.aspects.desktop.plasma = {
    nixos = { pkgs, ... }: {
      services = {
        desktopManager.plasma6.enable = true;
        displayManager.sddm.enable = true;
        displayManager.sddm.wayland.enable = true;
      };

      environment.systemPackages = with pkgs; [
        # KDE Utilities
        kdePackages.discover # Optional: Software center for Flatpaks/firmware updates
        kdePackages.kcalc # Calculator
        kdePackages.kcharselect # Character map
        kdePackages.kclock # Clock app
        kdePackages.kcolorchooser # Color picker
        kdePackages.kolourpaint # Simple paint program
        kdePackages.ksystemlog # System log viewer
        kdePackages.sddm-kcm # SDDM configuration module
        kdiff3 # File/directory comparison tool

        # Hardware/System Utilities (Optional)
        kdePackages.isoimagewriter # Write hybrid ISOs to USB
        kdePackages.partitionmanager # Disk and partition management
        hardinfo2 # System benchmarks and hardware info
        wayland-utils # Wayland diagnostic tools
        wl-clipboard # Wayland copy/paste support
        vlc # Media player
      ];

      home-manager.sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];

      programs.ssh.askPassword = "${pkgs.kdePackages.ksshaskpass.out}/bin/ksshaskpass";
      programs.gnupg.agent.pinentryPackage = pkgs.pinentry-qt;

      networking.networkmanager.enable = true;
    };

    homeManager = {
      # https://htmlpreview.github.io/?https://github.com/nix-community/plasma-manager/blob/3960d07e0a218fdb08195ed1bc07e24a795cd0cb/options.xhtml
      programs.plasma = {
        enable = true;

        overrideConfig = true;

        workspace = {
          lookAndFeel = "org.kde.breezedark.desktop";
        };

        kwin.virtualDesktops = {
          number = 4;
          rows = 1;
        };

        powerdevil = {
          battery = {
            whenLaptopLidClosed = "hibernate";
            whenSleepingEnter = "standbyThenHibernate";
          };
          batteryLevels = {
            criticalAction = "hibernate";
            criticalLevel = 10;
            lowLevel = 30;
          };
        };

        # configFile = {
        #   kdeglobals = {
        #     # https://github.com/alexhulbert/SeaGlass/blob/3f5437f3524935e70f9ddd6a9c6aebea2c0de2fc/user/plasma.nix
        #     General = {
        #       fixed = "JetBrainsMono,11,-1,5,50,0,0,0,0,0";
        #       font = "Noto Sans,11,-1,5,50,0,0,0,0,0";
        #       menuFont = "Noto Sans,11,-1,5,50,0,0,0,0,0";
        #       smallestReadableFont = "Noto Sans,9,-1,5,50,0,0,0,0,0";
        #       toolBarFont = "Noto Sans,11,-1,5,50,0,0,0,0,0";
        #       BrowserApplication = "floorp.desktop";
        #     };
        #   };
        # };

        fonts = {
          general = {
            family = "Noto Sans";
            pointSize = 11;
          };

          fixedWidth = {
            family = "JetBrainsMono";
            pointSize = 11;
          };

          small = {
            family = "Noto Sans";
            pointSize = 8;
          };

          toolbar = {
            family = "Noto Sans";
            pointSize = 10;
          };

          menu = {
            family = "Noto Sans";
            pointSize = 10;
          };

          windowTitle = {
            family = "Noto Sans";
            pointSize = 10;
          };
        };

        # https://github.com/dsalwasser/nixos-config/blob/fbf6bc191cb28519449e20c34563dd10979ce678/modules/home/kde-plasma.nix
        panels = [
          {
            location = "bottom";
            alignment = "center";
            lengthMode = "fill";
            height = 42;
            screen = 0;
            widgets = [
              "org.kde.plasma.kickoff"
              {
                name = "org.kde.plasma.icontasks";
                config.General = {
                  groupingStrategy = 0;
                };
              }
              "org.kde.plasma.panelspacer"
              "org.kde.plasma.systemmonitor.net"
              "org.kde.plasma.systemmonitor.cpu"
              "org.kde.plasma.systemmonitor.memory"
              "org.kde.plasma.pager"
              {
                name = "org.kde.plasma.systemtray";
                config.General = rec {
                  scaleIconsToFit = true;
                  spacing = 2;
                  shownItems = [
                    "org.kde.plasma.notifications"
                    "org.kde.plasma.volume"
                    "org.kde.plasma.battery"
                    "org.kde.plasma.networkmanagement"
                    "org.kde.plasma.clipboard"
                    "org.kde.plasma.bluetooth"
                    "org.kde.plasma.battery"
                  ];
                  extraItems = [
                    "org.kde.plasma.bluetooth"
                    "org.kde.plasma.battery"
                    "org.kde.plasma.clipboard"
                    "org.kde.plasma.devicenotifier"
                    "org.kde.plasma.manage-inputmethod"
                    "org.kde.plasma.mediacontroller"
                    "org.kde.plasma.notifications"
                    "org.kde.plasma.keyboardindicator"
                    "org.kde.plasma.keyboardlayout"
                    "org.kde.plasma.networkmanagement"
                    "org.kde.plasma.volume"
                    "org.kde.plasma.vault"
                    "org.kde.kdeconnect"
                    "org.kde.kscreen"
                    "org.kde.plasma.printmanager"
                    "org.kde.plasma.brightness"
                    "org.kde.plasma.cameraindicator"
                  ];
                  knownItems = extraItems;
                };
              }
              {
                name = "org.kde.plasma.digitalclock";
                config.Appearance = {
                  autoFontAndSize = false;
                  dateDisplayFormat = 1;
                  dateFormat = "custom";
                  customDateFormat = "dd.MM.yyyy";
                  firstDayOfWeek = "1";
                  fontFamily = "Noto Sans";
                  fontSize = 8;
                  fontStyleName = "Regular";
                  fontWeight = 400;
                  use24hFormat = 2;
                };
              }
            ];
          }
        ];
      };

      programs.ghostwriter.enable = true;
    };
  };

  flake-file.inputs.plasma-manager = {
    url = "github:nix-community/plasma-manager";
    inputs.nixpkgs.follows = "nixpkgs";
    inputs.home-manager.follows = "home-manager";
  };
}
