{
  den.batteries.hibernation = {
    nixos = { pkgs, ... }: {
      systemd.services.systemd-suspend = {
        serviceConfig = {
          ExecStart = [
            ""
            "${pkgs.systemd}/lib/systemd/systemd-suspend-then-hibernate"
          ];
        };
      };

      systemd.sleep.settings = {
        Sleep = {
          HibernateDelaySec = "30m";
          SuspendState = "mem";
        };
      };
    };
  };
}
