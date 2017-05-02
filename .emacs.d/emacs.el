
;; Tangle Org-s files when we'll to save them.
(defun tangle-on-save-org-mode-file()
  (when (string= (message "%s" major-mode) "org-mode")
    (org-babel-tangle)))
(add-hook 'after-save-hook 'tangle-on-save-org-mode-file)
