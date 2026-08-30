{
  den.aspects.env.podman = {
    nixos = {
      virtualisation.podman = {
        enable = true;
        dockerCompat = true;
      };
    };
  };
}
