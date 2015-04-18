;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-list-file-prefix "~/.emacs.d/temp/auto-save-list/.saves-")
 '(custom-safe-themes (quote ("d26c1e1b5497c2118820d70455652681a8776df23c2bc202ab4d3c9a8171b9d4" default)))
 '(desktop-load-locked-desktop (quote ask))
 '(desktop-path (quote ("." "~/.emacs.d/" "")))
 '(desktop-save t)
 '(display-time-24hr-format t)
 '(erc-email-userid "romankrv@gmail.com")
 '(erc-log-file-coding-system (quote utf-8))
 '(erc-log-write-after-insert t)
 '(erc-modules (quote (button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring scrolltobottom services smiley sound track)))
 '(erc-nick "romankrv")
 '(erc-port 6667)
 '(erc-server "irc.freenode.net")
 '(erc-user-full-name "Roman Kalinichenko")
 '(eshell-directory-name "~/.emacs.d/temp/.eshell/")
 '(flymake-gui-warnings-enabled nil)
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(ido-save-directory-list-file "~/.emacs.d/temp/.ido.last")
 '(js2-enter-indents-newline t)
 '(js2-highlight-level 3)
 '(org-agenda-files (quote ("~/org/work.org")) t)
 '(org-mobile-directory "~/org/public")
 '(recentf-save-file "~/.emacs.d/temp/.recentf")
 '(safe-local-variable-values (quote ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook" (add-hook (quote write-contents-functions) (lambda nil (delete-trailing-whitespace) nil)) (require (quote whitespace)) "Sometimes the mode needs to be toggled off and on." (whitespace-mode 0) (whitespace-mode 1)) (whitespace-line-column . 80) (whitespace-style face trailing lines-tail) (require-final-newline . t))))
 '(setq erc-hide-timestamps)
 '(auto-save-default nil)
 '(sr-speedbar-right-side nil))

(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK" "MODE" "TOPIC" "353"))
;;(when  (file-exists-p "~/.ercpass")
;;    (load "~/.ercpass"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-only-match-face ((t nil)) t))
