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

(defun insert-BOM()
  "Insert the BOM at the start of a file for UTF"
  (interactive)
  (goto-char (point-min))
  (ucs-insert (string-to-number "FEFF" 16)))

(defun indent-buffer ()
  "Indent current buffer according to major mode."
  (interactive)
  (indent-region (point-min) (point-max)))

(message "loaded some stuff from staging.el")
