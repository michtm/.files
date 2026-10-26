;;; sombre-theme.el --- Thème Stone -*- lexical-binding: t; -*-

(deftheme sombre
  "Thème sombre minimaliste à coloration cognitive.")

(let ((background "#252420")
      (foreground "#D8D3C7")
      (faded      "#A8A196")
      (salient    "#BBA98A")
      (subtle     "#39372F")
      (highlight  "#302E29")
      (popout     "#9FB8AB")
      (critical   "#C9877D"))

  (custom-theme-set-faces
   'sombre

   ;; Fondations.
   `(default ((t (:foreground ,foreground
                  :background ,background))))
   `(cursor ((t (:background ,salient))))
   `(region ((t (:background ,subtle :extend t))))
   `(highlight ((t (:background ,highlight))))
   `(hl-line ((t (:background ,highlight :extend t))))
   `(fringe ((t (:foreground ,faded
                 :background ,background))))
   `(vertical-border ((t (:foreground ,subtle))))
   `(internal-border ((t (:background ,background))))

   ;; Interface.
   `(mode-line
     ((t (:foreground ,foreground
          :background ,subtle
          :inverse-video nil
          :box nil))))

   `(mode-line-active
     ((t (:inherit mode-line
          :foreground ,foreground
          :background ,subtle
          :inverse-video nil
          :weight bold
          :box nil))))
   `(mode-line-inactive
     ((t (:inherit mode-line
          :foreground ,faded
          :background ,background
          :inverse-video nil
          :box nil))))
   `(mode-line-buffer-id
     ((t (:foreground ,salient :weight bold))))
   `(header-line ((t (:foreground ,faded
                      :background ,background
                      :box nil))))
   `(minibuffer-prompt ((t (:foreground ,salient
                            :weight bold))))
   `(shadow ((t (:foreground ,faded))))

   ;; Numérotation.
   `(line-number ((t (:foreground ,faded
                      :background ,background))))
   `(line-number-current-line
     ((t (:foreground ,salient
          :background ,background
          :weight bold))))

   ;; Recherche et sélection.
   `(isearch ((t (:foreground ,background
                  :background ,salient
                  :weight bold))))
   `(lazy-highlight ((t (:foreground ,foreground
                         :background ,subtle))))
   `(match ((t (:foreground ,popout :weight bold))))
   `(show-paren-match
     ((t (:foreground ,background
          :background ,salient
          :weight bold))))
   `(show-paren-mismatch
     ((t (:foreground ,background
          :background ,critical
          :weight bold))))

   ;; Complétion.
   `(completions-common-part
     ((t (:foreground ,salient :weight bold))))
   `(completions-first-difference
     ((t (:foreground ,popout :weight bold))))

   ;; Signaux sémantiques.
   `(link ((t (:foreground ,salient :underline t))))
   `(success ((t (:foreground ,popout))))
   `(warning ((t (:foreground ,salient :weight bold))))
   `(error ((t (:foreground ,critical :weight bold))))

   ;; Coloration syntaxique.
   `(font-lock-comment-face ((t (:foreground ,faded))))
   `(font-lock-comment-delimiter-face
     ((t (:foreground ,faded))))
   `(font-lock-doc-face ((t (:foreground ,faded))))
   `(font-lock-keyword-face
     ((t (:foreground ,foreground :weight bold))))
   `(font-lock-builtin-face
     ((t (:foreground ,salient))))
   `(font-lock-function-name-face
     ((t (:foreground ,foreground :weight bold))))
   `(font-lock-variable-name-face
     ((t (:foreground ,foreground))))
   `(font-lock-constant-face
     ((t (:foreground ,salient))))
   `(font-lock-type-face
     ((t (:foreground ,salient))))
   `(font-lock-string-face
     ((t (:foreground ,popout))))
   `(font-lock-warning-face
     ((t (:foreground ,critical :weight bold))))))

(provide-theme 'sombre)
;;; sombre-theme.el ends here
