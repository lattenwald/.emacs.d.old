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

(add-to-list 'load-path "~/.emacs.d/git/tintin-mode")
(require 'tintin-mode)

(use-package ack
  :ensure t)

(use-package gist
  :ensure t
  :pin melpa-stable)

(use-package perlbrew
  :ensure t
  :config
  (perlbrew-use "perl-5.10.1"))

(use-package nlinum
  :ensure t)

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
    (progn
      (define-key markdown-mode-map (kbd "M-<left>") nil)
      (define-key markdown-mode-map (kbd "M-<right>") nil)
      (define-key markdown-mode-map (kbd "M-<up>") nil)
      (define-key markdown-mode-map (kbd "M-<down>") nil)
      )))

(defun insert-file-name ()
  "Insert the full path file name into the current buffer."
  (interactive)
  (insert (buffer-file-name (window-buffer (minibuffer-selected-window)))))

(defun filename ()
  "Copy the full path of the current buffer."
  (interactive)
  (kill-new (buffer-file-name (window-buffer (minibuffer-selected-window)))))

(global-set-key (kbd "M-i") 'insert-file-name)
