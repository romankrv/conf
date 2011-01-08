;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNU Emacs configuration
;; (c) Roman Kalinichenko 2010     romankrv AT gmail.com
;; https://github.com/romankrv/conf
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
(add-to-list 'load-path "~/.emacs.d/packages/")

;; Turn off mouse interface
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; 
(set-face-attribute 'default nil :height 100)

;; no blinking cursor
(when (fboundp 'blink-cursor-mode) (blink-cursor-mode -1))

(iswitchb-mode 1)

;; I do not want to type yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; set indent-tabs-mode
;;(setq-default indent-tabs-mode nil)
;(setq tab-width 4)

;; Show column-number & line-nubber in the mode line
(column-number-mode 1)
(line-number-mode 1)

;; Tramp modxre
(require 'tramp)
(setq tramp-default-method "ssh")

;; sr-speedbar
(require 'sr-speedbar)

;; Color theme
(add-to-list 'load-path "~/.emacs.d/packages/color-theme")
(require 'color-theme)
(color-theme-initialize)
(if window-system
    (color-theme-taylor))
(if (not (window-system))
    (color-theme-tty-dark))

;; IDO plugin
(custom-set-variables
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido)))
(custom-set-faces
 )

;; Yasnippet package
(require 'yasnippet-bundle)

;;Not allow type "yes" if file or buffer exist
(setq confirm-nonexistent-file-or-buffer nil)

;; Start from empty page (scratch-buffer);
(setq inhibit-splash-screen t)

;; Sets null message for scratch-buffer 
(setq initial-scratch-message nil)

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

;; Initialize Yasnippet          
;Don't map TAB to yasnippet
;In fact, set it to something we'll never use because
;we'll only ever trigger it indirectly.
(setq yas/trigger-key (kbd "C-c <kp-multiply>"))
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

;; load concrete packages
(load-file "~/.emacs.d/rc/configs/conf-smex.el")
(load-file "~/.emacs.d/rc/configs/keybinding.el")

;; project-root from http://hg.piranha.org.ua/project-root/
(load-file "~/.emacs.d/packages/ack.el")
(require 'project-root)
(load-file "~/.emacs.d/rc/configs/conf-project-root.el")

;; Some customs from M-x customize
(setq custom-file "~/.emacs.d/rc/configs/customs.el")
(load custom-file)

;; Session
;;(desktop-load-default)
;;(desktop-read)

;; Checkout that TEMP FOLDER is exist otherwise create it
(if (not (file-exists-p "~/.emacs.d/temp" ))
    (make-directory "~/.emacs.d/temp")) 