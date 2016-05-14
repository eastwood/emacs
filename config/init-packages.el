;;; package --- Summary
;;; Commentary:

;; Load our packages with use-package
;; Let's start with evil mode
;; Powerline looks good

;;; Code:
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

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))
  
(use-package neotree
  :ensure t
  :config
  (require 'neotree)
  (global-set-key [f8] 'neotree-toggle))

(use-package expand-region
  :ensure t
  :config
  (require 'expand-region)
  (global-set-key (kbd "s-\-") 'er/expand-region))

(use-package json-mode
  :ensure t)

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

(use-package js2-mode
  :ensure t
  :config
  ;; Enable JS2 mode as primary javascript editing mode
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(use-package helm
  :ensure t
  :config
  (setq-default helm-fuzzy-match t)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (require 'helm-config))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode))

(use-package helm-projectile
  :ensure t
  :config
  (require 'helm-projectile)
  (helm-projectile-on))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package tern
  :ensure t
  :config
  (tern-mode))

(provide 'init-packages)
;;; init-packages.el ends here
