;;; init-completion.el --- Complétion native -*- lexical-binding: t; -*-

(setq completion-styles '(basic partial-completion substring)
      completion-category-overrides
      '((file (styles basic partial-completion))))

(icomplete-vertical-mode 1)

(provide 'init-completion)
;;; init-completion.el ends here
