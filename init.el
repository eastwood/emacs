;; require packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(setq make-backup-file nil)
(package-initialize)
(setq-default cursor-type 'bar)

;; load our custom configuration
(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
(require 'init-packages)
(require 'shortcuts)

;; Turn off the default intro screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
;; Remove unwanted GUI
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; UX options
(linum-mode t)
(show-paren-mode 1)
(put 'dired-find-alternate-file 'disabled nil)
