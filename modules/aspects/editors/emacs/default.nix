{
  den.aspects.editors.emacs = {
    homeManager = { pkgs, ... }: {
      programs.emacs = {
        enable = true;
        package = pkgs.emacs-gtk;
        extraPackages =
          epkgs: with epkgs; [
            # https://github.com/MiztaOak/nixos-config/blob/88d675d40cbfab293d5031f2e7159b80ea333fad/home-manager/emacs.nix#L19
            gruvbox-theme

            tree-sitter
            tree-sitter-langs
            treesit-grammars.with-all-grammars
          ];
        extraConfig = ''
          (setq standard-indent 2)
          (set-fontset-font "fontset-default" 'unicode "JetBrainMono Nerd Font")
          (add-to-list 'default-frame-alist
                       '(font . "JetBrainsMono Nerd Font-12"))

          (setq visible-bell 1)
          (setq ring-bell-function 'ignore)

          ;; https://github.com/yuanw/nix-home/blob/ab5f9f1a99763d6a91a1039dedef764f6ff44847/modules/editor/emacs/features/tree-sitter.nix#L17
          (use-package tree-sitter
            :config
            (global-tree-sitter-mode)
            (add-hook 'tree-sitter-mode-hook #'tree-sitter-hl-mode)
            (setq major-mode-remap-alist
                  '((yaml-mode . yaml-ts-mode)
                    (bash-mode . bash-ts-mode)
                    (js2-mode . js-ts-mode)
                    (json-mode . json-ts-mode)
                    (css-mode . css-ts-mode)
                    (python-mode . python-ts-mode)
                    (nix-mode . nix-ts-mode))))

          (use-package tree-sitter-langs
            :after tree-sitter
            :config
            (add-to-list 'tree-sitter-major-mode-language-alist '(markdown-mode . markdown)))

          (load-theme 'gruvbox-dark-medium)
        '';
      };

      services.emacs = {
        enable = true;
      };
    };
  };
}
