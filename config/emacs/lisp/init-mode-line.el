;;; init-mode-line.el --- Barre de mode minimale -*- lexical-binding: t; -*-

(defun init-mode-line--spacer ()
  "Aligne la position du curseur sur le bord droit."
  (let* ((right (format-mode-line " %l:%C "))
         (width (string-pixel-width
                 (propertize right 'face 'mode-line)))
         (available
          (- (window-pixel-width)
             (window-scroll-bar-width)
             (window-right-divider-width)
             (car (window-fringes))
             width)))
    (propertize
     " " 'display
     `(space :align-to (,(max 0 available))))))

(defun init-mode-line--status ()
  "Indique l'état du buffer."
  (cond
   (buffer-read-only
    (propertize "%" 'face 'shadow))
   ((buffer-modified-p)
    (propertize "●" 'face 'error))
   (t "-")))

(defun init-mode-line--major-mode ()
  "Retourne un nom lisible pour le mode majeur."
  (if (eq major-mode 'emacs-lisp-mode)
      "Emacs Lisp"
    (format-mode-line mode-name)))

(setq-default
 mode-line-format
 '(" "
   (:propertize "%b" face mode-line-buffer-id)
   " "
   (:eval (init-mode-line--status))
   "  "
   (:eval (init-mode-line--major-mode))
   (mode-line-process (" " mode-line-process))
   (vc-mode ("  " vc-mode))
   " %n"
   (:eval (init-mode-line--spacer))
   " %l:%C "))

(provide 'init-mode-line)
;;; init-mode-line.el ends here
