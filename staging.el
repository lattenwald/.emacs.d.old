(use-package inf-ruby
  :ensure t
  :pin melpa-stable)

(use-package web-beautify
  :ensure t
  :config
  (eval-after-load 'js2-mode
    '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
  ;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
  (eval-after-load 'js
    '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))

  (eval-after-load 'json-mode
    '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

  (eval-after-load 'sgml-mode
    '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))

  (eval-after-load 'css-mode
    '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css)))

(use-package gist
  :ensure t
  :pin melpa-stable)

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
  :ensure t)

(use-package flycheck-elixir
  :ensure t
  :config
  (add-hook 'elixir-mode-hook 'flycheck-mode)
  )

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

(use-package org-jira
  :ensure t
  :config
  (setq jiralib-url "https://jira.mail.ru"))

(message "loaded some stuff from staging.el")
