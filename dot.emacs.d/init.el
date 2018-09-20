;;; init.el --- Startup file for Emacs
;;; Author: Takuo Watanabe <takuo@acm.org>
;;; Time-stamp: <2018-06-16 18:19:26 takuo>

;;; Commentary:
;;; Code:

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-xh" 'help-command)
(global-set-key "\C-x\C-b" 'buffer-menu-other-window)
(add-hook 'buffer-menu-mode-hook
	  #'(lambda ()
	      (define-key Buffer-menu-mode-map "q" 'Buffer-menu-select)))

(global-set-key "\C-c\C-k" 'compile)
(global-set-key "\C-ck" 'compile)

(setq line-move-visual nil)

(setq-default tab-width 8)
(setq-default indent-tabs-mode nil)
(line-number-mode 1)
(column-number-mode 1)
(when (fboundp 'show-paren-mode)
  (show-paren-mode 1))
(unless window-system
  ;(set-face-background 'default "black")
  (menu-bar-mode -1))

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

(when window-system
  (when (fboundp 'global-font-lock-mode)
    (global-font-lock-mode t))
  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode 0))
  (add-to-list 'default-frame-alist
               '(font . "inconsolata-14"))
  (load-theme 'tango-dark t))

(setq next-line-add-newlines t)
(put 'narrow-to-region 'disabled nil)
(setq process-connection-type t)
(setq yank-excluded-properties t)

(when (require 'package)
;  (add-to-list 'package-archives
;               '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives
                 '("gnu" . "http://elpa.gnu/org/packages/")))
  (package-initialize))

(when (and window-system (locate-library "linum"))
  (autoload 'linum-on "linum")
  (add-hook 'emacs-lisp-mode-hook 'linum-on)
  (add-hook 'c-mode-common-hook 'linum-on)
  (add-hook 'python-mode-hook 'linum-on))

(when (locate-library "auto-complete")
  (add-hook 'emacs-lisp-mode-hook 'auto-complete-mode)
  (add-hook 'c-mode-common-hook 'auto-complete-mode))

(when (locate-library "flycheck")
  (add-hook 'after-init-hook #'global-flycheck-mode))

(add-hook 'c-mode-common-hook
          #'(lambda ()
              (setq indent-tabs-mode nil)
              (setq tab-width 4)
              (setq c-basic-offset 4)))

(add-hook 'before-save-hook 'time-stamp)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-process-args-cabal-new-repl
   (quote
    ("--ghc-option=-ferror-spans" "--ghc-opeion=-fshow-loaded-module")))
 '(haskell-process-args-cabal-repl
   (quote
    ("--ghc-option=-ferror-spans" "--ghc-option=-fshow-loaded-module")))
 '(haskell-process-args-ghci (quote ("-ferror-spans" "-fshow-loaded-modules")))
 '(haskell-process-args-stack-ghci
   (quote
    ("--ghci-options=-ferror-spans" "--ghci-options=-fshow-loaded-modules" "--no-build" "--no-load")))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote stack-ghci)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
