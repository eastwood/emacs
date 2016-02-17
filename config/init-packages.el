;; Load our packages with use-package
;; Let's start with evil mode
(use-package evil
  :ensure t
  :config
  ;; Easily swap windows
  (evil-mode 1)
  (defun my-move-key (keymap-from keymap-to key)
    "Moves key binding from one keymap to another, deleting from the old location."
    (define-key keymap-to key (lookup-key keymap-from key))
    (define-key keymap-from key nil))
  ;; unbind <CR> and <Space> in evil so other modes can use them.
  (my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
  (my-move-key evil-motion-state-map evil-normal-state-map " ")
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
      "<SPC>" 'execute-extended-command
      "e" 'find-file
      "d" 'kill-buffer
      "w" 'save-buffer
      "b" 'switch-to-buffer))
  (use-package evil-jumper
    :ensure t
    :config
    (global-evil-jumper-mode))
  (use-package evil-escape
    :ensure t
    :config
    (setq-default evil-escape-delay 0.2)
    (evil-escape-mode)
    (setq-default evil-escape-key-sequence "jk"))
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode)))

;; Powerline looks good
(use-package powerline
  :ensure t
  :config 
  (powerline-default-theme))

(use-package color-theme-sanityinc-solarized
  :ensure t
  :config
  (load-theme 'sanityinc-solarized-dark t))

;; Which-key is helpful
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Auto-complete goodness
(use-package auto-complete
  :ensure t
  :config
  (require 'auto-complete-config)
  (ac-config-default))

(provide 'init-packages)
