{
  den.aspects.editors.emacs = {
    homeManager = { pkgs, ... }: {
      programs.emacs = {
        enable = true;
        package = pkgs.emacs-gtk.override { withNativeCompilation = true; };
        extraPackages =
          epkgs: with epkgs; [
            # https://github.com/MiztaOak/nixos-config/blob/88d675d40cbfab293d5031f2e7159b80ea333fad/home-manager/emacs.nix#L19
            gruvbox-theme

            treesit-grammars.with-all-grammars
            magit
            vterm
            projectile
            expand-region
            change-inner

            envrc
            nix-mode
            nix-ts-mode
            rustic
          ];
        extraConfig = ''
          (setq standard-indent 2)
          (set-fontset-font "fontset-default" 'unicode "JetBrainMono Nerd Font")
          (add-to-list 'default-frame-alist
                       '(font . "JetBrainsMono Nerd Font-12"))

          (setq visible-bell 1)
          (setq ring-bell-function 'ignore)

          (which-key-mode 1)
          (which-key-setup-side-window-bottom)

          (projectile-mode +1)
          (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)

          (use-package expand-region
            :bind ("C-=" . er/expand-region))

          (require 'change-inner)
          (global-set-key (kbd "M-i") 'change-inner)
          (global-set-key (kbd "M-o") 'change-outer)

          (use-package envrc
            :hook (after-init . envrc-global-mode))

          (with-eval-after-load 'envrc
            (define-key envrc-mode-map (kbd "C-c e") 'envrc-command-map))

          (use-package nix-mode
            :mode "\\.nix\\'")

          ;(use-package nix-ts-mode
          ;  :mode "\\.nix\\'")

          (use-package rustic
            :ensure t
            :config
            (setq rustic-format-on-save nil)
            :custom
            (rustic-cargo-use-last-stored-arguments t))

          (global-set-key [remap list-buffers] 'ibuffer)

          (load-theme 'gruvbox-dark-medium)
        '';
      };

      services.emacs = {
        enable = true;
      };
    };
  };
}
