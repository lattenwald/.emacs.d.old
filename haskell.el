(add-hook 'interactive-haskell-mode
          (lambda ()
            (when (not (equal major-mode "haskell-mode"))
              (message "not haskell-mode")
              (messahe major-mode)
              (interactive-haskell-mode 0))
            (define-key interactive-haskell-mode-map (kbd "C-c C-t") nil)
            (diminish 'interactive-haskell-mode)
            ))

(use-package haskell-mode
  :ensure t
  :config
  (debug-on-entry 'interactive-haskell-mode)
  (require 'haskell-indentation)
  (setq haskell-ask-also-kill-buffers nil
        haskell-process-type 'stack-ghci)
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
