;;; init-state.el --- Données persistantes -*- lexical-binding: t; -*-

(let* ((xdg-state (getenv "XDG_STATE_HOME"))
       (state-home
        (if (and xdg-state (file-name-absolute-p xdg-state))
            xdg-state
          (expand-file-name "~/.local/state/")))
       (root (expand-file-name "emacs/" state-home))
       (backups (expand-file-name "backups/" root))
       (autosaves (expand-file-name "autosaves/" root))
       (sessions (expand-file-name "auto-save-list/" root)))

  ;; Répertoires privés : ils peuvent contenir du code sensible.
  (dolist (directory (list root backups autosaves sessions))
    (unless (file-directory-p directory)
      (make-directory directory t))
    (set-file-modes directory #o700))

  ;; Sauvegardes numérotées, sans polluer les projets.
  (setq backup-directory-alist `(("." . ,backups))
        version-control t
        kept-new-versions 6
        kept-old-versions 2
        delete-old-versions t)

  ;; Sauvegardes automatiques et récupération de session.
  (setq auto-save-file-name-transforms
        `((".*" ,autosaves t))
        auto-save-list-file-prefix
        (expand-file-name ".saves-" sessions))

  ;; État utilisateur.
  (setq savehist-file (expand-file-name "history" root)
        save-place-file (expand-file-name "places" root)
        recentf-save-file (expand-file-name "recentf" root)
        project-list-file (expand-file-name "projects" root)
        custom-file (expand-file-name "custom.el" root)))

;; Historique du minibuffer et position dans les fichiers.
(savehist-mode 1)
(save-place-mode 1)

(provide 'init-state)
;;; init-state.el ends here
