;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNU Emacs configuration
;; (c) Roman Kalinichenko 2010-2013
;; romankrv AT gmail.com
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-file "~/.emacs.d/rc/preload.el")

;; Loading additional configuration modes
(load-file "~/.emacs.d/rc/interfaces.el")
(load-file "~/.emacs.d/rc/conf-smex.el")
(load-file "~/.emacs.d/rc//keybinding.el")
(load-file "~/.emacs.d/rc/django-mode.el")
(load-file "~/.emacs.d/rc/flymake-modes-conf.el")
(load-file "~/.emacs.d/rc/custom-defun.el")

(add-to-list 'load-path "~/.emacs.d/packages/")

;; Tramp modxre
(require 'tramp)
(setq tramp-default-method "ssh")

;; sr-speedbar
(require 'sr-speedbar)

;; highlight-indentation
(require 'highlight-indentation)

;; IDO plugin
(custom-set-variables
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido)))
(custom-set-faces)

;;special custom settings
'(setq smex-save-file "~/.emacs.d/temp/smex-items")
'(recentf-save-file "~/.emacs.d/temp/.recentf")

;; conf for M-x customize-group
(setq custom-file "~/.emacs.d/rc/customs.el")
(load custom-file)

;; Checkout that TEMP FOLDER is exist otherwise create it
(if (not (file-exists-p "~/.emacs.d/temp" ))
    (make-directory "~/.emacs.d/temp"))

;; htmlize  package converts the buffer text and the associated
;; decorations to HTML. M-x htmlize- RET
(require 'htmlize)

;; Desktop mode 
(desktop-save-mode 1)

(highlight-indentation-mode '1)
