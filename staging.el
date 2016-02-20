(use-package rainbow-delimiters
  :ensure t
  :pin melpa-stable)

(use-package evil
  :ensure t
  :pin melpa-stable)

(use-package evil-tutor
  :ensure t
  :pin melpa-stable)

(use-package god-mode
  :ensure t)

(use-package inf-ruby
  :ensure t
  :pin melpa-stable)

(use-package elm-mode
  :ensure t
  :pin melpa-stable
  :config
  (add-hook 'elm-mode-hook 'haskell-decl-scan-mode))
