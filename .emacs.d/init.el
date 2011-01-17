;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNU Emacs configuration
;; (c) Roman Kalinichenko 2010     romankrv AT gmail.com
;; https://github.com/romankrv/conf
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Interface
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-face-attribute 'default nil :height 100)

(add-to-list 'load-path "~/.emacs.d/packages/")

;; el-get 
;;        (aka get-apt for emacs)

;; Checkout that el-get package is install
(if (not (load "~/.emacs.d/el-get/el-get/el-get" t))
 (throw 'not-configured "Install el-get to get dependences: https://github.com/dimitri/el-get/     see also README in ~/.emacs.d for copy/paste install code"))
(require 'el-get)
(setq el-get-sources '(yasnippet smex color-theme js2-mode
                          ack highlight-parentheses 
                          ;(:name project-root
                          ; :type hg
                          ; :url "http://hg.piranha.org.ua/project-root"
                          ; :features project-root
                          ;)
                          ipython ))
(el-get 'sync)
;; end el-get


;; set indent-tabs-mode
;;(setq-default indent-tabs-mode nil)
;(setq tab-width 4)


;; Tramp modxre
(require 'tramp)
(setq tramp-default-method "ssh")

;; sr-speedbar
(require 'sr-speedbar)

;; IDO plugin
(custom-set-variables
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido)))
(custom-set-faces)

;; Initialize Yasnippet
;Don't map TAB to yasnippet
;In fact, set it to something we'll never use because
;we'll only ever trigger it indirectly.
(setq yas/trigger-key (kbd "C-c <kp-multiply>"))
(yas/initialize)
(yas/load-directory "~/.emacs.d/el-get/yasnippet/snippets")

;; Loading additional configuration modes
(load-file "~/.emacs.d/rc/configs/interfaces.el")
(load-file "~/.emacs.d/rc/configs/conf-smex.el")
(load-file "~/.emacs.d/rc/configs/keybinding.el")
(load-file "~/.emacs.d/rc/configs/org-mode.el")
(load-file "~/.emacs.d/rc/configs/django-mode.el")
(load-file "~/.emacs.d/rc/configs/python-mode.el")

;; project-root from http://hg.piranha.org.ua/project-root/
(require 'project-root)
(load-file "~/.emacs.d/rc/configs/conf-project-root.el")
;; end Loading additional configuration modes

;; conf for M-x customize-group 
(setq custom-file "~/.emacs.d/rc/configs/customs.el")
(load custom-file)

;; Checkout that TEMP FOLDER is exist otherwise create it
(if (not (file-exists-p "~/.emacs.d/temp" ))
    (make-directory "~/.emacs.d/temp"))

;; Desktop mode 
(desktop-save-mode 1)
(require 'org-install)

(defun lorem ()
  "Insert a lorem ipsum."
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim"
          "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))


