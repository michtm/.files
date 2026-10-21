;;; init-navigation.el --- Navigation native -*- lexical-binding: t; -*-

;; Historique des fichiers récemment ouverts.
(setq recentf-max-saved-items 100
      recentf-auto-cleanup 'never)

(recentf-mode 1)

;; project.el, imenu et xref restent chargés à la demande.

(provide 'init-navigation)
;;; init-navigation.el ends here
