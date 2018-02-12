;; This's the file of the manage of emacs.org file.

(defconst RK/emacs-directory (concat (getenv "HOME") "/.emacs.d/"))
(defconst RK/MAIN-LOAD-FILE (concat RK/emacs-directory "elisp/init-main.el"))
(defconst RK/MAIN-ORG-FILE (concat RK/emacs-directory "emacs.org"))

(require 'package)

(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-verbose t)

(defun RK/emacs-tangle-file (file)
  "Given an 'org-mode' FILE, tangle the source code."
  (interactive "fOrg File: ")
  (find-file file)   ;;  (expand-file-name file \"$DIR\")
  (org-babel-tangle)
  (message "Run org-babel-tangle from --> %s" file)
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
      (message "You are running from %s" RK/MAIN-LOAD-FILE))
  (progn
    (RK/emacs-tangle-file RK/MAIN-ORG-FILE)
    (RK/emacs-tangle-file (concat RK/emacs-directory "emacs-org.org"))
    (RK/emacs-tangle-file (concat RK/emacs-directory "emacs-python.org"))
    (RK/emacs-tangle-file (concat RK/emacs-directory "emacs-client.org"))
    (RK/emacs-tangle-file (concat RK/emacs-directory "emacs-server.org"))
    (when (eq system-type 'darwin)
      (RK/emacs-tangle-file (concat RK/emacs-directory "emacs-mac.org")))
    (load-file RK/MAIN-LOAD-FILE)))
