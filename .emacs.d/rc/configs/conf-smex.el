;; Initialize Smex
(load-file "~/.emacs.d/rc/vendors/smex.el")
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "\C-x\C-m") 'smex)


