{ pkgs, ... }:
{
  home.packages =
    let
      packages = with pkgs; [
        nodejs_24
        pnpm
        yarn
        tailwindcss_4
        typescript-language-server
        tailwindcss-language-server
      ];
      nodePackages = with pkgs.nodePackages; [
        typescript
      ];
    in
    packages ++ nodePackages;
}
