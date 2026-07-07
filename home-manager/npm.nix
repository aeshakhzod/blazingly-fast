{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    pnpm
    yarn
    tailwindcss_4
    typescript-language-server
    tailwindcss-language-server
    typescript
    package-version-server
  ];
}
