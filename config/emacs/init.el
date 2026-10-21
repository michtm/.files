;;; init.el --- Configuration principale -*- lexical-binding: t; -*-

(setq inhibit-startup-screen t
      initial-scratch-message nil)

;; Modules personnels.
(add-to-list 'load-path
             (expand-file-name "lisp" user-emacs-directory))

(require 'init-state)
(require 'init-editing)
(require 'init-completion)
(require 'init-navigation)

;; Personnalisations locales, hors du dépôt.
(when (file-readable-p custom-file)
  (load custom-file nil 'nomessage))

;;; init.el ends here
