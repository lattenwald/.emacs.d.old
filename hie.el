(defun haskell-align-rules ()
  (add-to-list 'align-rules-list
               '(haskell-types
                 (regexp . "\\(\\s-+\\)\\(::\\|∷\\)\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode))))
  (add-to-list 'align-rules-list
               '(haskell-assignment
                 (regexp . "\\(\\s-+\\)=\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode))))
  (add-to-list 'align-rules-list
               '(haskell-arrows
                 (regexp . "\\(\\s-+\\)\\(->\\|→\\)\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode))))
  (add-to-list 'align-rules-list
               '(haskell-left-arrows
                 (regexp . "\\(\\s-+\\)\\(<-\\|←\\)\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode)))))

(use-package buttercup
  :ensure t
  :pin melpa-stable)

(use-package haskell-mode
  :ensure t
  :config
  (add-hook 'interactive-haskell-mode-hook (lambda nil (define-key interactive-haskell-mode-map (kbd "C-c C-t") nil)))
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  ;; (add-hook 'haskell-mode-hook 'hie-mode)
  (add-hook 'align-load-hook 'haskell-align-rules))


;; (add-to-list 'load-path ".stack/snapshots/x86_64-osx/lts-5.2/7.10.3/share/x86_64-osx-ghc-7.10.3/ghc-mod-5.5.0.0/elisp")

(use-package ghc
  :ensure t
  :config
  (autoload 'ghc-init "ghc" nil t)
  (autoload 'ghc-debug "ghc" nil t)
  (add-hook 'haskell-mode-hook 'ghc-init))

(message "loaded haskell support from hie.el")
