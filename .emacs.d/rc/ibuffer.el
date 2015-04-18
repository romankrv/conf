;; initialize iBuffer
(require 'ibuffer)
(setq ibuffer-saved-filter-groups
  (quote (("default"
            ("Org"
              (mode . org-mode))
            ("Mail"
              (or
               (mode . message-mode)
               (mode . mail-mode)
              ))
            ("MyProject1"
              (filename . "src/myproject1/"))
            ("MyProject2"
              (filename . "src/myproject2/"))
            ("Programming" ;; prog stuff not already in MyProjectX
              (or
                (mode . c-mode)
                (mode . perl-mode)
                (mode . python-mode)
                (mode . emacs-lisp-mode)
              ))
            ("ERC"   (mode . erc-mode))))))

(add-hook 'ibuffer-mode-hook
  (lambda ()
    (ibuffer-switch-to-saved-filter-groups "default")))

(global-set-key (kbd "C-x C-b") 'ibuffer)
    (autoload 'ibuffer "ibuffer" "List buffers." t)
;; end iBuffer
