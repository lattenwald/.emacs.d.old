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

(use-package ack
  :ensure t)

(use-package gist
  :ensure t
  :pin melpa-stable)

(use-package nlinum
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
  :ensure t)

(use-package yasnippet
 :ensure t
 :pin melpa-stable
 :config
 (yas-global-mode 1)
 (add-hook 'elm-mode-hook
           '(lambda () (set (make-local-variable 'yas-indent-line) 'fixed)))
 )

(use-package elm-yasnippets
 :ensure t)

(use-package flycheck-elm
  :ensure t
  :config
  (eval-after-load 'flycheck
    '(flycheck-elm-setup))
  (add-hook 'elm-mode-hook 'flycheck-mode))

(use-package racket-mode
  :ensure t)

(use-package neotree
  :ensure t)

(message "loaded some stuff from staging.el")
