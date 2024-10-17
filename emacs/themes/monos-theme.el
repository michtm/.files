;;; monos-theme.el --- Thème personnel

;;; Commentary:

;; Lire https://github.com/rougier/nano-emacs
;; Lire https://github.com/rougier/nano-theme
;; Lire https://github.com/Lambda-Emacs/lambda-themes
;; Lire https://arxiv.org/pdf/2008.06030

;; Certaines couleurs sont données par AI

;;; Code:
(deftheme monos)

;; Groupe
(defgroup monos nil
  "Group for `monos' theme")

;; Police
(defcustom monos-font--family "IBM Plex Mono"
  "Famille de polices Monospace"
  :group 'monos
  :type 'string)

(defcustom monos-font--family-sans "IBM Plex Sans"
  "Famille de polices Sans Serif"
  :group 'monos
  :type 'string)

(defcustom monos-font--size 11
  "Taille de la police"
  :group 'monos
  :type 'integer)

;; Couleurs
(defcustom monos-color--foreground "#4e4b42"
  ""
  :group 'monos
  :type 'color)

(defcustom monos-color--background "#dad4bb"
  ""
  :group 'monos
  :type 'color)

(defcustom monos-color--critical "#cd664d"
  ""
  :group 'monos
  :type 'color)

(defcustom monos-color--popout "#cd664d"
  ""
  :group 'monos
  :type 'color)

(defcustom monos-color--strong "#4e4b42"
  ""
  :group 'monos
  :type 'color)

(defcustom monos-color--salient "#7a529b"
  ""
  :group 'monos
  :type 'color)

(defcustom monos-color--faded "7a766f"
  ""
  :group 'monos
  :type 'color)

(defcustom monos-color--subtle "#b4af9a" ;;"#e8e6dd"
  ""
  :type 'color)

;; Faces
(defface monos-face-default nil
  "The default face."
  :group 'monos)

(defface monos-face-critical nil
  "Critical face is for information that requires immediate action.
It should be of high constrast when compared to other faces. This
can be realized (for example) by setting an intense background
color, typically a shade of red. It must be used scarcely."
  :group 'monos)

(defface monos-face-popout nil
  "Popout face is used for information that needs attention.
To achieve such effect, the hue of the face has to be
sufficiently different from other faces such that it attracts
attention through the popout effect."
  :group 'monos)

(defface monos-face-strong nil
  "Strong face is used for information of a structural nature.
It has to be the same color as the default color and only the
weight differs by one level (e.g., light/regular or
regular/bold). IT is generally used for titles, keywords,
directory, etc."
  :group 'monos)

(defface monos-face-salient nil
  "Salient face is used for information that are important.
To suggest the information is of the same nature but important,
the face uses a different hue with approximately the same
intensity as the default face. This is typically used for links."
  :group 'monos)

(defface monos-face-faded nil
  "Faded face is for information that are less important.
It is made by using the same hue as the default but with a lesser
intensity than the default. It can be used for comments,
secondary information and also replace italic (which is generally
abused anyway).")

(defface monos-face-subtle nil
  "Subtle face is used to suggest a physical area on the screen.
It is important to not disturb too strongly the reading of
information and this can be made by setting a very light
background color that is barely perceptible."
  :group 'monos)

(custom-theme-set-faces
 'monos

 ;; Default Face
 `(default ((t (:family
                ,monos-font--family
                :height ,(* monos-font--size 10)
                :foreground ,monos-color--foreground
                :background ,monos-color--background))))

 ;; Monos Faces
 `(monos-face-default ((t (:inherit default))))
 `(monos-face-critical ((t (:foreground
                            ,monos-color--background
                            :background ,monos-color--critical))))
 `(monos-face-popout ((t (:foreground ,monos-color--popout))))
 `(monos-face-strong ((t (:weight
                          ,'bold
                          :foreground ,monos-color--strong))))
 `(monos-face-salient ((t (:weight
                          ,'light
                          :foreground ,monos-color--salient))))
 `(monos-face-faded ((t (:weight
                          ,'light
                          :foreground ,monos-color--faded))))
 `(monos-face-subtle ((t (:weight
                          ,'light
                          :background ,monos-color--subtle))))

 ;; M-x customize-group RET basic-faces
 `(bold ((t (:inherit monos-face-strong))))
 `(bold-italic ((t (:inherit (monos-face-strong monos-face-faded)))))
 `(error ((t (:inherit monos-face-critical))))
 `(escape-glyph ((t (:inherit (monos-face-popout monos-face-strong)))))
 `(fixed-pitch ((t (:inherit monos-face-default))))
 `(fixed-pitch-serif ((t (:inherit monos-face-default))))
 `(glyphless-char ((t :height 0.6)))
 `(header-line ((t (:weight
                    ,'light
                    :box nil
                    :inherit monos-face-default))))
 `(header-line-highlight ((t (:inherit
                              (monos-face-default monos-face-popout)))))
 `(highlight ((t (:inherit monos-face-subtle))))
 `(homoglyph ((t (:inherit (monos-face-popout monos-face-strong)))))
 `(italic ((t (:inherit monos-face-faded))))
 `(link ((t (:inherit monos-face-salient))))
 `(link-visited ((t (:inherit monos-face-salient))))
 `(minibuffer-prompt ((t (:inherit monos-face-strong))))
 `(nobreak-hyphen ((t (:inherit monos-face-popout))))
 `(nobreak-space ((t (:inherit monos-face-popout))))
 `(read-multiple-choice-face ((t (:inherit monos-face-strong))))
 `(region ((t (:distant-foreground
               unspecified
               :inherit monos-face-subtle))))
 `(secondary-selection ((t (:inherit monos-face-subtle))))
 `(shadow ((t (:inherit monos-face-faded))))
 `(success ((t (:inherit monos-face-salient))))
 `(tab-bar ((t (:inherit monos-face-default))))
 `(tab-line ((t (:inherit monos-face-default))))
 `(tool-bar ((t (:foreground
                 ,monos-color--background
                 :background ,monos-color--faded))))
 `(trailing-whitespace ((t (:inherit monos-face-subtle))))
 `(tty-menu-disabled-face ((t (:foreground
                               ,monos-color--background
                               :background ,monos-color--faded))))
 `(tty-menu-enabled-face ((t (:inverse-video t
                              :inherit monos-face-default))))
 `(tty-menu-selected-face ((t (:foreground
                               ,monos-color--background
                               :background ,monos-color--salient))))
 `(underline ((t (:underline
                 t
                 :inherit monos-face-faded))))
 `(variable-pitch ((t (:family
                       ,monos-font--family-sans
                       :inherit monos-face-default))))
 `(vertical-border ((t (:foreground ,monos-color--subtle))))
 `(warning ((t (:inherit monos-face-popout))))

 ;; M-x customize-group RET font-lock-faces
 `(elisp-shorthand-font-lock-face ((t (:inherit monos-face-salient))))
 `(font-lock-builtin-face ((t (:inherit monos-face-salient))))
 `(font-lock-comment-delimiter-face ((t (:inherit monos-face-faded))))
 `(font-lock-comment-face ((t (:inherit monos-face-faded))))
 `(font-lock-constant-face ((t (:inherit monos-face-salient))))
 `(font-lock-doc-face ((t (:inherit monos-face-faded))))
 `(font-lock-doc-markup-face ((t (:inherit monos-face-salient))))
 `(font-lock-function-name-face ((t (:inherit monos-face-strong))))
 `(font-lock-keyword-face ((t (:inherit monos-face-salient))))
 `(font-lock-negation-char-face ((t nil)))
 `(font-lock-preprocessor-face ((t (:inherit monos-face-salient))))
 `(font-lock-regexp-grouping-backslash ((t (:inherit monos-face-strong))))
 `(font-lock-regexp-grouping-construct ((t (:inherit monos-face-strong))))
 `(font-lock-string-face ((t (:inherit monos-face-popout))))
 `(font-lock-type-face ((t (:inherit monos-face-salient))))
 `(font-lock-variable-name-face ((t (:inherit monos-face-strong))))
 `(font-lock-warning-face ((t (:inherit monos-face-popout))))

 ;; M-x customize-group RET whitespace
 `(whitespace-big-indent ((t (:weight
                              ,'extra-light
                              :inherit monos-face-faded))))
 `(whitespace-empty ((t (:weight
                         ,'extra-light
                         :inherit monos-face-faded))))
 `(whitespace-hspace ((t (:weight
                          ,'extra-light
                          :inherit monos-face-faded))))
 `(whitespace-indentation ((t (:weight
                               ,'extra-light
                               :inherit monos-face-faded))))
 `(whitespace-line ((t nil)))
 `(whitespace-missing-newline-at-eof ((t (:weight
                                          ,'extra-light
                                          :inherit monos-face-faded))))
 `(whitespace-newline ((t (:weight
                           ,'extra-light
                           :inherit monos-face-faded))))
 `(whitespace-space ((t (:weight
                         ,'extra-light
                         :inherit monos-face-faded))))
 `(whitespace-space-after-tab ((t (:weight
                                   ,'extra-light
                                   :inherit monos-face-faded))))
 `(whitespace-space-before-tab ((t (:weight
                                    ,'extra-light
                                    :inherit monos-face-faded))))
 `(whitespace-tab ((t (:weight
                       ,'extra-light
                       :inherit monos-face-faded))))
 `(whitespace-trailing ((t (:weight
                            ,'extra-light
                            :inherit monos-face-faded))))

 ;; M-x customize-group RET frames
 `(border ((t nil)))
 `(child-frame-border ((t nil)))
 `(fringe ((t (:inherit monos-face-faded))))
 `(internal-border ((t nil)))
 `(scroll-bar ((t nil)))

 ;; M-x customize-group RET cursor
 `(cursor ((t (:inverse-video
               t
               :inherit monos-face-default))))

 ;; M-x customize-group RET isearch
 `(isearch ((t (:inherit monos-face-strong))))
 `(isearch-fail ((t (:inherit monos-face-faded))))
 `(isearch-group-1 ((t (:inherit monos-face-strong))))
 `(isearch-group-2 ((t (:inherit monos-face-strong))))

 ;; M-x customize-group RET lazy-highlight
 `(lazy-highlight ((t (:inherit monos-face-subtle))))

 ;; M-x customize-group RET menu
 `(menu ((t nil)))

 ;; M-x customize-group RET mouse
 `(mouse ((t nil)))
 `(mouse-drag-and-drop-region  ((t (:distant-foreground
                                    unspecified
                                    :inherit monos-face-subtle))))
 ;; M-x customize-group RET display-line-numbers
 `(line-number ((t (:inherit monos-face-faded))))
 `(line-number-current-line ((t (:inherit monos-face-strong))))
 `(line-number-major-tick ((t (:inherit monos-face-default))))
 `(line-number-minor-tick ((t (:inherit monos-face-faded))))

 ;; M-x customize-group RET display-fill-column-indicator
 `(fill-column-indicator ((t (:inherit monos-face-faded))))

 ;; M-x customize-group RET mode-line-faces
 `(display-time-mail-face ((t nil)))
 `(mode-line ((t (:box
                  (:line-width
                   3
                   :color ,monos-color--foreground
                   :style nil)
                  :inverse-video t
                  :inherit monos-face-default))))
 `(mode-line-buffer-id ((t (:weight ,'regular))))
 `(mode-line-emphasis ((t (:weight ,'regular))))
 `(mode-line-highlight ((t (:inherit monos-face-popout))))
 `(mode-line-inactive ((t (:box
                           (:line-width
                            3
                            :color ,monos-color--subtle
                            :style nil)
                           :foreground ,monos-color--foreground
                           :background ,monos-color--subtle))))

 ;; M-x customize-group RET tooltip
 `(tooltip ((t (:height
                0.85
                :inherit monos-face-subtle))))

 ;; M-x customize-group RET window-divider
 `(window-divider ((t (:foreground ,monos-color--subtle))))
 `(window-divider-first-pixel ((t (:foreground ,monos-color--subtle))))
 `(window-divider-last-pixel ((t (:foreground ,monos-color--subtle))))

 ;; M-x customize-group RET custom-faces
 `(custom-button ((t (:box
                      (:line-width
                       1
                       :color ,monos-color--faded
                       :style nil)
                      :foreground ,monos-color--faded
                      :background ,monos-color--background))))
 `(custom-button-mouse ((t (:box
                            (:line-width
                             1
                             :color ,monos-color--faded
                             :style nil)
                            :foreground ,monos-color--faded
                            :background ,monos-color--subtle))))
 `(custom-button-pressed ((t (:box
                              (:line-width
                               1
                               :color ,monos-color--salient
                               :style nil)
                              :foreground ,monos-color--background
                              :background ,monos-color--salient
                              :inherit monos-face-salient))))
 `(custom-button-pressed-unraised ((t (:underline
                                       t
                                       :inherit monos-face-faded))))
 `(custom-button-unraised ((t (:underline
                               t
                               :inherit monos-face-faded))))
 `(custom-comment ((t (:inherit monos-face-faded))))
 `(custom-comment-tag ((t (:inherit monos-face-faded))))
 `(custom-documentation ((t nil)))
 `(custom-face-tag ((t (:inherit monos-face-strong))))
 `(custom-group-subtitle ((t (:inherit monos-face-strong))))
 `(custom-group-tag ((t (:inherit monos-face-strong))))
 `(custom-group-tag-1 ((t (:inherit monos-face-strong))))
 `(custom-link ((t (:inherit monos-face-salient))))
 `(custom-state ((t (:inherit monos-face-salient))))
 `(custom-variable-button ((t (::underline
                               t
                               inherit monos-face-strong))))
 `(custom-variable-obsolete ((t (:inherit monos-face-faded))))
 `(custom-variable-tag ((t (:inherit monos-face-strong))))
 `(custom-visibility ((t (:inherit monos-face-salient))))
 `(eieio-custom-slot-tag-face ((t (:inherit monos-face-faded))))

 ;; M-x customize-group RET bookmark
 `(bookmark-face ((t (:inherit monos-face-subtle))))
 `(bookmark-menu-bookmark ((t (:inherit monos-face-salient))))
 `(bookmark-menu-heading ((t (:inherit monos-face-strong))))

 ;; M-x customize-group RET paren-showing-faces
 `(show-paren-match ((t (:inherit monos-face-popout))))
 `(show-paren-match-expression ((t (:inherit monos-face-popout))))
 `(show-paren-mismatch ((t (:inherit monos-face-critical))))
 )

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'monos)
;;; monos-theme.el ends here
