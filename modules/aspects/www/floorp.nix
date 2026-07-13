{
  den.aspects.www.floorp = { host, ... }: {
    homeManager =
      { pkgs, lib, ... }:
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
            };
          };
        };

        xdg.mimeApps = lib.mkIf (host == "linux") {
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
  };
}
