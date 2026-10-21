;;; early-init.el --- Initialisation précoce -*- lexical-binding: t; -*-

;; Aucun paquet tiers activé automatiquement.
(setq package-enable-at-startup nil)

;; Les fichiers compilés restent hors du dépôt.
(when (fboundp 'startup-redirect-eln-cache)
  (let ((cache-home (getenv "XDG_CACHE_HOME")))
    (startup-redirect-eln-cache
     (expand-file-name
      "emacs/eln-cache/"
      (if (and cache-home
               (file-name-absolute-p cache-home))
          cache-home
        (expand-file-name "~/.cache/"))))))

;;; early-init.el ends here
