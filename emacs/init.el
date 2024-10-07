;;; init.el --- Ma configuration Emacs

;;; Commentary:
;; Lire https://www.gnu.org/software/emacs/manual/html_node/elisp/Startup-Summary.html

;;; Code:
;; Chargement de early-init.el pour des anciennes versions
;; Hypothèse: common-base est déjà chargé dans early-init.el
(when (version< emacs-version "27")
  (load (concat user-emacs-directory "early-init.el") t))

;; Chargement du fichier de personnalisation
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file t)

;; Quelques configurations personnelles
(cb-init/setup)

;; Gestion des paquets via pkg/use-package
(require 'packages)
(pkg/use-package company)
(pkg/use-package magit)

;;; init.el ends here
