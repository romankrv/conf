;; This's the file of the manage of emacs.org

(require 'package)

(defconst RK/dir (concat (getenv "HOME") "/.emacs.d/"))
(defconst RK/MAIN-ORG-FILE (concat RK/dir "emacs.org"))
(defconst RK/MAIN-LOAD-FILE (concat RK/dir "elisp/init-main.el"))

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

(defun RK/tangle-file (file)
  "Given an 'org-mode' FILE, tangle the source code."
  (interactive "fOrg File: ")
  (find-file file)   ;;  (expand-file-name file \"$DIR\")
  (org-babel-tangle)
  (message "Run org-babel-tangle from --> %s" file)
  (kill-buffer))

(defun RK/subdir (d) (expand-file-name d RK/dir))
(let* ((subdirs '("elisp" "backups"))
       (fulldirs (mapcar (lambda (d) (RK/subdir d)) subdirs)))
  (dolist (dir fulldirs)
    (when (not (file-exists-p dir))
      (message "Make directory: %s" dir)
      (make-directory dir))))

(if (file-exists-p RK/MAIN-LOAD-FILE)
    (progn
      (load-file RK/MAIN-LOAD-FILE)
      (message "You are running from %s" RK/MAIN-LOAD-FILE))
  (progn
    (RK/tangle-file RK/MAIN-ORG-FILE)
    (RK/tangle-file (concat RK/dir "emacs-org.org"))
    (RK/tangle-file (concat RK/dir "emacs-python.org"))
    (RK/tangle-file (concat RK/dir "emacs-client.org"))
    (RK/tangle-file (concat RK/dir "emacs-server.org"))
    (when (eq system-type 'darwin)
      (RK/tangle-file (concat RK/dir "emacs-mac.org")))
    (if (file-exists-p RK/MAIN-LOAD-FILE)
       (progn
         (load-file RK/MAIN-LOAD-FILE)
         (message "You are running from %s after tangle process" RK/MAIN-LOAD-FILE))
      (message "Main config file %s not exist. Check out this" RK/MAIN-LOAD-FILE))))
