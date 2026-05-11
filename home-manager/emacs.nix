{
  inputs,
  pkgs,
  isDarwin,
  ...
}:
{
  imports = [
    inputs.nix-doom-emacs-unstraightened.homeModule
  ];

  programs.doom-emacs = {
    enable = true;
    doomDir = ../doomdir;
    emacs = if isDarwin then pkgs.emacs-macport else pkgs.emacs;
    experimentalFetchTree = true;
    provideEmacs = true;
    tangleArgs = "--all config.org";
    extraBinPackages = with pkgs; [
      # nerd-fonts.jetbrains-mono
      # nerd-fonts.symbols-only

      # Node.js ecosystem
      # nodejs
      # nodePackages.typescript
      # nodePackages.prettier
      # nodePackages.bash-language-server

      # LSP servers
      # vue-language-server
      # typescript-go
      # nodePackages.typescript-language-server
      # tailwindcss-language-server
      # vscode-json-languageserver
      # yaml-language-server
      # nil
      # pyright
      # rust-analyzer
      # texlab
      # haskell-language-server

      # Formatters/linters
      # nixfmt-rfc-style
      # shfmt
      # shellcheck

      # Tools
      # jq
      # python312Packages.grip
      # uv

      git
      ripgrep
      fd
      direnv
    ];
    extraPackages =
      epkgs: with epkgs; [
        treesit-grammars.with-all-grammars
      ];
  };
}
