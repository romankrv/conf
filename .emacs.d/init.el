;; This's the file of the manage of emacs.org file.

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-verbose t)


(defconst RK/emacs-directory (concat (getenv "HOME") "/.emacs.d/"))
(defconst RK/MAIN-LOAD-FILE (concat RK/emacs-directory "elisp/init-main.el"))
(defconst RK/MAIN-ORG-FILE (concat RK/emacs-directory "emacs.org"))

;;Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(defun RK/emacs-tangle-file (file)
  "Given an 'org-mode' FILE, tangle the source code."
  (interactive "fOrg File: ")
  (find-file file)   ;;  (expand-file-name file \"$DIR\")
  (org-babel-tangle)
  (kill-buffer))


(defun RK/emacs-subdirectory (d) (expand-file-name d RK/emacs-directory))
(let* ((subdirs '("elisp" "backups"))
       (fulldirs (mapcar (lambda (d) (RK/emacs-subdirectory d)) subdirs)))
  (dolist (dir fulldirs)
    (when (not (file-exists-p dir))
      (message "Make directory: %s" dir)
      (make-directory dir))))


(if (file-exists-p RK/MAIN-LOAD-FILE)
 (progn
   (load-file RK/MAIN-LOAD-FILE)
   (message "You are running from RK/MAIN-LOAD-FILE"))
 (progn
   (RK/emacs-tangle-file RK/MAIN-ORG-FILE)
   (RK/emacs-tangle-file (concat RK/emacs-directory "emacs-org.org"))
   (RK/emacs-tangle-file (concat RK/emacs-directory "emacs-python.org"))
   (load-file RK/MAIN-LOAD-FILE)
   (message "You are running from TANGLE CREATION SECTION")))
