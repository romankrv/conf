;; config yasnippet
 
(setq yas/root-directory '("~/.emacs.d/el-get/yasnippet/snippets"
                           "~/.emacs.d/packages/django-mode/snippets"))

(mapc 'yas/load-directory yas/root-directory)
(yas/initialize)



