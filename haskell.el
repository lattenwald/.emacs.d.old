(use-package haskell-mode
  :ensure t
  :config
  (require 'haskell-indentation)
  (setq haskell-ask-also-kill-buffers nil
        haskell-process-type 'stack-ghci)
  (add-hook 'interactive-haskell-mode
            (lambda nil
              (define-key interactive-haskell-mode-map (kbd "C-c C-t") nil)
              (diminish 'interactive-haskell-mode)))
  (add-hook 'align-load-hook (lambda ()
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
                                              (modes quote (haskell-mode literate-haskell-mode)))))))

;; (use-package ghc
;;   :ensure t
;;   :config
;;   (autoload 'ghc-init "ghc" nil t)
;;   (autoload 'ghc-debug "ghc" nil t)
;;   (add-hook 'haskell-mode-hook 'ghc-init)
;;   )

(message "loaded haskell.el")
