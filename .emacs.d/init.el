;; This's file is a handler/wraper for emacs.org file
;; which has a literate style of the configuration.

(if (file-exists-p "~/.emacs.d/emacs.el")
    (progn
      (load-file "~/.emacs.d/emacs.el")
      (message "You are running from the rest of emacs.el"))
  (progn
    ;(org-babel-tangle-file "~/.emacs.d/emacs.org")
    (org-babel-load-file (expand-file-name "~/.emacs.d/emacs.org"))))
