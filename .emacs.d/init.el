(let ((file-name-handler-alist nil))

  ;; Increase the garbage collection threshold to 200 MB to ease startup
  (setq gc-cons-threshold (* 200 1024 1024))

  (require 'package)
  (setq package-enable-at-startup nil)
  (setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                          ("melpa" . "http://melpa.org/packages/")
                          ("gnu"   . "http://elpa.gnu.org/packages/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")))
  (package-initialize)

  ;; Bootstrap `use-package'
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

  (setq use-package-verbose nil
	use-package-always-defer nil
	use-package-compute-statistics nil
	use-package-minimum-reported-time 0)

  (defconst RK/MAIN-ORG-FILE "emacs.org")
  (defconst RK/EMACS-DIR (concat (getenv "HOME") "/.emacs.d/"))
  (defconst RK/MAIN-LOAD-FILE (concat RK/EMACS-DIR "elisp/init-main.el"))
  (defun RK/subdir (d) (expand-file-name d RK/EMACS-DIR))

  ;; One needs to make sure the following directories have been created.
  (let* ((subdirs '("elisp" "backups"))
	 (fulldirs (mapcar (lambda (d) (RK/subdir d)) subdirs)))
    (dolist (dir fulldirs)
      (when (not (file-exists-p dir))
	(make-directory dir))))

  (defun RK/tangle-file (file)
    "Given an 'org-mode' FILE, tangle the source code."
    (interactive "fOrg File: ")
    (find-file (concat RK/EMACS-DIR file))
    (org-babel-tangle)
    (kill-buffer))

  (setq custom-file (expand-file-name "backups/emacs-custom.el" RK/EMACS-DIR))
  (when (file-exists-p custom-file)(load custom-file))

  (if (file-exists-p RK/MAIN-LOAD-FILE)
      (progn
	(load-file RK/MAIN-LOAD-FILE)
	(message "==> You are running from %s <==" RK/MAIN-LOAD-FILE))
    (progn
      (RK/tangle-file RK/MAIN-ORG-FILE)
      (RK/tangle-file "emacs-org.org")
      (RK/tangle-file "emacs-python.org")
      (RK/tangle-file "emacs-client.org")
      (when (eq system-type 'darwin) (RK/tangle-file "emacs-mac.org"))

      (if (file-exists-p RK/MAIN-LOAD-FILE)
	  (progn
	    (load-file RK/MAIN-LOAD-FILE)
	    (message "\n==*> You are running from %s after tangle process <*==\n" RK/MAIN-LOAD-FILE))
	(message "\n=!= Main config file %s not exist. Check out this =!=\n" RK/MAIN-LOAD-FILE)))))
