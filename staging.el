(use-package rainbow-delimiters
  :ensure t
  :pin melpa-stable)

(use-package inf-ruby
  :ensure t
  :pin melpa-stable)

(add-to-list 'load-path "~/.emacs.d/git/tintin-mode")
(require 'tintin-mode)
