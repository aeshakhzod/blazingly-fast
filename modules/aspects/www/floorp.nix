{
  den.aspects.www.floorp = {
    nixos = {
      xdg.mime = {
        enable = true;
        defaultApplications = {
          "text/html" = "floorp.desktop";
          "x-scheme-handler/http" = "floorp.desktop";
          "x-scheme-handler/https" = "floorp.desktop";
          "x-scheme-handler/about" = "floorp.desktop";
          "x-scheme-handler/unknown" = "floorp.desktop";
        };
      };
    };

    homeManager =
      { pkgs, ... }:
      {
        # https://nur.nix-community.org/repos/rycee/
        programs.floorp = {
          enable = true;

          profiles.default = {
            extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
              ublock-origin
              sidebery
              react-devtools
              bitwarden
              youtube-recommended-videos
              darkreader
            ];

            settings = {
              "browser.ctrlTab.sortByRecentlyUsed" = true;
              "floorp.browser.tabbar.settings" = 2;
              "signon.rememberSignons" = false;
              "signon.management.page.breach-alerts.enabled" = false;
            };
          };
        };
      };

    darwin.homebrew.casks = [ "floorp" ];
  };
}
