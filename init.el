(require 'rx)

;; custom file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror)

(defalias 'yes-or-no-p 'y-or-n-p)

;;; Look and feel
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
(global-set-key (kbd "C-<prior>") nil)
(global-set-key (kbd "C-<next>") nil)
(server-start)

;;; Moving between windows
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)

;; protect my keybindings
(defun protect-my-bindings (bad-map)
  (progn
    (define-key bad-map (kbd "M-<left>") nil)
    (define-key bad-map (kbd "M-<right>") nil)
    (define-key bad-map (kbd "M-<up>") nil)
    (define-key bad-map (kbd "M-<down>") nil)))

;; what face at point
(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

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

(add-to-list 'load-path "~/.emacs.d/git/diminish.el")
(require 'diminish)

(add-to-list 'load-path "~/.emacs.d/git/use-package")
;; (eval-when-compile
;;   (require 'use-package))
(require 'use-package)

;;; look and feel take 2, theme
(use-package color-theme-modern
  :ensure color-theme-modern
  :config)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'material t t)
(enable-theme 'material)
;; (load-theme 'wombat)
;; (load-theme 'cobalt t t)
;; (enable-theme 'cobalt)
;; (load-theme 'atom-one-dark-theme t t)
;; (enable-theme 'atom-one-dark-theme)

(use-package ag
  :ensure t)

(use-package ripgrep
  :ensure t)

(use-package projectile
  :ensure t
  :pin melpa-stable
  :config
  (add-hook 'after-init-hook 'projectile-global-mode))

(use-package projectile-ripgrep
  :ensure t
  :bind (("C-c p s r" . projectile-ripgrep)))

(use-package cmake-mode
  :ensure t)

(use-package macro-math
  :ensure t
  :config
  (global-set-key "\C-x=" 'macro-math-eval-region))

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
  :init
  (defalias 'perl-mode 'cperl-mode)
  :config
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
              (electric-pair-mode t)
              (fixmee-mode t))))

(use-package perlbrew
  :ensure t
  :config
  (perlbrew-use "perl-5.10.1"))

(use-package dockerfile-mode
  :ensure t
  :pin melpa-stable)

(use-package apache-mode
  :ensure t)

(use-package markdown-mode
  :ensure t
  :pin melpa-stable
  :config
  (eval-after-load "markdown-mode"
    (protect-my-bindings markdown-mode-map)))

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

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme))

(use-package whitespace
  :diminish global-whitespace-mode
  :config
  (add-hook 'before-save-hook 'whitespace-cleanup)
  )

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

(use-package magit
  :ensure t)

(use-package ledger-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))
  (add-to-list 'auto-mode-alist '("ledger.journal$" . ledger-mode))
  (add-hook 'ledger-mode-hook (lambda nil
                                (setq-local comment-start "; ")
                                (setq-local comment-end ""))))

(use-package flycheck-ledger
  :ensure t
  :config
  (add-hook 'ledger-mode-hook 'flycheck-mode))

(use-package org
  :ensure t
  :config
  (eval-after-load "org"
    (progn
      (protect-my-bindings org-mode-map)
      (define-key org-mode-map (kbd "<C-M-left>") 'org-metaleft)
      (define-key org-mode-map (kbd "<C-M-right>") 'org-metaright)
      (define-key org-mode-map (kbd "<C-M-up>") 'org-metaup)
      (define-key org-mode-map (kbd "<C-M-down>") 'org-metadown)
      (define-key org-mode-map (kbd "<C-M-return>") 'org-insert-heading)))
  (add-hook 'org-mode-hook (lambda ()
                             (make-local-variable 'system-time-locale)
                             (setq system-time-locale "ru_RU"))))

(use-package linum
  :ensure t)

(use-package flycheck
  :ensure t
  :pin melpa-stable
  :config
  (add-hook 'cperl-mode-hook 'flycheck-mode t)
  (add-hook 'purescript-mode-hook 'flycheck-mode t))

(use-package go-mode
  :ensure t)

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

(use-package nginx-mode
  :ensure t
  :pin melpa-stable
  :config
  (defvaralias 'font-lock-operator-face 'font-lock-keyword-face))

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
  :bind (:map elm-mode-map
              ("C-c C-c" . elm-compile-buffer-debug))
  :config
  (add-hook 'elm-mode-hook 'haskell-decl-scan-mode)
  (add-hook 'align-load-hook 'elm-align-rules)
  (defun elm-compile-buffer-debug (&optional arg)
    "Compile current elm buffer with --debug if optional argument is present"
    (interactive)
    (if current-prefix-arg
        (let
            ((elm-compile-arguments (cons "--debug" elm-compile-arguments)))
          (elm-compile-buffer))
      (elm-compile-buffer))))

(use-package flycheck-elm
  :ensure t
  :config
  (eval-after-load 'flycheck
    '(flycheck-elm-setup))
  (add-hook 'elm-mode-hook 'flycheck-mode))

(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'interpreter-mode-alist '("node" . js2-mode))
  (add-hook 'js2-mode (lambda ()
                        (setq tab-width 2)
                        (setq indent-tabs-mode t))))

(use-package yasnippet
  :ensure t
  :pin melpa-stable
  :config
  (yas-global-mode 1)
  (add-hook 'elm-mode-hook
            '(lambda () (set (make-local-variable 'yas-indent-line) 'fixed)))
  )

(use-package emojify
  :ensure t)


(add-hook 'after-init-hook 'electric-pair-mode)

;; setting up fira-code and other fonts
;; https://github.com/tonsky/FiraCode/wiki/Setting-up-Emacs
;; http://endlessparentheses.com/manually-choose-a-fallback-font-for-unicode.html
(when (window-system)
  ;; (set-default-font "Fira Code")
  (set-default-font "Hack")
  (set-face-attribute 'default nil :height 100))

(set-fontset-font "fontset-default" nil
                  (font-spec :name "Symbola"))

;; (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
;;                (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
;;                (36 . ".\\(?:>\\)")
;;                (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
;;                (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
;;                (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
;;                (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
;;                (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
;;                (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
;;                (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
;;                (48 . ".\\(?:x[a-zA-Z]\\)")
;;                (58 . ".\\(?:::\\|[:=]\\)")
;;                (59 . ".\\(?:;;\\|;\\)")
;;                (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
;;                (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
;;                (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
;;                (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
;;                (91 . ".\\(?:]\\)")
;;                (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
;;                (94 . ".\\(?:=\\)")
;;                (119 . ".\\(?:ww\\)")
;;                (123 . ".\\(?:-\\)")
;;                (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
;;                (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
;;                )
;;              ))
;;   (dolist (char-regexp alist)
;;     (set-char-table-range composition-function-table (car char-regexp)
;;                           `([,(cdr char-regexp) 0 font-shape-gstring]))))


(load "~/.emacs.d/haskell.el")

;; (load "~/.emacs.d/purescript.el")

(load "~/.emacs.d/erlang.el")

(load "~/.emacs.d/staging.el")

;;; other
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
