;;; package --- Summary
;;; Commentary:

;; require packages
(require 'package)

;;; Code:
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)
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
