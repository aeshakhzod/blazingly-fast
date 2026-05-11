{ ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    # TODO: enable when 26.05 is out
    # presets = [
    #   "nerd-font-symbols"
    # ];
    settings = {
      battery.disabled = true;
    };
  };
}
