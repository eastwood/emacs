;; Load our packages with use-package
;; Let's start with evil mode
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

(provide 'init-packages)
