;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNU Emacs configuration
;; (c) Roman Kalinichenko 2010     romankrv AT gmail.com
;; https://github.com/romankrv/conf
;;
;; Org-Mode: Your Life in Plain Text 
;; http://orgmode.org/
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'org-install)
;; Activation & keybinding
     (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
     (add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
     (global-set-key "\C-cl" 'org-store-link)
     (global-set-key "\C-ca" 'org-agenda)
     (global-set-key "\C-cb" 'org-iswitchb)

(setq org-todo-keywords
       '((sequence "TODO" "PROC" "|" "DONE" "DELEGATED")))

(setq org-todo-keyword-faces
     '(("TODO" . (:foreground "red" :weight bold))
       ("PROC" . (:foreground "yellow" :weight bold))
       ("DONE" . (:foreground "green" :weight bold))
       ("DELEGATED" . (:foreground "white" :weight bold))))

;; Checkout that folder for org-mode is exist otherwise create it
(if (not (file-exists-p "~/org/" ))
    (make-directory "~/org/"))

;; 
(setq org-agenda-files (list 
			    "~/org/work.org"
                            "~/org/private.org" 
                            "~/org/home.org"))

(setq org-agenda-custom-commands
           '(("p" todo "PROC")
	     ("c" todo "DONE|DELEGATED")
             ("u" tags "+boss-urgent")
             ("v" tags-todo "+boss-urgent")))
