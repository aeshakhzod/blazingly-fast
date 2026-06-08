{ pkgs, pkgs-unstable, ... }:
let
  kanata = pkgs-unstable.kanata;
in
{
  environment.systemPackages = [
    kanata
    (pkgs.writeScriptBin "kanata-gallium" ''
      sudo ${kanata}/bin/kanata -c ${../../dotfiles/keyboard.kbd}
    '')
  ];
}
