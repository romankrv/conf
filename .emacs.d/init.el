;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNU Emacs configuration
;; (c) Roman Kalinichenko 2010-2011
;; https://github.com/romankrv/conf       romankrv AT gmail.com

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Interface

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-face-attribute 'default nil :height 100)
;

(add-to-list 'load-path "~/.emacs.d/packages/")

;; el-get (aka get-apt for emacs)

;; Checkout that el-get package is install
(if (not (load "~/.emacs.d/el-get/el-get/el-get" t))
 (throw 'not-configured "Install el-get to get dependences: https://github.com/dimitri/el-get/     see also README in ~/.emacs.d for copy/paste install code"))
(require 'el-get)
(setq el-get-sources '(yasnippet smex color-theme js2-mode ack
                          highlight-parentheses browse-kill-ring ipython
			  python-mode ; for  install: apt-get install bzr
                          
			  ;(:name project-root
                          ;:type hg
                          ; :url "http://hg.piranha.org.ua/project-root"
                          ; :features project-root
                          ;)
			  
			  (:name skype
                          :type git
			  ;:url "git://github.com/buzztaiki/emacs-skype.git" ; have proxy class
			  ;:url "git://github.com/kiwanami/emacs-skype.git" ; origin repo
			  :url "git@github.com:romankrv/emacs-skype.git"
                          :features skype
			  :after (lambda ()
				    (setq skype--my-user-handle "romanberry")))
			  
)                     )
(el-get 'sync)
;; end el-get
;;(setq skype--my-user-handle "romanberry")

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

;; Loading additional configuration modes
(load-file "~/.emacs.d/rc/interfaces.el")
(load-file "~/.emacs.d/rc/conf-smex.el")
(load-file "~/.emacs.d/rc//keybinding.el")
(load-file "~/.emacs.d/rc/org-mode.el")
(load-file "~/.emacs.d/rc/django-mode.el")
(load-file "~/.emacs.d/rc/python-mode.el")
(load-file "~/.emacs.d/rc/yasnipet-conf.el")



;; project-root from http://hg.piranha.org.ua/project-root/
(require 'project-root)
(load-file "~/.emacs.d/rc/conf-project-root.el")
;; end Loading additional configuration modes

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

