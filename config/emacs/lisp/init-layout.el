;;; init-layout.el --- Géométrie et typographie -*- lexical-binding: t; -*-

;; Respiration verticale, principalement en interface graphique.
(setq-default line-spacing 0.10)

;; Curseur stable, discret dans les fenêtres inactives.
(setq-default cursor-type 'box
              cursor-in-non-selected-windows nil)

(blink-cursor-mode -1)

;; Ligne courante dans les buffers de programmation.
(add-hook 'prog-mode-hook #'hl-line-mode)

(provide 'init-layout)
;;; init-layout.el ends here
