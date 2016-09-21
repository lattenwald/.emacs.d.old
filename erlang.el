(use-package auto-highlight-mode
  :config
  (add-hook 'auto-highlight-symbol-mode
            (lambda ()
              (protect-my-bindings auto-highlight-symbol-mode-map))))

(use-package edts
  :disabled t
  :ensure t
  :config
  (require 'edts-start)
  (defun edts-man--fetch-vsns ()
    (with-current-buffer (url-retrieve-synchronously edts-man-download-url)
      (goto-char (point-min))
      (let ((case-fold-search t)
            (re "<a href=\"\\(?:.*/\\)?\\(otp_doc_man_\\(.*?\\)\\.tar\\.gz\\)\">")
            vsn-urls)
        (while (< (point) (point-max))
          (re-search-forward re nil 'move-point)
          (push (cons (match-string 2) (match-string 1)) vsn-urls))
        (kill-buffer)
        vsn-urls)))
  (eval-after-load "edts-mode"
    (progn
      (define-key edts-mode-map (kbd "C-h f") 'edts-show-doc-under-point)
      (define-key edts-mode-map (kbd "C-h F") 'edts-find-doc))))

(use-package erlang
  :ensure t
  :config
  (eval-after-load "erlang-mode"
    (progn
      (define-key erlang-mode-map (kbd ">") nil)
      (define-key erlang-mode-map (kbd "<RET>") 'newline-and-indent)))
  ;; (setq erlang-root-dir "/usr/local/Cellar/erlang/19.0.2/lib/erlang")
  ;; (add-to-list 'exec-path "/usr/local/Cellar/erlang/19.0.2/lib/erlang/bin")

  ;; prevent annoying hang-on-compile
  (defvar inferior-erlang-prompt-timeout t)
  ;; default node name to emacs@localhost
  (setq inferior-erlang-machine-options '("-name" "emacs@localhost"))
  (setq erl-nodename-cache (make-symbol "emacs@localhost"))
  )

(use-package flycheck-dialyzer
  :ensure t
  :config
  ;; (require 'flycheck-dialyzer)
  (add-hook 'erlang-mode-hook 'flycheck-mode))

(message "loaded erlang support from erlang.el")
