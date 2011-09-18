;; Install el-get plugin
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))


;; Interface
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-face-attribute 'default nil :height 130);
(global-linum-mode 0)
(display-time)
