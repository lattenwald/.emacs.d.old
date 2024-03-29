(use-package psci
  :ensure t
  :pin melpa-stable
  :commands (psci-mode)
  :config
  (add-hook 'purescript-mode-hook 'inferior-psci-mode))

(add-to-list 'load-path "~/.emacs.d/git/flycheck-purescript")
(use-package flycheck-purescript
  :config
  (eval-after-load 'flycheck '(flycheck-purescript-setup)))

(use-package psc-ide
  :ensure t
  :commands (psc-ide-load-module psc-ide-load-all psc-ide-show-type psc-ide-server-start)
  :config
  (define-key psc-ide-mode-map (kbd "C-c C-m") 'psc-ide-load-module)
  (define-key purescript-mode-map (kbd "C-c C-t") 'psc-ide-show-type))

(use-package repl-toggle
  :ensure t
  :pin melpa-stable
  :config
  (add-to-list 'rtog/mode-repl-alist '(purescript-mode . psci)))

(use-package purescript-mode
  :ensure t
  :pin melpa-stable
  :mode "\\.psc\\'"
  :config
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
  (add-hook 'align-load-hook 'purescript-align-rules)
  (add-hook 'purescript-mode-hook 'purescript-indentation-mode)
  (add-hook 'purescript-mode-hook 'haskell-decl-scan-mode)
  (add-hook 'purescript-indentation-mode-hook
            (lambda nil
              (define-key purescript-indentation-mode-map (kbd "C-d") nil))))

(message "loaded purescript support from purescript.el")
