(in-package :lem-user)
(use-package :lem-vi-mode)

;; (defun nixfmt (buf)
;; (filter-buffer (append '("nixfmt") ()
;; (list (buffer-filename buf)))))

(defun nixfmt (buf)
  (let ((file (buffer-filename buf)))
    (when file
      (save-buffer buf)  ;; save first so nixfmt sees latest content
      (uiop:run-program (list "nixfmt" file)
                        :ignore-error-status t)
      (revert-buffer t))))  ;; reload from disk

(register-formatter lem-nix-mode:nix-mode 'nixfmt)

;; Lifts up the priority of filer keymaps over vi-mode while preserving remained as vi-mode
(defmethod lem-vi-mode/core:mode-specific-keymaps ((mode lem/filer::filer-mode))
  (list lem/filer::*filer-mode-keymap*))
