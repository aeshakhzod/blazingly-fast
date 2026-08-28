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
            # startAgent = true;

            # Configure SSH askpass for GNOME
            # enableAskPassword = lib.mkIf gnomeEnabled true;
            # askPassword = lib.mkIf gnomeEnabled "${pkgs.openssh-askpass}/libexec/gtk-ssh-askpass";
            # askPassword = lib.mkIf gnomeEnabled "${pkgs.seahorse.out}/libexec/seahorse/ssh-askpass";
          };
          environment.sessionVariables = {
            # Forces SSH to prioritize the graphical askpass prompt even inside a TTY/Terminal
            SSH_ASKPASS_REQUIRE = "prefer";
          };
        }
        (lib.mkIf gnomeEnabled {
          programs.seahorse.enable = true;
          programs.ssh.askPassword = "${pkgs.seahorse}/libexec/seahorse/ssh-askpass";
          services.gnome.gnome-keyring.enable = true;
        })
      ];
  };
}
