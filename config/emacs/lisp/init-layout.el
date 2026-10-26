;;; init-layout.el --- Géométrie et typographie -*- lexical-binding: t; -*-

;; Une légère respiration verticale en interface graphique.
;; Sans effet dans les terminaux texte.
(setq-default line-spacing 0.10)

;; Curseur stable et fenêtres secondaires discrètes.
(setq-default cursor-type 'box
              cursor-in-non-selected-windows nil)

(blink-cursor-mode -1)

;; Met en évidence la ligne courante dans les buffers de code.
(add-hook 'prog-mode-hook #'hl-line-mode)

;; Éléments graphiques non indispensables.
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Bordure intérieure des nouvelles fenêtres graphiques.
(add-to-list 'default-frame-alist
             '(internal-border-width . 12))

;; Ajustements de la fenêtre graphique actuelle.
(when (display-graphic-p)
  (set-frame-parameter nil 'internal-border-width 12)

  ;; Utilise IBM Plex Mono uniquement si elle est disponible.
  (when (member "IBM Plex Mono" (font-family-list))
    (set-face-attribute 'default nil
                        :family "IBM Plex Mono"
                        :height 120)))

(provide 'init-layout)
;;; init-layout.el ends here
