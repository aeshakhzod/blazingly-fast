{ ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    presets = [
      "nerd-font-symbols"
    ];
    settings = {
      battery.disabled = true;
    };
  };
}
