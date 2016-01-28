(use-package stack-mode
  :ensure t
  :config
  (eval-after-load "stack-mode"
  '(progn
     (define-key stack-mode-map (kbd "C-c C-l") nil)
     (define-key stack-mode-map (kbd "C-c C-t") nil)
     (define-key stack-mode-map (kbd "C-c C-r") 'stack-mode-load-module)
     (define-key stack-mode-map (kbd "C-f") 'stack-mode-type))))


(use-package haskell-mode
  :ensure t
  :config
  (require 'haskell-indentation)
  (setq haskell-ask-also-kill-buffers nil
        haskell-process-type 'stack-ghci)
  (add-hook 'haskell-mode-hook
            (lambda nil
              (turn-on-haskell-indentation)
              (haskell-decl-scan-mode)
              (stack-mode)
              (interactive-haskell-mode)
              (structured-haskell-mode)
              ))
  (add-hook 'interactive-haskell-mode (diminish 'interactive-haskell-mode))
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

(message "loaded haskell.el")
