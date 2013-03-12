;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNU Emacs configuration
;; (c) Roman Kalinichenko 2010-2013
;; https://github.com/romankrv/conf       romankrv AT gmail.com

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-file "~/.emacs.d/rc/preload.el")
(add-to-list 'load-path "~/.emacs.d/packages/")


;; el-get Package Manager for Emacs like apt-get, macport, brew etc 
(require 'el-get)
;; local sources
(setq el-get-sources
  '(
     (:name magit
       :after (global-set-key (kbd "C-x C-z") 'magit-status))

      ;; (:name project-root
      ;;  :type hg
      ;;  :url "http://hg.piranha.org.ua/project-root"
      ;;  :features project-root
      ;;  :after (lambda ()
      ;;  (load-file "~/.emacs.d/rc/conf-project-root.el")))
))

;; standart sources from el-get repository of recipet  
(setq my-packages
      (append
       '(el-get python-mode smex ack js2-mode yasnippet color-theme 
         highlight-parentheses browse-kill-ring auto-complete moz-repl)
       (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync my-packages)


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

;; Loading additional configuration modes
(load-file "~/.emacs.d/rc/interfaces.el")
(load-file "~/.emacs.d/rc/conf-smex.el")
(load-file "~/.emacs.d/rc//keybinding.el")
(load-file "~/.emacs.d/rc/org-mode.el")
(load-file "~/.emacs.d/rc/django-mode.el")
;;(load-file "~/.emacs.d/rc/yasnipet-conf.el")
(load-file "~/.emacs.d/rc/flymake-modes-conf.el")

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
          "paratur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))


(defun my-make-three-windows () 
"
|-----------+-----------|
|           |           |
|           |           |
|-----------+           |
|           |           |
|           |           |
|-----------+-----------|
"
(interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (split-window-vertically)
  )

(defun winpdb()
    "Insert string with import for dubugging in winpdb"
    (interactive)
    (insert "import rpdb2; rpdb2.start_embedded_debugger('1')"))
