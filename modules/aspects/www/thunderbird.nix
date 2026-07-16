{
  den.aspects.www.thunderbird = {
    nixos = {
      xdg.mime = {
        enable = true;
        defaultApplications = {
          "x-scheme-handler/mailto" = "thunderbird.desktop";
          "message/rfc822" = "thunderbird.desktop";
          "text/calendar" = "thunderbird.desktop";
          "application/x-extension-ics" = "thunderbird.desktop";
        };
      };
    };

    homeManager = {
      programs.thunderbird = {
        enable = true;

        profiles.default = {
          isDefault = true;
        };
      };
    };

    darwin.homebrew.casks = [ "thunderbird" ];
  };
}
