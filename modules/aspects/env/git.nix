{
  den.aspects.env.git = {
    homeManager = {
      programs.git = {
        enable = true;
        lfs.enable = true;

        ignores = [
          ".idea"
          "node_modules"
          ".DS_Store"
          "*.swp"
          "*~"
          "*#"
          ".#*"
          ".bg-shell"
        ];

        extraConfig.credential.helper = "store";

        settings = {
          init.defaultBranch = "main";
          core = {
            editor = "nvim";
            autocrlf = "input";
          };
          commit.gpgsign = true;
          pull.rebase = true;
          rebase.autoStash = true;
          push.autoSetupRemote = true;
        };
      };
    };
  };
}
