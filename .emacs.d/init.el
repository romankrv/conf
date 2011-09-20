;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNU Emacs configuration
;; (c) Roman Kalinichenko 2010-2011
;; https://github.com/romankrv/conf       romankrv AT gmail.com

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-file "~/.emacs.d/rc/preload.el")
(add-to-list 'load-path "~/.emacs.d/packages/")

(require 'el-get)
(setq my_packages
       '( python-mode ;; install-->  bzr hg cvs svn git
          smex 
	  ack 
	  js2-mode 
	  yasnippet 
	  color-theme 
	  highlight-parentheses 
	  browse-kill-ring 
;;	  ipython
	  auto-complete 
	  moz-repl
	  ;; '(:name project-root
	  ;;    :type hg
	  ;;    :url "http://hg.piranha.org.ua/project-root"
	  ;;    :features project-root
          ;;    :after (lambda () 
	  ;;         (load-file "~/.emacs.d/rc/conf-project-root.el")))
        )
)
(el-get 'sync my_packages)

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
(load-file "~/.emacs.d/rc/yasnipet-conf.el")
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


                           ;; Test section

;; It is refresh firefox from emacs when pressed "C-x p"
;; Checkout that you have mozrepl plugin in Firefox and start it.
(global-set-key (kbd "C-x p")
                  (lambda ()
                    (interactive)
                    (comint-send-string (inferior-moz-process)
                                        "BrowserReload();")))


(defun auto-reload-firefox-on-after-save-hook ()         
          (add-hook 'after-save-hook
                       '(lambda ()
                          (interactive)
                          (comint-send-string (inferior-moz-process)
                                              "setTimeout(BrowserReload(), \"1000\");"))
                       'append 'local)) ; buffer-local

;; Example - you may want to add hooks for your own modes.
;; I also add this to python-mode when doing django development.
(add-hook 'html-mode-hook 'auto-reload-firefox-on-after-save-hook)
(add-hook 'css-mode-hook 'auto-reload-firefox-on-after-save-hook)



(require 'moz)

;; Usage
;; Run M-x moz-reload-mode to switch moz-reload on/off in the
;; current buffer.
;; When active, every change in the buffer triggers Firefox
;; to reload its current page.

(define-minor-mode moz-reload-mode
  "Moz Reload Minor Mode"
  nil " Reload" nil
  (if moz-reload-mode
      ;; Edit hook buffer-locally.
      (add-hook 'post-command-hook 'moz-reload nil t)
    (remove-hook 'post-command-hook 'moz-reload t)))

(defun moz-reload ()
  (when (buffer-modified-p)
    (save-buffer)
    (moz-firefox-reload)))

(defun moz-firefox-reload ()
  (comint-send-string (inferior-moz-process) "BrowserReload();"))