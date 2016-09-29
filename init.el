;;; package --- Summary
;;; Commentary:

;; require packages
(require 'package)

;;; Code:
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)
(setq-default cursor-type 'bar)
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Load our packages with use-package
;; Let's start with evil mode

(defun open-config-file ()
  (interactive)
  (find-file user-init-file))

;;; Code:
(use-package evil
	     :ensure t
	     :init
	     :config
	     (evil-mode 1)
	     (use-package evil-leader
			  :ensure t
			  :config
			  (evil-leader/set-leader "SPC")
			  (evil-leader/set-key
			    "bb" 'ivy-switch-buffer
			    "bd" 'kill-buffer
			    "fs" 'save-buffer
			    "ff" 'find-file
			    "fed" 'open-config-file
			    "wc" 'evil-window-delete
			    "wo" 'delete-other-windows
			    "wj" 'evil-window-down
			    "wk" 'evil-window-up
			    "wh" 'evil-window-left
			    "wl" 'evil-window-right
			    "wv" 'evil-window-vsplit
			    "ws" 'evil-window-split
			    )
			  (global-evil-leader-mode))
	     (use-package evil-surround
			  :ensure t
			  :config
			  (global-evil-surround-mode))
	     )

(use-package powerline
	     :ensure t
	     :config
	     (powerline-default-theme))

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

;; OSX fix for eslint lookup
(use-package exec-path-from-shell
	     :ensure t
	     :config
	     (when (memq window-system '(mac ns))
	       (exec-path-from-shell-initialize)))

(use-package markdown-mode
	     :ensure t
	     :commands (markdown-mode gfm-mode)
	     :mode (("README\\.md\\'" . gfm-mode)
		    ("\\.md\\'" . markdown-mode)
		    ("\\.markdown\\'" . markdown-mode))
	     :init (setq markdown-command "multimarkdown"))

(use-package json-mode
	     :ensure t)

(use-package js2-mode
	     :ensure t
	     :config
	     ;; Enable JS2 mode as primary javascript editing mode
	     (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(use-package web-mode
	     :ensure t
	     :config
	     (defun my-web-mode-hook ()
	       "Hooks for Web mode. Adjust indents"
	       (setq web-mode-markup-indent-offset 2)
	       (setq web-mode-css-indent-offset 2)
	       (setq web-mode-code-indent-offset 2))
	     (add-hook 'web-mode-hook  'my-web-mode-hook)
	     (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode)))

(use-package flycheck
	     :ensure t
	     :config
	     (require 'flycheck)
	     (global-flycheck-mode)
	     (setq-default flycheck-disabled-checker 'javascript-jshint)
	     (setq-default flycheck-disabled-checker 'json-jsonlist)
	     ;; This requires an npm i -g eslint-project-relative
	     (setq-default flycheck-javascript-eslint-executable "eslint-project-relative")
	     (flycheck-add-mode 'javascript-eslint 'web-mode)
	     (setq-default flycheck-temp-prefix ".flycheck"))

(use-package swiper
	     :ensure t
	     :config
	     (ivy-mode 1))

(use-package projectile
	     :ensure t
	     :bind ("s-p" . projectile-find-file)
	     :config
	     (setq projectile-completion-system 'ivy)
	     (projectile-global-mode))

(use-package tern
	     :ensure t
	     :config
	     (setq js2-basic-offset 2)
	     (add-hook 'js-mode-hook (lambda () (tern-mode t))))

(use-package tern-auto-complete
	     :ensure t
	     :config
	     (tern-ac-setup))

;; Turn off the default intro screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
;; Remove unwanted GUI
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; UX options
(setq mouse-wheel-progressive-speed nil)
(show-paren-mode 1)
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  (custom-set-faces)
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  )
