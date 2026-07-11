(in-package :lem-user)
(use-package :lem-vi-mode)

(vi-mode)
(load-theme "gruvbox-dark-pale")

;; Safely load files
(defun load-path (file-path)
  (let ((path file-path))
    (handler-case
        (if (probe-file path)
            (load path)
            (show-message (format nil "Warning: ~a not found" path)))
      (error (e)
        (show-message (format nil "Error loading ~a: ~a" path e))))))

;; Loads (setf lem-lisp-mode/internal::*file-conversion-map*) with proper sources, since it comes from Nix
(load-path #P"~/.lem-source.lisp")

;; (load (merge-pathnames "which-key.lisp" (lem-home)))

(load (merge-pathnames "keybindings.lisp" (lem-home)))
(load (merge-pathnames "languages.lisp" (lem-home)))

(let ((path (merge-pathnames ".debug/debug.log" (lem-home))))
  (ensure-directories-exist path)
  (log:config :sane :daily path :warn))

;; (let ((ql-setup (merge-pathnames ".roswell/lisp/quicklisp/quicklisp/setup.lisp"
                                 ;; (user-homedir-pathname))))
  ;; (when (probe-file ql-setup)
    ;; (load ql-setup)))
