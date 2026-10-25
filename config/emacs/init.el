;;; init.el --- Configuration principale -*- lexical-binding: t; -*-

;; Profilage temporaire du GC pendant l'initialisation.
(let ((start-count gcs-done)
      (start-time gc-elapsed))
  (add-hook
   'after-init-hook
   (lambda ()
     (message
      "INIT %s | GC %d collectes | %.3f ms"
      (emacs-init-time)
      (- gcs-done start-count)
      (* 1000 (- gc-elapsed start-time))))))

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
