{ inputs, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = false;
      allowInsecure = false;
      allowUnsupportedSystem = true;
    };

    overlays = [
      inputs.nur.overlays.default
      inputs.lem.overlays.default

      # direnv: CGO needed for -linkmode=external on darwin
      (_final: prev: {
        direnv = prev.direnv.overrideAttrs (old: {
          doCheck = false;
          env = (old.env or { }) // {
            CGO_ENABLED = "1";
          };
        });
      })
    ];
  };
}
