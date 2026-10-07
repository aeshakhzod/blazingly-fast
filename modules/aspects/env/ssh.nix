{
  den.aspects.env.ssh = {
    nixos =
      {
        lib,
        config,
        pkgs,
        ...
      }:
      let
        gnomeEnabled = config.services.desktopManager.gnome.enable;
      in
      lib.mkMerge [
        {
          programs.ssh = {
            enableAskPassword = true;
          };

          environment.sessionVariables = {
            # Forces SSH to prioritize the graphical askpass prompt even inside a TTY/Terminal
            SSH_ASKPASS_REQUIRE = "prefer";
            SSH_ASKPASS = config.programs.ssh.askPassword;
          };
        }
        (lib.mkIf gnomeEnabled {
          programs.seahorse.enable = true;
          programs.ssh.askPassword = "${pkgs.seahorse}/libexec/seahorse/ssh-askpass";
          services.gnome.gnome-keyring.enable = true;
        })
      ];

    homeManager = { osConfig, ... }: {
      # idk, weird error where SSH_ASKPASS is empty, even though everything is set
      programs.zsh.initContent = ''
        export SSH_ASKPASS="${osConfig.programs.ssh.askPassword}"
      '';
    };
  };
}
