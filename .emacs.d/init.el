;; At the beginning of the BIG BANG

;; -*- lexical-binding: t; -*-

(let ((gc-cons-threshold (* 256 1024 1024))
      (file-name-handler-alist nil))
  (defun emacs-subdir (d) (expand-file-name d (concat (getenv "HOME") "/.emacs.d/")))
  (setq main-org-file "emacs.org"
        main-el-file (emacs-subdir "elisp/init-main.el")
        org-files-d (file-name-directory (or (buffer-file-name) load-file-name)))

  (if (file-exists-p main-el-file)(load main-el-file)
    (progn (when (not (file-exists-p (emacs-subdir "elisp")))
	     (make-directory (emacs-subdir "elisp")))
      (require 'ob-tangle)
      (mapc #'org-babel-tangle-file (directory-files org-files-d t "\\.org$"))
      (message "== Applyed *org-babel-load-file* to each of the org-files ==")))
)
