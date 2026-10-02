{ den, ... }: {
  den.aspects.profiles.homelab = {
    includes = with den.aspects.homelab; [
      defaults

      core.ssh
      core.fail2ban

      services.website
    ];
  };
}
