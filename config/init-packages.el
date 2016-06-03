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

;; OSX fix for eslint lookup
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))
 
(use-package expand-region
  :ensure t
  :config
  (require 'expand-region)
  (global-set-key (kbd "s-\-") 'er/expand-region))

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
  (require 'ivy)
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 10)
  (setq ivy-count-format "(%d/%d) ")
  :bind("C-s" . swiper))
  
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

(provide 'init-packages)
;;; init-packages.el ends here
