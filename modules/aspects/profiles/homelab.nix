{ den, ... }: {
  den.aspects.profiles.homelab = {
    includes = with den.aspects; [
      gaming.vortex-server
    ];

    darwin = {
      services.openssh = {
        enable = true;
        extraConfig = ''
          Port 22
          PasswordAuthentication no
          KbdInteractiveAuthentication no
          PermitRootLogin no
          ClientAliveInterval 300
          ClientAliveCountMax 2
          MaxAuthTries 3
        '';
      };
    };
  };
}
