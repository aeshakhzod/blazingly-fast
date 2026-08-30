{
  den.aspects.communication.discord = {
    homeManager = { pkgs, ... }: {
      programs.discord = {
        enable = !(pkgs.stdenv.hostPlatform.system == "aarch64-linux");
      };
    };
  };
}
