;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  M y   k e y -  b i n d i n g s  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key [f2] 'menu-bar-mode)

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "\C-x k") 'kill-current-buffer)

(global-set-key (kbd "C-x C-d") 'dired-jump)
(global-set-key (kbd "M-`") 'other-frame)
(global-set-key (kbd "M-o") 'other-window)

;; override M-x as starting from C-x and C-m
(global-set-key (kbd "\C-c\C-m") 'execute-extended-command)

(global-set-key (kbd "\C-w") 'backward-kill-word)
(global-set-key (kbd "\C-x\C-k") 'kill-region)


;; Find file by wildcard
(global-set-key (kbd "C-c C-d") 'find-name-dired)

;; Edit file with sudo
(global-set-key (kbd "M-s e") 'sudo-edit)

;; Quickly jump in document with ace-jump-mode
(global-set-key [f5] 'ace-jump-mode)
(global-set-key [f6] 'ace-jump-line-mode)

;; Multiple-Cursors 
(global-set-key (kbd "C-c l") 'mc/edit-lines)
(global-set-key (kbd "C-c >") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c <") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c a") 'mc/mark-all-like-this)

;; Find files by name and display results in dired
(global-set-key (kbd "M-s f") 'find-name-dired)

;; Display and edit occurances of regexp in buffer
(global-set-key (kbd "C-c o") 'occur)

;; Browse the kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

;; Indentation help
(global-set-key (kbd "M-j") (lambda (join-line -1)))
