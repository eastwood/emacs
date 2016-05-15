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
;;Command + Shift + Return => Create line before
(define-key global-map (kbd "<s-S-return>") 'vi-open-line-above)
;; Command + Return => Create line after
(define-key global-map (kbd "<s-return>") 'vi-open-line-below)
;; Command + Left => Go to beginning of line
(global-set-key (kbd "<s-left>") 'move-beginning-of-line)
;; Command + Right => Go to the end of line
(global-set-key (kbd "<s-right>") 'move-end-of-line)
;; Command + Backspace => Delete to beginning of line
(global-set-key (kbd "<s-backspace>") 'backward-kill-line)
;; Command + Delete => Delete to end of line (i.e Ctrl+K)
(global-set-key (kbd "<s-kp-delete>") 'kill-line)
;; Meta + Delete => Delete next word
(global-set-key (kbd "<M-delete>") 'kill-word)
;; Command + Up => Go to top
(global-set-key (kbd "<s-up>") 'beginning-of-buffer)
;; Command + Down => Go to bottom
(global-set-key (kbd "<s-down>") 'end-of-buffer)


(provide 'shortcuts)
