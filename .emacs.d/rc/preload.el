;; initialize el-get plugin
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)

;; custom local sources e.g. http://www.emacswiki.org/emacs/el-get
 (setq 
   el-get-sources
   '(el-get
         python-mode
         smex
         ack
         js2-mode
         color-theme 
         highlight-parentheses
         browse-kill-ring
         auto-complete
     (:name auto-complete-css)
     (:name magit
      ;;:before (global-set-key (kbd "C-x C-z") 'magit-status)
    ))
 )
(el-get 'sync)

;; Interface
(if window-system
  (progn
    (scroll-bar-mode -1)
    (tool-bar-mode -1)
    (menu-bar-mode -1)
    ))

(set-face-attribute 'default nil :height 130);
;;(global-linum-mode 0)
;;(display-time)
