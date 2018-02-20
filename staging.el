(use-package inf-ruby
  :ensure t
  :pin melpa-stable)

;; (use-package web-beautify
;;   :ensure t
;;   :config
;;   (eval-after-load 'js2-mode
;;     '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
;;   ;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
;;   (eval-after-load 'js
;;     '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))

;;   (eval-after-load 'json-mode
;;     '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

;;   (eval-after-load 'sgml-mode
;;     '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))

;;   (eval-after-load 'css-mode
;;     '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css)))

(use-package yagist
  :ensure t)

(defun insert-file-name ()
  "Insert the full path file name into the current buffer."
  (interactive)
  (insert (buffer-file-name (window-buffer (minibuffer-selected-window)))))

(defun filename ()
  "Copy the full path of the current buffer."
  (interactive)
  (kill-new (buffer-file-name (window-buffer (minibuffer-selected-window)))))

(global-set-key (kbd "M-i") 'insert-file-name)

;;; elixir
(use-package alchemist
  :ensure t
  :config
  (add-hook 'elixir-mode-hook 'fixmee-mode))

(use-package flycheck-mix
  :ensure t
  :config
  (add-hook 'elixir-mode-hook 'flycheck-mode))

(use-package flycheck-dialyxir
  :ensure t
  :config
  (flycheck-dialyxir-setup))

(use-package elm-yasnippets
  :ensure t)

(use-package racket-mode
  :ensure t)

(use-package neotree
  :bind ("C-f" . neotree-toggle)
  :ensure t)

(use-package bookmark+
  :ensure t)

(use-package pcre2el
  :ensure t)

(use-package hledger-mode
  :ensure t)

(use-package linum-off
  :ensure t)

(use-package sql-indent
  :ensure t)

;;; rust stuff taken from http://julienblanchard.com/2016/fancy-rust-development-with-emacs/
(use-package rust-mode
  :ensure t
  :config
  (add-hook 'rust-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c <tab>") 'rust-format-buffer))))

(use-package cargo
  :ensure t)

(use-package racer
  :ensure t
  :config
  (add-hook 'rust-mode-hook 'racer-mode)
  (add-hook 'racer-mode-hook 'eldoc-mode)
  (add-hook 'racer-mode-hook 'company-mode))

(use-package flycheck-rust
  :ensure t
  :config
  (add-hook 'flycheck-mode-hook 'flycheck-rust-setup)
  (add-hook 'rust-mode-hook 'flycheck-mode))

(use-package dumb-jump
  :ensure t)

(use-package dtrt-indent
  :ensure t
  :config
  (dtrt-indent-mode t))

(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

(defun insert-BOM()
  "Insert the BOM at the start of a file for UTF"
  (interactive)
  (goto-char (point-min))
  (ucs-insert (string-to-number "FEFF" 16)))

(defun indent-buffer ()
  "Indent current buffer according to major mode."
  (interactive)
  (indent-region (point-min) (point-max)))

(flycheck-def-option-var flycheck-perl-docker-include-path nil perl-docker
  "A list of include directories for Perl.

The value of this variable is a list of strings, where each
string is a directory to add to the include path of Perl.
Relative paths are relative to the file being checked."
  :type '(repeat (directory :tag "Include directory"))
  :safe #'flycheck-string-list-p
  :package-version '(flycheck . "0.24"))

(flycheck-define-checker perl-docker
  "A Perl syntax checker using the Perl interpreter in a docker.

See URL `https://www.perl.org', `https://www.docker.com/'."
  :command ("docker" "exec" "-i" "q_backend_1" "perl" "-w" "-c"
            (option-list "-I" flycheck-perl-docker-include-path))
  :standard-input t
  :error-patterns
  ((error line-start (minimal-match (message))
          " at - line " line
          (or "." (and ", " (zero-or-more not-newline))) line-end))
  :modes (perl-mode cperl-mode))

(require 'beancount)
(add-to-list 'auto-mode-alist '("\\.beancount\\'" . beancount-mode))


(message "loaded some stuff from staging.el")
