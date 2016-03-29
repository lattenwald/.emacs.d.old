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
  :ensure t)

(use-package repl-toggle
  :ensure t
  :pin melpa-stable
  :config
  (add-to-list 'rtog/mode-repl-alist '(purescript-mode . psci)))

(use-package purescript-mode
  :ensure t
  :pin melpa-stable
  :config
  (add-hook 'align-load-hook 'purescript-align-rules))

(message "loaded purescript support from purescript.el")
