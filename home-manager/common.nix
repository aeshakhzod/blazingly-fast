{ ... }:
{
  home = {
    enableNixpkgsReleaseCheck = false;
    stateVersion = "26.05";
  };

  targets.darwin.copyApps.enable = false;
  targets.darwin.linkApps.enable = false;

  # Marked broken Oct 20, 2022 check later to remove this
  # https://github.com/nix-community/home-manager/issues/3344
  # manual.manpages.enable = false;
}
