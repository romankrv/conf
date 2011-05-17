
;; Interface
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-face-attribute 'default nil :height 100);
(global-linum-mode 0)
(display-time)

;; store recent files list
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "C-c C-r") 'recentf-open-files)
;;

(column-number-mode 1)
(line-number-mode 1)
(setq visible-bell t)
(setq default-indicate-empty-lines t)
(setq frame-title-format '(buffer-file-name "%f" ("%b")))
(when (fboundp 'blink-cursor-mode) (blink-cursor-mode -1))
(fset 'yes-or-no-p 'y-or-n-p)

;; Not allow type "yes" if file or buffer exist
(setq confirm-nonexistent-file-or-buffer nil)

;; Start from empty page (scratch-buffer);
(setq inhibit-splash-screen t)

;; Sets null message for scratch-buffer
(setq initial-scratch-message nil)

;; set indent-tabs-mode
(setq-default indent-tabs-mode nil)
;(setq tab-width 4)

;; Color theme
(if window-system
  ;;  (load-file "~/.emacs.d/el-get/color-theme-railscasts/color-theme-railscasts.el")
    (color-theme-chocolate-rain))
;;(color-theme-railscasts)
;;(color-theme-comidia)
;;(set-cursor-color "#a00000")

;; To turn on syntax highlighting, parentheses matching
(global-font-lock-mode 1)
(show-paren-mode 1)
(transient-mark-mode 1)

;; highlight-parentheses-mode
(add-hook 'emacs-lisp-mode-hook
    '(lambda ()
         (highlight-parentheses-mode)
              (setq autopair-handle-action-fns
                   (list 'autopair-default-handle-action
                        '(lambda (action pair pos-before)
                            (hl-paren-color-update))))))
