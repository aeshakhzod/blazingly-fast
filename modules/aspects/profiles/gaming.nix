{ den, ... }: {
  den.aspects.profiles.gaming = {
    includes = with den.aspects; [
      gaming.minecraft
      gaming.steam
    ];
  };
}
