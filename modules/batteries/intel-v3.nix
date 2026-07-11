{
  den.batteries.intel-v3 = {
    nixos = { lib, ... }: {
      nix.settings.system-features = lib.systems.architectures.features.x86-64-v3;
    };
  };
}
