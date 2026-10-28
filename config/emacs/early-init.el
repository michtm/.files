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

;; Seuil GC retenu après comparaison de 800 Ko, 4 Mio et 8 Mio.
;; Compromis entre fréquence des collectes et mémoire utilisée.
(setq gc-cons-threshold (* 4 1024 1024))

;; Police des frames graphiques, définie avant leur création.
(add-to-list 'default-frame-alist
             '(font . "IBM Plex Mono-12"))

;; Géométrie des frames, définie avant leur création.
(dolist (parameter
         '((menu-bar-lines . 0)
           (tool-bar-lines . 0)
           (vertical-scroll-bars . nil)
           (internal-border-width . 12)))
  (setf (alist-get (car parameter) default-frame-alist)
        (cdr parameter)))
;;; early-init.el ends here
