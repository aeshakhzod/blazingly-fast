{
  den.aspects.desktop.fprintd = {
    nixos = {
      services.fprintd = {
        enable = true;
        tod = {
          enable = true;
        };
      };
    };
  };
}
