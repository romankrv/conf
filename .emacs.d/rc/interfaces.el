;; Interface

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

;; Color theme
(if window-system
    (color-theme-hober))
(if (not (window-system))
    (color-theme-tty-dark))

;; highlight-parentheses-mode
(add-hook 'emacs-lisp-mode-hook
    '(lambda ()
         (highlight-parentheses-mode)
              (setq autopair-handle-action-fns
                   (list 'autopair-default-handle-action
                        '(lambda (action pair pos-before)
                            (hl-paren-color-update))))))
