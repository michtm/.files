;;; common-base.el --- Socle commun de ma configuration Emacs

;;; Code:

;; Définition de variables
(defvar cb--gc-cons-threshold-inf 800000)
(defvar cb--gc-cons-threshold-sup most-positive-fixnum)
(defvar cb--file-name-handler-alist file-name-handler-alist)
(defvar cb--vc-handled-backends vc-handled-backends)

;; Définition de fonctions
(defun cb-early-init/setup ()
  (setq package-enable-at-startup t))

(defun cb-init/setup ()
  (setq make-backup-files nil
        package-install-upgrade-built-in t))

;; Définition de crochets personnalisés
;; - Init hook
(defun cb/after-init-hook ()
  (setq gc-cons-threshold cb--gc-cons-threshold-inf
        file-name-handler-alist cb--file-name-handler-alist
        vc-handled-backends cb--vc-handled-backends
        inhibit-startup-screen t
        initial-scratch-message nil))

(defun cb/before-init-hook ()
  (setq gc-cons-threshold cb--gc-cons-threshold-sup
        file-name-handler-alist nil
        vc-handled-backends nil)
  (dolist (func '(menu-bar-mode
                  scroll-bar-mode
                  tool-bar-mode))
    (if (fboundp func) (funcall func -1))))

;; - Save hook
(defun cb/before-save-hook ()
  (whitespace-cleanup))

;; - Startup hook
(defun cb/emacs-startup-hook ()
  (message "Emacs init loaded in %s seconds with %d garbage collections."
           (format "%.9f"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

;; - Mode hook
(defun cb/makefile-mode-hook ()
  (setq indent-tabs-mode t))

(defun cb/prog-mode-hook ()
  (setq fill-column 80
        indent-tabs-mode nil)
  (column-number-mode 1)
  (display-line-numbers-mode 1)
  (display-fill-column-indicator-mode 1)
  (whitespace-mode 1))

(provide 'common-base)
;;; common-base.el ends here
