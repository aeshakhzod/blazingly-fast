_: {
  # xdg.configFile."nix/nix.conf".source = config.sops.templates."nix/nix.conf".path;
  #
  # sops.templates."nix/nix.conf".content = ''
  #   access-tokens = github.com=${config.sops.placeholder."github/token"}
  # '';
}
