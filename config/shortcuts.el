(defun backward-kill-line (arg)
  "Kill ARG lines backward"
  (interactive "p")
  (kill-line (- 1 arg)))
(defun vi-open-line-above ()
  "Insert a newline above the current line and put point at beginning."
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1)
  (indent-according-to-mode))
(defun vi-open-line-below ()
  "Insert a newline below the current line and put point at beginning."
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))


;; Mac OSX keybindings
(put 'dired-find-alternate-file 'disabled nil)
(setq mac-right-command-modifier 'ctrl)
(setq mac-control-modifier 'super)
(setq mac-command-modifier 'ctrl)
;;Command + Shift + Return => Create line before
(define-key global-map (kbd "<C-S-return>") 'vi-open-line-above)
;; Command + Return => Create line after
(define-key global-map (kbd "<C-return>") 'vi-open-line-below)
;; Command + Left => Go to beginning of line
(global-set-key (kbd "<C-left>") 'move-beginning-of-line)
;; Command + Right => Go to the end of line
(global-set-key (kbd "<C-right>") 'move-end-of-line)
;; Command + Backspace => Delete to beginning of line
(global-set-key (kbd "<C-backspace>") 'backward-kill-line)
;; Command + Delete => Delete to end of line (i.e Ctrl+K)
(global-set-key (kbd "<C-kp-delete>") 'kill-line)
;; Meta + Delete => Delete next word
(global-set-key (kbd "<M-delete>") 'kill-word)
;; Command + Up => Go to top
(global-set-key (kbd "<C-up>") 'beginning-of-buffer)
;; Command + Down => Go to bottom
(global-set-key (kbd "<C-down>") 'end-of-buffer)

(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z") 'undo)

(provide 'shortcuts)
