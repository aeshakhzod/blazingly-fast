{ pkgs, lib, ... }: let
  rbw = pkgs.rbw;
in{
  programs.zsh.initContent = lib.mkAfter ''
    eval "$(${rbw}/bin/rbw gen-completions zsh)"
  '';

  home.packages = [rbw];

  home.activation.hot-patcher = lib.hm.dag.entryAfter ["writeBoundary"] ''
    echo hello
  '';
}
