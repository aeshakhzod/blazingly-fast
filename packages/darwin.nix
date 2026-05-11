{ ... }:
{
  homebrew = {
    enable = true;
    taps = [
      # "dart-lang/dart"
    ];
    brews = [
      "cocoapods"
      # "dart"
      "gnupg"
      "roswell"
      "llvm"
    ];
    casks = [
      # Development Tools
      "alacritty"
      "docker-desktop"
      "visual-studio-code"
      "zed"
      "postman"
      # "termius"
      # "mongodb-compass"
      # "jetbrains-toolbox"
      # "proxyman"
      "utm"
      "little-snitch"
      "figma"
      "flutter"
      # "android-studio"
      "racket"

      # Communication Tools
      "discord"
      "telegram"
      "element"
      # "zulip"

      # Utility Tools
      "syncthing-app"
      "bitwarden"
      "keymapp"
      # "balenaetcher"
      "font-jetbrains-mono-nerd-font"
      "logi-options+"
      "piphero"
      "transmission"
      "claude-code@latest"
      "tailscale-app"
      "macs-fan-control"

      # Entertainment Tools
      "vlc"
      "spotify"
      "obs"
      "obsidian"

      # Productivity Tools
      "raycast"
      "tomatobar"

      # Browsers
      "floorp"
      "brave-browser"
      "thunderbird"
    ];

    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    # These app IDs are from using the mas CLI app
    # mas = mac app store
    # https://github.com/mas-cli/mas
    #
    # $ nix shell nixpkgs#mas
    # $ mas search <app name>
    #
    # If you have previously added these apps to your Mac App Store profile (but not installed them on this system),
    # you may receive an error message "Redownload Unavailable with This Apple ID".
    # This message is safe to ignore. (https://github.com/dustinlyons/nixos-config/issues/83)

    masApps = {
      # Xcode = 497799835;
      # RunCat = 1429033973;
    };
  };
}
