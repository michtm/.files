;;; init-editing.el --- Comportement de l'éditeur -*- lexical-binding: t; -*-

;; Remplace la sélection active lors de la saisie.
(delete-selection-mode 1)

;; Signale les délimiteurs correspondants.
(show-paren-mode 1)

;; Insère automatiquement les paires dans les modes de programmation.
(add-hook 'prog-mode-hook #'electric-pair-local-mode)

(provide 'init-editing)
;;; init-editing.el ends here
