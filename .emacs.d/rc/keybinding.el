;; ===============
;;  My keybinding
;; ===============

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

(global-set-key (kbd "\C-w") 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key (kbd "\C-c\C-k") 'kill-region)

;; project-root
(global-set-key (kbd "C-c p f") 'project-root-find-file)
(global-set-key (kbd "C-c p g") 'project-root-grep)
(global-set-key (kbd "C-c p a") 'project-root-ack)
(global-set-key (kbd "C-c p d") 'project-root-goto-root)
(global-set-key (kbd "C-c p l") 'project-root-browse-seen-projects)
;;

;; Find file by wildcard
(global-set-key (kbd "\C-c\C-f") 'find-name-dired)