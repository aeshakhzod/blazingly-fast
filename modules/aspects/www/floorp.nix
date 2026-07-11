{
  den.aspects.www.floorp = {
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
            };
          };
        };
      };
  };
}
