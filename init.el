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

(use-package s ;; dependency
  :ensure t
  :pin melpa-stable)

(use-package ag
  :ensure t)

(use-package projectile
  :ensure t
  :pin melpa-stable
  :config
  (projectile-global-mode t))

(use-package exec-path-from-shell
  :ensure t
  :config
  (setq exec-path-from-shell-arguments '("-l"))
  (exec-path-from-shell-initialize))

(use-package diminish
  :ensure t)

(use-package company
  :ensure t
  :pin melpa-stable
  :diminish company-mode
  :config
  (global-company-mode t)
  (setq company-idle-delay 0.15))

(use-package company-ghc
  :ensure t)

(use-package smart-tabs-mode
  :ensure t
  :config
  (setq-default indent-tabs-mode nil)
  (add-hook 'smart-tabs-mode (lambda nil
                               (smart-tabs-insinuate
                                'c 'javascript 'cperl 'python 'ruby))))

(use-package cperl-mode
  :ensure t
  :config
  (defalias 'perl-mode 'cperl-mode)
  (defvaralias 'cperl-indent-level 'tab-width)
  (setq cperl-auto-newline-after-colon t
        cperl-close-paren-offset 0
        cperl-continued-statement-offset 4
        cperl-electric-keywords t
        cperl-electric-parens-mark nil
        cperl-electric-parens-string "\"\""
        cperl-hairy t
        cperl-highlight-variables-indiscriminately t
        cperl-indent-parens-as-block t)
  (define-key cperl-mode-map (kbd "C-h f") 'cperl-perldoc)
  (add-hook 'cperl-mode-hook
            (lambda nil
              (smart-tabs-mode-enable)
              (smart-tabs-advice cperl-indent-line cperl-indent-level))))

(use-package button-lock
  :ensure t
  :diminish button-lock-mode)

(use-package fixmee
  :ensure t
  :diminish fixmee-mode
  :config
  (global-fixmee-mode t)
  (setq-default fixmee--listview-local-only t))

;;; ido stuff
(use-package flx-ido
  :ensure t
  :config
  (flx-ido-mode 1))
(use-package idomenu
  :ensure t
  :bind ("C-c i" . idomenu)
  :config
  (setq ido-enable-flex-matching t
        ido-use-faces nil
        ido-buffer-disable-smart-matches nil))
(ido-mode t)
(ido-everywhere 1)
;;; /ido stuff

(use-package align
  :ensure t
  :config)

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
  (setq powerline-height 20)
  (spaceline-spacemacs-theme)
  (setq ns-use-srgb-colorspace nil))

(use-package whitespace
  :diminish global-whitespace-mode
  :config
  (add-hook 'before-save-hook 'whitespace-cleanup)
  (setq whitespace-style '(face trailing space-before-tab empty))
  (global-whitespace-mode t))

(use-package sunrise-commander
  :ensure t
  :config
  (setq sr-listing-switches "--group-directories-first -alDhgG"
        sr-show-hidden-files t
        sr-speedbar-default-width 20
        sr-speedbar-right-side nil))

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
  :ensure t
  :config
  (setq lua-indent-level 4))

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
  (setq ledger-init-file-name nil
        ledger-mode-should-check-version nil
        ledger-post-use-completion-engine :ido)
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
  (setq org-support-shift-select t)
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
  :ensure t
  :config
  (global-linum-mode t))

(use-package flycheck
  :ensure t
  :pin melpa-stable
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enabled)
        flycheck-completion-system 'ido
        flycheck-ghc-args '("-fno-warn-unused-do-bind")))

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


;;; haskell stuff

(add-to-list 'load-path "~/.emacs.d/git/haskell-ide-engine/elisp")
(load-file  "~/.emacs.d/git/haskell-ide-engine/elisp/hie.el")

(use-package stack-mode
  :ensure t
  :config
  (eval-after-load "stack-mode"
    '(progn
       (defun stack-mode-set-initial-command ()
         "Set the initial command callback. The `stack ide` command will
reload targets on start-up, so that's the default command we'll
start with."
         (setq stack-mode-current-command nil)
         (setq stack-mode-queue (stack-fifo-make))
         (stack-mode-log "Set initial command."))
       (define-key stack-mode-map (kbd "C-c C-l") nil)
       (define-key stack-mode-map (kbd "C-c C-t") nil)
       (define-key stack-mode-map (kbd "C-c C-r") 'stack-mode-load-module)
       (define-key stack-mode-map (kbd "C-f") 'stack-mode-type))))


(use-package hindent
  :ensure t
  :diminish hindent-mode)

;; (use-package shm
;;   :ensure t
;;   :config
;;   (setq shm-auto-insert-bangs t
;;         shm-auto-insert-skeletons t
;;         shm-lambda-indent-style 'leftmost-parent
;;         shm-prevent-parent-deletion nil
;;         shm-use-hdevtools t
;;         shm-use-presentation-mode t)
;;   (add-hook 'structured-haskell-mode-hook
;;             (lambda nil
;;               (define-key shm-map (kbd "RET") 'shm/newline-indent-proxy)
;;               (define-key shm-map (kbd "C-j") 'shm/newline-indent)
;;               (define-key shm-map (kbd "DEL") nil)
;;               (define-key shm-map (kbd "<deletechar>") nil))))

(use-package haskell-mode
  :ensure t
  :config
  (setq haskell-ask-also-kill-buffers nil
        haskell-process-type 'stack-ghci)
  (add-to-list 'align-rules-list
               '(haskell-types
                 (regexp . "\\(\\s-+\\)\\(::\\|∷\\)\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode))))
  (add-to-list 'align-rules-list
               '(haskell-assignment
                 (regexp . "\\(\\s-+\\)=\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode))))
  (add-to-list 'align-rules-list
               '(haskell-arrows
                 (regexp . "\\(\\s-+\\)\\(->\\|→\\)\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode))))
  (add-to-list 'align-rules-list
               '(haskell-left-arrows
                 (regexp . "\\(\\s-+\\)\\(<-\\|←\\)\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode))))
  (add-hook 'haskell-mode-hook
            (lambda nil
              (turn-on-haskell-indentation)
              (hindent-mode)
              (haskell-decl-scan-mode)
              (stack-mode)
              (interactive-haskell-mode)
              ;; (structured-haskell-mode)
              ))
  (add-hook 'interactive-haskell-mode (diminish 'interactive-haskell-mode)))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
