(use-package hindent
  :ensure t
  :diminish hindent-mode)

;; (use-package shm
;;   :ensure t
;;   :config
;;   (setq shm-auto-insert-bangs t
;;         shm-auto-insert-skeletons t
;;         shm-lambda-indent-style 'leftmost-parent
;;         shm-prevent-parent-deletion nil
;;         shm-use-hdevtools t
;;         shm-use-presentation-mode t)
;;   (add-hook 'structured-haskell-mode-hook
;;             (lambda nil
;;               (define-key shm-map (kbd "RET") 'shm/newline-indent-proxy)
;;               (define-key shm-map (kbd "C-j") 'shm/newline-indent)
;;               (define-key shm-map (kbd "DEL") nil)
;;               (define-key shm-map (kbd "<deletechar>") nil))))

(use-package haskell-mode
  :ensure t
  :config
  (setq haskell-ask-also-kill-buffers nil
        haskell-process-type 'stack-ghci)
  (add-hook 'haskell-mode-hook
            (lambda nil
              (turn-on-haskell-indentation)
              (hindent-mode)
              (haskell-decl-scan-mode)
              (stack-mode)
              ;; (interactive-haskell-mode)
              ;; (structured-haskell-mode)
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
