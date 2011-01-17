;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNU Emacs configuration
;; (c) Roman Kalinichenko 2010     romankrv AT gmail.com
;; https://github.com/romankrv/conf
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
(add-to-list 'load-path "~/.emacs.d/packages/")

;; el-get 
;;        (aka get-apt for emacs)

;; Checkout that el-get package is install
(if (not (load "~/.emacs.d/el-get/el-get/el-get" t))
 (throw 'not-configured "Install el-get to get dependences: https://github.com/dimitri/el-get/     see also README in ~/.emacs.d for copy/paste install code"))
(require 'el-get)
(setq el-get-sources '(yasnippet smex color-theme 
                          ack 
                          ;(:name project-root
                          ; :type hg
                          ; :url "http://hg.piranha.org.ua/project-root"
                          ; :features project-root
                          ;)
                          ipython ))
(el-get 'sync)
;; end el-get

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
(require 'color-theme)
(color-theme-initialize)
(if window-system
    (color-theme-hober))
(if (not (window-system))
    (color-theme-tty-dark))

;; IDO plugin
(custom-set-variables
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido)))
(custom-set-faces
 )

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


;; Yasnippet package
;;(require 'yasnippet-bundle)


;; Initialize Yasnippet
;Don't map TAB to yasnippet
;In fact, set it to something we'll never use because
;we'll only ever trigger it indirectly.
(setq yas/trigger-key (kbd "C-c <kp-multiply>"))
(yas/initialize)
(yas/load-directory "~/.emacs.d/el-get/yasnippet/snippets")

;; Loading additional configuration modes
(load-file "~/.emacs.d/rc/configs/conf-smex.el")
(load-file "~/.emacs.d/rc/configs/keybinding.el")
(load-file "~/.emacs.d/rc/configs/org-mode.el")
(load-file "~/.emacs.d/rc/configs/django-mode.el")
;; project-root from http://hg.piranha.org.ua/project-root/
(require 'project-root)
(load-file "~/.emacs.d/rc/configs/conf-project-root.el")
;; end Loading additional configuration modes

;; conf for M-x customize-group 
(setq custom-file "~/.emacs.d/rc/configs/customs.el")
(load custom-file)

;; Session
;;(desktop-load-default)
;;(desktop-read)

;; Checkout that TEMP FOLDER is exist otherwise create it
(if (not (file-exists-p "~/.emacs.d/temp" ))
    (make-directory "~/.emacs.d/temp"))

;; Desktop mode 
(desktop-save-mode 1)
(require 'org-install)