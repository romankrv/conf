;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                 ;;
;;                      GNU Emacs configuration                    ;;
;;                                                                 ;;
;;             (c) R o m a n  K a l i n i c h e n k o              ;;
;;                                                                 ;;
;;                          (c)2010-2013                           ;;
;;                                                                 ;;
;;                 https://github.com/romankrv/conf                ;;
;;                                                                 ;;
;;            r o m a n k r v  A T  g m a i l  D O T  c o m        ;;
;;                                                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; U I / U X
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (blink-cursor-mode -1))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)
(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (mouse-wheel-mode t))

;; Platform-specific stuff
(when (eq system-type 'darwin)
    ;; Work around a bug on OS X where system-name is FQDN
    (setq system-name (car (split-string system-name "\\."))))

;; E L P A
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; E L - G E T
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(setq el-get-sources 
   '((:name color-theme-railscasts :post-init (progn (color-theme-railscasts)))
     (:name smex
      :post-init
          (progn
            (global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))
            (global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))
            (defadvice smex (around space-inserts-hyphen activate compile)
              (let ((ido-cannot-complete-command
               `(lambda ()
                  (interactive)
                  (if (string= " " (this-command-keys))
                      (insert ?-)
                    (funcall ,ido-cannot-complete-command)))))
                ad-do-it))
            (setq smex-save-file "~/.emacs.d/temp/smex-items")
            (smex-initialize)))

     (:name fill-column-indicator
      :post-init
          (progn
            (setq-default fci-rule-column 80)
            (setq fci-rule-color "#200200200")
            (define-globalized-minor-mode global-fci-mode fci-mode (lambda()(fci-mode 1)))
            (global-fci-mode 1)))

     (:name magit
      :post-init
          (progn
            (global-set-key (kbd "C-x m") 'magit-status)
            (autoload 'magit-status "magit")))
))

(setq my-packages ;; el-get extra modules
      (append
       '(ack
         el-get
         idomenu
         js2-mode
         sr-speedbar
         django-mode
         python-mode
         auto-complete
         smooth-scroll
         ace-jump-mode
         browse-kill-ring
         multiple-cursors) (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync my-packages)

;; see matching pairs of parentheses and other characters
(show-paren-mode t)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face (face-background 'default))
    (set-face-foreground 'show-paren-match-face "#def")
    (set-face-attribute 'show-paren-match-face nil :weight 'extra-bold)

;; make electric-pair-mode work on more brackets
(electric-pair-mode 1)
(setq electric-pair-pairs '((?\" . ?\")(?\{ . ?\})))

;; Tramp mode
(require 'tramp)
(setq tramp-default-method "ssh")

;; IDO plugin
(custom-set-variables
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido)))
(custom-set-faces)

;; Loading extra configuration
(load-file "~/.emacs.d/rc//keybinding.el")
(load-file "~/.emacs.d/rc/custom-defuns.el")
(load-file "~/.emacs.d/rc/ibuffer.el")

;; conf for M-x customize-group
(setq custom-file "~/.emacs.d/rc/customs.el")
(load custom-file)

;; Push mark when using ido-imenu
(defvar push-mark-before-goto-char nil)
(defadvice goto-char (before push-mark-first activate)
  (when push-mark-before-goto-char
    (push-mark)))
(defun ido-imenu-push-mark ()
  (interactive)
  (let ((push-mark-before-goto-char t))
    (ido-imenu)))

;; Transparently open compressed files
(auto-compression-mode t)

;; scroll string by string (keyboard)
(setq
  scroll-margin 0
  scroll-conservatively 100000
  scroll-preserve-screen-position 1)

(set-face-attribute 'default nil :height 130)

;; store recent files list
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "C-c C-r") 'recentf-open-files)

;; postion of the point
(column-number-mode ())
(line-number-mode ())

;; Not allow type "yes" if file or buffer exist
(setq default-indicate-empty-lines t)
(fset 'yes-or-no-p 'y-or-n-p)

(setq confirm-nonexistent-file-or-buffer nil)

;; Start from empty page (scratch-buffer)
(setq inhibit-splash-screen nil)

;; Sets null message for scratch-buffer
(setq initial-scratch-message nil)

;; set indent-tabs-mode
(setq-default indent-tabs-mode nil)
;(setq tab-width 4)

;; To turn on syntax highlighting, parentheses matching
(global-font-lock-mode 1)
(show-paren-mode 1)
(transient-mark-mode 1)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/temp/saved-places")
