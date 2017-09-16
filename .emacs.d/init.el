;; This's the file is a handler/wraper for emacs.org file
;; which has a literate style of the configuration.

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

;;Bootstrap `use-package'
(unless (package-installed-p 'use-package)
        (package-refresh-contents)
        (package-install 'use-package))

(require 'use-package)
(use-package auto-compile
  :config (auto-compile-on-load-mode))


(if (file-exists-p "~/.emacs.d/emacs.el")
    (progn
      (load-file "~/.emacs.d/emacs.el")
      (message "You are running from the rest of emacs.el"))
  (progn
    (org-babel-load-file (expand-file-name "~/.emacs.d/emacs.org")
                         (message "You are running from the rest of emacs.org"))))
