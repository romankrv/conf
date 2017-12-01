;; This's the file of the manage of emacs.org file.
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))


(package-initialize)

;;Bootstrap `use-package'
(unless (package-installed-p 'use-package)
        (package-refresh-contents)
        (package-install 'use-package))


(defconst RK/emacs-directory (concat (getenv "HOME") "/.emacs.d/"))
(defun RK/emacs-subdirectory (d) (expand-file-name d RK/emacs-directory))


(let* ((subdirs '("elisp" "backups"))
       (fulldirs (mapcar (lambda (d) (RK/emacs-subdirectory d)) subdirs)))
  (dolist (dir fulldirs)
    (when (not (file-exists-p dir))
      (message "Make directory: %s" dir)
      (make-directory dir))))


(defconst MAIN-LOAD-FILE (concat RK/emacs-directory "elisp/init-main.el"))
(defconst MAIN-BABEL-FILE (concat RK/emacs-directory "emacs.org"))


(if (file-exists-p MAIN-LOAD-FILE)
    (progn
    (load-file MAIN-LOAD-FILE)
    (message "You are running from MAIN-LOAD-FILE"))
  (progn
    (org-babel-load-file MAIN-BABEL-FILE)
    (message "You are running from MAIN-BABEL-FILE")))
