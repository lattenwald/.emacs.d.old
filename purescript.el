(defun purescript-align-rules ()
  (add-to-list 'align-rules-list
               '(purescript-types
                 (regexp . "\\(\\s-+\\)\\(::\\|∷\\)\\s-+")
                 (mode . (purescript-mode))))
  (add-to-list 'align-rules-list
               '(purescript-assignment
                 (regexp . "\\(\\s-+\\)=\\s-+")
                 (mode . (purescript-mode))))
  (add-to-list 'align-rules-list
               '(purescript-arrows
                 (regexp . "\\(\\s-+\\)\\(->\\|→\\)\\s-+")
                 (mode . (purescript-mode))))
  (add-to-list 'align-rules-list
               '(purescript-left-arrows
                 (regexp . "\\(\\s-+\\)\\(<-\\|←\\)\\s-+")
                 (mode . (purescript-mode)))))

(use-package psci
  :ensure t
  :pin melpa-stable
  :config
  (add-hook 'purescript-mode-hook 'inferior-psci-mode))

(use-package flycheck-purescript
  :ensure t
  :pin melpa-stable
  :config
  (eval-after-load 'flycheck '(flycheck-purescript-setup)))

(use-package psc-ide
  :ensure t
  :config
  (define-key psc-ide-mode-map (kbd "C-c C-m") 'psc-ide-load-module))

(use-package repl-toggle
  :ensure t
  :pin melpa-stable
  :config
  (add-to-list 'rtog/mode-repl-alist '(purescript-mode . psci)))

(use-package purescript-mode
  :ensure t
  :pin melpa-stable
  :config
  (add-hook 'align-load-hook 'purescript-align-rules)
  (add-hook 'purescript-mode-hook 'haskell-decl-scan-mode)
  (add-hook 'purescript-indentation-mode-hook
            (lambda nil
              (define-key purescript-indentation-mode-map (kbd "C-d") nil))))

(message "loaded purescript support from purescript.el")
