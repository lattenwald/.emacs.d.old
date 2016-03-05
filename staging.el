(use-package rainbow-delimiters
  :ensure t
  :pin melpa-stable)

(use-package inf-ruby
  :ensure t
  :pin melpa-stable)

(use-package js2-mode
  :ensure t
  :pin melpa-stable
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'interpreter-mode-alist '("node" . js2-mode)))

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
