  ;; ======
  ;; python
  ;; ======
(require 'python)
(setq-default py-indent-offset 4)

(eval-after-load "python"
 '(progn
 (define-key python-mode-map (kbd "RET") 'newline-and-indent)
 ))

;;(require 'auto-complete)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; Initialize Pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

;; Initialize Rope
;;(pymacs-load "ropemacs" "rope-")
;;(setq ropemacs-enable-autoimport t)

;;===== PyFlakes
;; 
;;    install Flymake:
;;
;;    * If you are using Emacs 23+, it is already included in your installation,
;;         follow to the next step.
;;    * You can download it from here, and put it to your emacs directory under 
;;          your home (usually, “~/.emacs.d” directory).
;;
;; code checking via pyflakes+flymake
(when (load "flymake" t)
 (defun flymake-pyflakes-init ()
 (let* ((temp-file (flymake-init-create-temp-buffer-copy
 'flymake-create-temp-inplace))
 (local-file (file-relative-name
 temp-file
 (file-name-directory buffer-file-name))))
 (list "pyflakes" (list local-file))))
 
 (add-to-list 'flymake-allowed-file-name-masks
 '("\\.py\\'" flymake-pyflakes-init)))
 
(add-hook 'find-file-hook 'flymake-find-file-hook)