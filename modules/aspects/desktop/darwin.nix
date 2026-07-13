{ den, ... }: {
  den.aspects.desktop.darwin = {
    includes = [den.aspects.desktop.darwin-dock];
    darwin.system = {
        defaults = {
          NSGlobalDomain = {
            AppleShowAllExtensions = true;
            ApplePressAndHoldEnabled = false;

            # 120, 90, 60, 30, 12, 6, 2
            KeyRepeat = null;

            # 120, 94, 68, 35, 25, 15
            InitialKeyRepeat = null;

            "com.apple.mouse.tapBehavior" = 1;
            "com.apple.sound.beep.volume" = 0.0;
            "com.apple.sound.beep.feedback" = 0;
          };

          dock = {
            autohide = true;
            show-recents = false;
            launchanim = true;
            orientation = "bottom";
            tilesize = 48;
          };

          finder = {
            _FXShowPosixPathInTitle = false;
          };

          trackpad = {
            Clicking = true;
            TrackpadThreeFingerDrag = true;
          };

          # Disable animation when switching screens or opening apps
          # universalaccess.reduceMotion = true;

          # Whether to automatically rearrange spaces based on most recent use
          dock.mru-spaces = false;
        };
      };
  };
}
