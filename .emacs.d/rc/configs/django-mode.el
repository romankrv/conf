;; django-mode
(add-to-list 'load-path "~/.emacs.d/packages/django-mode")
(require 'django-html-mode)
(require 'django-mode)
(yas/load-directory "~/.emacs.d/packages/django-mode/snippets")
(add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))