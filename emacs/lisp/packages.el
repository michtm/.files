;;; packages.el --- Gestion des paquets
;;; Code:
(require 'package)

(defvar pkg--package-contents-refreshed nil)
(defvar pkg--use-package-required nil)

(defmacro pkg/use-package (name &rest args)
  (unless `(package-installed-p ',name)
    (unless (or pkg--package-contents-refreshed package-archive-contents)
      (setq package-archives
            '(("gnu" . "https://elpa.gnu.org/packages/")
              ("nongnu" . "https://elpa.nongnu.org/nongnu/")
              ("melpa" . "https://melpa.org/packages/"))
            package-archive-priorities
            '(("melpa" . 3)
              ("gnu" . 2)
              ("nongnu" . 1)))
      (package-refresh-contents)
      (setq pkg--package-contents-refreshed t))
    (unless (package-installed-p 'use-package)
      (package-install 'use-package))
    (unless pkg--use-package-required
      (eval-when-compile (require 'use-package))
      (setq use-package-always-ensure t
            pkg--use-package-required t))
    `(use-package ,name ,@args)))

(provide 'packages)
;;; packages.el ends here
