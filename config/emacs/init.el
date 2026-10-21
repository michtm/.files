;;; init.el --- Configuration principale -*- lexical-binding: t; -*-

(setq inhibit-startup-screen t
      initial-scratch-message nil)

;; Conserve les données de récupération hors du dépôt.
(let* ((xdg-state (getenv "XDG_STATE_HOME"))
       (state-home
        (if (and xdg-state
                 (file-name-absolute-p xdg-state))
            xdg-state
          (expand-file-name "~/.local/state/")))
       (directory
        (expand-file-name "emacs/auto-save-list/" state-home)))
  (unless (file-directory-p directory)
    (make-directory directory t))
  (setq auto-save-list-file-prefix
        (expand-file-name ".saves-" directory)))

;;; init.el ends here
