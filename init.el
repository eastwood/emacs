(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(setq package-enable-at-startup nil)
(package-initialize)
(load-file "~/.emacs.d/package.el")

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(global-evil-leader-mode)
(evil-mode t)
(powerline-default-theme)
(which-key-mode)
(color-theme-sanityinc-solarized-dark)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(linum-mode t)

(require 'auto-complete-config)
(ac-config-default)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
 "e" 'find-file
 "d" 'kill-buffer
 "w" 'save-buffer
 "b" 'switch-to-buffer)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
'(progn (require 'tern-auto-complete) (tern-ac-setup)))

(put 'dired-find-alternate-file 'disabled nil)
(show-paren-mode 1)
