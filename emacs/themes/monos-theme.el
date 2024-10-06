;;; monos-theme.el --- Thème personnel

;;; Commentary:

;; Lire https://github.com/rougier/nano-emacs
;; Lire https://github.com/rougier/nano-theme
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

(defcustom monos-color--faded "#b5b1a4"
  ""
  :group 'monos
  :type 'color)

(defcustom monos-color--subtle "#e8e6dd"
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
 ;; Default Face ---------------------------------------------------------------
 `(default ((t (:family
                ,monos-font--family
                :height ,(* monos-font--size 10)
                :foreground ,monos-color--foreground
                :background ,monos-color--background))))
 ;; Monos Faces ----------------------------------------------------------------
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
 `(border ((t nil)))
 `(child-frame-border ((t nil)))
 `(cursor ((t (:inverse-video
               t
               :inherit monos-face-default))))
 `(error ((t (:inherit monos-face-critical))))
 `(escape-glyph ((t (:inherit (monos-face-popout monos-face-strong)))))
 `(fill-column-indicator ((t (:inherit monos-face-faded))))
 `(fixed-pitch ((t (:inherit monos-face-default))))
 `(fixed-pitch-serif ((t (:inherit monos-face-default))))
 `(fringe ((t (:inherit monos-face-faded))))
 `(glyphless-char ((t :height 0.6)))
 `(header-line ((t (:weight
                    ,'light
                    :box nil
                    :inherit monos-face-default))))
 `(header-line-highlight ((t (:inherit
                              (monos-face-default monos-face-popout)))))
 `(highlight ((t (:inherit monos-face-subtle))))
 `(homoglyph ((t (:inherit (monos-face-popout monos-face-strong)))))
 `(internal-border ((t nil)))
 `(isearch ((t (:inherit monos-face-strong))))
 `(italic ((t (:inherit monos-face-faded))))
 `(lazy-highlight ((t (:inherit monos-face-subtle))))
 `(line-number ((t (:inherit monos-face-faded))))
 `(line-number-current-line ((t (:inherit monos-face-strong))))
 `(line-number-major-tick ((t (:inherit monos-face-default))))
 `(line-number-minor-tick ((t (:inherit monos-face-faded))))
 `(link ((t (:inherit monos-face-salient))))
 `(link-visited ((t (:inherit monos-face-salient))))
 `(match ((t (:inherit monos-face-popout))))
 `(menu ((t nil)))
 `(minibuffer-prompt ((t (:inherit monos-face-strong))))
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
                            :color ,monos-color--faded
                            :style nil)
                           :foreground ,monos-color--background
                           :background ,monos-color--faded))))
 `(mouse ((t nil)))
 `(nobreak-hyphen ((t (:inherit monos-face-popout))))
 `(nobreak-space ((t (:inherit monos-face-popout))))
 `(read-multiple-choice-face ((t (:inherit monos-face-strong))))
 `(region ((t (:distant-foreground
               unspecified
               :inherit monos-face-subtle))))
 `(scroll-bar ((t nil)))
 `(secondary-selection ((t (:inherit monos-face-subtle))))
 `(shadow ((t (:inherit monos-face-faded))))
 `(success ((t (:inherit monos-face-salient))))
 `(tab-bar ((t (:inherit monos-face-default))))
 `(tab-line ((t (:inherit monos-face-default))))
 `(tool-bar ((t (:foreground
                 ,monos-color--background
                 :background ,monos-color--faded))))
 `(tooltip ((t (:height
                0.85
                :inherit monos-face-subtle))))
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
 `(window-divider ((t (:foreground ,monos-color--subtle))))
 `(window-divider-first-pixel ((t (:foreground ,monos-color--subtle))))
 `(window-divider-last-pixel ((t (:foreground ,monos-color--subtle))))
 )

;; M-x list-faces-display
;; Info-quoted
;; bold
;; bold-italic
;; border
;; browse-url-button
;; buffer-menu-buffer
;; button
;; child-frame-border
;; completions-annotations
;; completions-common-part
;; completions-first-difference
;; completions-group-separator
;; completions-group-title
;; cursor
;; custom-button
;; custom-button-mouse
;; custom-button-pressed
;; custom-button-pressed-unraised
;; custom-button-unraised
;; custom-changed
;; custom-comment
;; custom-comment-tag
;; custom-documentation
;; custom-face-tag
;; custom-group-subtitle
;; custom-group-tag
;; custom-group-tag-1
;; custom-invalid
;; custom-link
;; custom-modified
;; custom-rogue
;; custom-saved
;; custom-set
;; custom-state
;; custom-themed
;; custom-variable-button
;; custom-variable-obsolete
;; custom-variable-tag
;; custom-visibility
;; default
;; diff-added
;; diff-changed
;; diff-changed-unspecified
;; diff-context
;; diff-error
;; diff-file-header
;; diff-function
;; diff-header
;; diff-hunk-header
;; diff-index
;; diff-indicator-added
;; diff-indicator-changed
;; diff-indicator-removed
;; diff-nonexistent
;; diff-refine-added
;; diff-refine-changed
;; diff-refine-removed
;; diff-removed
;; eldoc-highlight-function-argument
;; elisp-shorthand-font-lock-face
;; error
;; escape-glyph
;; file-name-shadow
;; fill-column-indicator
;; fixed-pitch
;; fixed-pitch-serif
;; font-lock-builtin-face
;; font-lock-comment-delimiter-face
;; font-lock-comment-face
;; font-lock-constant-face
;; font-lock-doc-face
;; font-lock-doc-markup-face
;; font-lock-function-name-face
;; font-lock-keyword-face
;; font-lock-negation-char-face
;; font-lock-preprocessor-face
;; font-lock-regexp-grouping-backslash
;; font-lock-regexp-grouping-construct
;; font-lock-string-face
;; font-lock-type-face
;; font-lock-variable-name-face
;; font-lock-warning-face
;; fringe
;; glyphless-char
;; header-line
;; header-line-highlight
;; help-argument-name
;; help-for-help-header
;; help-key-binding
;; highlight
;; homoglyph
;; info-header-node
;; info-header-xref
;; info-index-match
;; info-menu-header
;; info-menu-star
;; info-node
;; info-title-1
;; info-title-2
;; info-title-3
;; info-title-4
;; info-xref
;; info-xref-visited
;; internal-border
;; isearch
;; isearch-fail
;; isearch-group-1
;; isearch-group-2
;; italic
;; lazy-highlight
;; line-number
;; line-number-current-line
;; line-number-major-tick
;; line-number-minor-tick
;; link
;; link-visited
;; match
;; menu
;; minibuffer-prompt
;; mode-line
;; mode-line-buffer-id
;; mode-line-emphasis
;; mode-line-highlight
;; mode-line-inactive
;; mouse
;; mouse-drag-and-drop-region
;; next-error
;; next-error-message
;; nobreak-hyphen
;; nobreak-space
;; package-description
;; package-help-section-name
;; package-name
;; package-status-avail-obso
;; package-status-available
;; package-status-built-in
;; package-status-dependency
;; package-status-disabled
;; package-status-external
;; package-status-held
;; package-status-incompat
;; package-status-installed
;; package-status-new
;; package-status-unsigned
;; query-replace
;; read-multiple-choice-face
;; rectangle-preview
;; region
;; scroll-bar
;; secondary-selection
;; separator-line
;; shadow
;; shortdoc-heading
;; shortdoc-section
;; show-paren-match
;; show-paren-match-expression
;; show-paren-mismatch
;; speedbar-button-face
;; speedbar-directory-face
;; speedbar-file-face
;; speedbar-highlight-face
;; speedbar-selected-face
;; speedbar-separator-face
;; speedbar-tag-face
;; success
;; tab-bar
;; tab-bar-tab
;; tab-bar-tab-group-current
;; tab-bar-tab-group-inactive
;; tab-bar-tab-inactive
;; tab-bar-tab-ungrouped
;; tab-line
;; tabulated-list-fake-header
;; tool-bar
;; tooltip
;; trailing-whitespace
;; tty-menu-disabled-face
;; tty-menu-enabled-face
;; tty-menu-selected-face
;; underline
;; variable-pitch
;; vc-conflict-state
;; vc-edited-state
;; vc-locally-added-state
;; vc-locked-state
;; vc-missing-state
;; vc-needs-update-state
;; vc-removed-state
;; vc-state-base
;; vc-up-to-date-state
;; vertical-border
;; warning
;; whitespace-big-indent
;; whitespace-empty
;; whitespace-hspace
;; whitespace-indentation
;; whitespace-line
;; whitespace-missing-newline-at-eof
;; whitespace-newline
;; whitespace-space
;; whitespace-space-after-tab
;; whitespace-space-before-tab
;; whitespace-tab
;; whitespace-trailing
;; widget-button
;; widget-button-pressed
;; widget-documentation
;; widget-field
;; widget-inactive
;; widget-single-line-field
;; window-divider
;; window-divider-first-pixel
;; window-divider-last-pixel

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'monos)
;;; monos-theme.el ends here
