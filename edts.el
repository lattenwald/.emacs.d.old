(use-package edts
  :ensure t
  :config
  (add-hook 'erlang-mode-hook
            (lambda ()
              (company-mode 0)
              (auto-complete-mode 1)
              (flycheck-mode 1))))

(use-package erlang
  :ensure t
  :config
  (eval-after-load "erlang-mode"
    (progn
      (define-key erlang-mode-map (kbd ">") nil)
      (define-key erlang-mode-map (kbd "<RET>") 'newline-and-indent)))
  (setq erlang-root-dir "/usr/local/Cellar/erlang/19.0.2/lib/erlang")
  (add-to-list 'exec-path "/usr/local/Cellar/erlang/19.0.2/lib/erlang/bin")

  ;; prevent annoying hang-on-compile
  (defvar inferior-erlang-prompt-timeout t)
  ;; default node name to emacs@localhost
  (setq inferior-erlang-machine-options '("-sname" "emacs")))

(message "loaded erlang support from edts.el")
