;; custom file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror)

;;; Look and feel
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'wombat)
;; (menu-bar-mode 0)
(tool-bar-mode 0)
(column-number-mode t)

;;; cmd as alt
(setq-default ns-command-modifier 'meta)

;;; misc
(global-set-key (kbd "C-'") 'comment-or-uncomment-region)
(setq x-stretch-cursor t)
(global-set-key (kbd "C-c o") 'occur)
(setq-default tab-width 4
              electric-pair-mode t
              tramp-use-ssh-controlmaster-options nil)
(server-start)

;;; Moving between windows
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)

;;; Moving in buffer
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)

;;; cua-mode
(cua-mode t)
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy nil
      cua-auto-tabify-rectangles nil
      cua-remap-control-v t
      cua-remap-control-z t)

;;; show-paren-mode
(setq show-paren-mode t
      show-paren-style 'expression)


;;; dired
(setq dired-listing-switches "-al --group-directories-first")

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("sunrise-commander" . "http://joseito.republika.pl/sunrise-commander/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/git/use-package")
;; (eval-when-compile
;;   (require 'use-package))
(require 'use-package)
(require 'diminish)                ;; if you use :diminish

(use-package pkg-info ;; dependency for flycheck, projectile
  :ensure t
  :pin melpa-stable)

(use-package f ;; dependency for psci
  :ensure t
  :pin melpa-stable)

(use-package popup ;; dependency for helm
  :ensure t
  :pin melpa-stable)

(use-package let-alist ;; dependency for flycheck-purescript
  :ensure t)

(use-package julia-mode ;; dependency for ess
  :ensure t
  :pin melpa-stable)

(use-package nav-flash ;; dependency for fixmee
  :ensure t
  :pin melpa-stable)

(use-package seq ;; dependency for flycheck
  :ensure t)

(use-package deferred ;; dependency for psci
  :ensure t
  :pin melpa-stable)

(use-package ucs-utils ;; dependency for back-button
  :ensure t
  :pin melpa-stable)

(use-package string-utils ;; dependency for fimee
  :ensure t
  :pin melpa-stable)

(use-package s ;; dependency
  :ensure t
  :pin melpa-stable)

(use-package ag
  :ensure t)

(use-package projectile
  :ensure t
  :pin melpa-stable
  :config
  (add-hook 'after-init-hook 'projectile-global-mode))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package diminish
  :ensure t)

(use-package company
  :ensure t
  :pin melpa-stable
  :diminish company-mode
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package smart-tabs-mode
  :ensure t
  :config
  (add-hook 'smart-tabs-mode
            (lambda nil
              (smart-tabs-insinuate
               'c 'javascript 'cperl 'python 'ruby))))

(use-package cperl-mode
  :ensure t
  :config
  (defalias 'perl-mode 'cperl-mode)
  (defvaralias 'cperl-indent-level 'tab-width)
  (define-key cperl-mode-map (kbd "C-h f") 'cperl-perldoc)
  (defadvice cperl-backward-to-start-of-continued-exp (after indentation-fix)
    (and (not (memq char-after '(?\) ?\})))
         (or (not is-block) (looking-back "^[ \t]+"))
         (> (current-column) cperl-continued-statement-offset)
         (backward-char cperl-continued-statement-offset)))
  (add-hook 'cperl-mode-hook
            (lambda nil
              (smart-tabs-mode-enable)
              (smart-tabs-advice cperl-indent-line cperl-indent-level)
              (electric-pair-mode t))))

(use-package button-lock
  :ensure t
  :diminish button-lock-mode)

(use-package fixmee
  :ensure t
  :diminish fixmee-mode)

;;; ido stuff
(use-package flx-ido
  :ensure t)

(use-package idomenu
  :ensure t
  :bind ("C-c i" . idomenu)
  :config)

(ido-mode t)
(ido-everywhere 1)
;;; /ido stuff

(use-package align
  :ensure t
  :config
  :bind ("M-[" . align))

(use-package helm-core
  :pin melpa-stable
  :ensure t)

(use-package helm
  :pin melpa-stable
  :ensure t)

(use-package helm-ag
  :ensure t
  :pin melpa-stable)

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme))

(use-package whitespace
  :diminish global-whitespace-mode
  :config
  (add-hook 'before-save-hook 'whitespace-cleanup))

(use-package sunrise-commander
  :ensure t)

(use-package sunrise-x-checkpoints
  :ensure t)

(use-package undo-tree
  :ensure t
  :diminish undo-treemode
  :bind
  ("C-r" . undo-tree-redo)
  ("C-z" . undo)
  :config
  (setq undo-tree-enable-undo-in-region nil)
  (global-undo-tree-mode t))

(use-package lua-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package with-editor ;; dependency
  :ensure t
  :pin melpa-stable)

(use-package git-commit ;; dependency
  :ensure t
  :pin melpa-stable)

(use-package magit-popup ;; dependency
  :ensure t
  :pin melpa-stable)

(use-package magit
  :ensure t
  :pin melpa-stable)

(use-package ledger-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))
  (add-to-list 'auto-mode-alist '("ledger.journal$" . ledger-mode)))

(use-package ess
  :ensure t
  :pin melpa-stable
  :config
  (require 'ess-site)
  (eval-after-load "ess-mode" (define-key ess-mode-map (kbd "_") nil))
  (eval-after-load "inferior-ess-mode" (define-key inferior-ess-mode-map (kbd "_") nil)))

(use-package org
  :ensure t
  :config
  (eval-after-load "org"
    '(progn
       (define-key org-mode-map (kbd "<M-left>") nil)
       (define-key org-mode-map (kbd "<M-right>") nil)
       (define-key org-mode-map (kbd "<M-up>") nil)
       (define-key org-mode-map (kbd "<M-down>") nil)
       (define-key org-mode-map (kbd "<C-M-left>") 'org-metaleft)
       (define-key org-mode-map (kbd "<C-M-right>") 'org-metaright)
       (define-key org-mode-map (kbd "<C-M-up>") 'org-metaup)
       (define-key org-mode-map (kbd "<C-M-down>") 'org-metadown)
       (define-key org-mode-map (kbd "<C-M-return>") 'org-insert-heading)
       )))

(use-package linum
  :ensure t)

(use-package flycheck
  :ensure t
  :pin melpa-stable)

(use-package go-mode
  :ensure t)

(use-package smex
  :ensure t
  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands)
  ("C-c M-x" . execute-extended-command))

(use-package react
  :load-path "elisp/")

(use-package web-mode
  :ensure t
  :pin melpa-stable
  :config
  ;;; web-mode
  (add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
  ;;; web mode for jsxh
  ;;; https://truongtx.me/2014/03/10/emacs-setup-jsx-mode-and-jsx-syntax-checking/
  (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
  (defadvice web-mode-highlight-part (around tweak-jsx activate)
    (if (equal web-mode-content-type "jsx")
        (let ((web-mode-enable-part-face nil))
          ad-do-it)
      ad-do-it))
  (flycheck-define-checker jsxhint-checker
    "A JSX syntax and style checker based on JSXHint."

    :command ("jsxhint" source)
    :error-patterns
    ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
    :modes (web-mode))
  (add-hook 'web-mode-hook
            (lambda ()
              (when (equal web-mode-content-type "jsx")
                ;; enable flycheck
                (flycheck-select-checker 'jsxhint-checker)
                (flycheck-mode)))))

(use-package gitignore-mode
  :ensure t
  :pin melpa-stable)

(use-package csharp-mode
  :ensure t
  :pin melpa-stable)

(use-package nginx-mode
  :ensure t
  :pin melpa-stable)

(use-package vimrc-mode
  :ensure t)


(defun elm-align-rules ()
  (add-to-list 'align-rules-list
               '(elm-types
                 (regexp . "\\(\\s-+\\):\\s-+")
                 (mode . (elm-mode))))
  (add-to-list 'align-rules-list
               '(elm-assignment
                 (regexp . "\\(\\s-+\\)=\\s-+")
                 (mode . (elm-mode))))
  (add-to-list 'align-rules-list
               '(elm-arrows
                 (regexp . "\\(\\s-+\\)\\(->\\|→\\)\\s-+")
                 (mode . (elm-mode))))
  (add-to-list 'align-rules-list
               '(elm-left-arrows
                 (regexp . "\\(\\s-+\\)<-\\s-+")
                 (mode . (elm-mode)))))

(use-package elm-mode
  :ensure t
  :pin melpa-stable
  :config
  (add-hook 'elm-mode-hook 'haskell-decl-scan-mode)
  (add-hook 'align-load-hook 'elm-align-rules))

(add-hook 'after-init-hook 'electric-pair-mode)

;; (load "~/.emacs.d/haskell.el")
(load "~/.emacs.d/hie.el")

(load "~/.emacs.d/purescript.el")

(load "~/.emacs.d/staging.el")

;;; other
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
