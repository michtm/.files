;;; early-init.el --- Pré-configuration Emacs

;;; Commentary:
;; Lire https://www.gnu.org/software/emacs/manual/html_node/elisp/Startup-Summary.html

;;; Code:
;; Ajout de certains répertoires dans des listes de chemins
(add-to-list 'load-path
             (expand-file-name "lisp" user-emacs-directory) t)
(add-to-list 'custom-theme-load-path
             (expand-file-name "themes" user-emacs-directory) t)

;; Le Socle Commun est requis
(require 'common-base)

;; Quelques configurations personnelles
(cb-early-init/setup)

;; Chargement du thème
(load-theme 'monos t)

;; Ajout de fonctions dans les crochets
(add-hook 'after-init-hook #'cb/after-init-hook)
(add-hook 'before-init-hook #'cb/before-init-hook)
(add-hook 'before-save-hook #'cb/before-save-hook)
(add-hook 'emacs-startup-hook #'cb/emacs-startup-hook)
(add-hook 'makefile-mode-hook #'cb/makefile-mode-hook)
(add-hook 'prog-mode-hook #'cb/prog-mode-hook)
;;; early-init.el ends here
