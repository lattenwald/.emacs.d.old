;; flycheck erlang stuff stolen from
;; http://blog.erlware.org/getting-flymake-and-rebar-to-play-nice/

(defun ebm-find-rebar-top-recr (dirname)
  (let* ((project-dir (locate-dominating-file dirname "rebar.config")))
    (if project-dir
        (let* ((parent-dir (file-name-directory (directory-file-name project-dir)))
               (top-project-dir (if (and parent-dir (not (string= parent-dir "/")))
                                    (ebm-find-rebar-top-recr parent-dir)
                                  nil)))
          (if top-project-dir
              top-project-dir
            project-dir))
      project-dir)))

(defun ebm-find-rebar-top ()
  (interactive)
  (let* ((dirname (file-name-directory (buffer-file-name)))
         (project-dir (ebm-find-rebar-top-recr dirname)))
    (if project-dir
        project-dir
      (erlang-flymake-get-app-dir))))

(use-package auto-highlight-symbol
  :ensure t
  :config
  (add-hook 'auto-highlight-symbol-mode
            (lambda ()
              (protect-my-bindings auto-highlight-symbol-mode-map))))

(defun ebm-directory-dirs (dir name)
  "Find all directories in DIR."
  (unless (file-directory-p dir)
    (error "Not a directory `%s'" dir))
  (let ((dir (directory-file-name dir))
        (dirs '())
        (files (directory-files dir nil nil t)))
    (dolist (file files)
      (unless (member file '("." ".."))
        (let ((absolute-path (expand-file-name (concat dir "/" file))))
          (when (file-directory-p absolute-path)
            (if (string= file name)
                (setq dirs (append (cons absolute-path
                                         (ebm-directory-dirs absolute-path name))
                                   dirs))
              (setq dirs (append
                          (ebm-directory-dirs absolute-path name)
                          dirs)))))))
    dirs))

(defun ebm-get-deps-code-path-dirs ()
  (ebm-directory-dirs (ebm-find-rebar-top) "ebin"))

(defun ebm-get-deps-include-dirs ()
  (ebm-directory-dirs (ebm-find-rebar-top) "include"))

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
  :init
  (add-to-list 'auto-mode-alist '("\\`rebar\\.config\\'" . erlang-mode))
  :config
  (eval-after-load "erlang-mode"
    (progn
      (define-key erlang-mode-map (kbd ">") nil)
      (define-key erlang-mode-map (kbd "<RET>") 'newline-and-indent)))
  (add-hook 'erlang-mode-hook
            (lambda ()
              (mapc (lambda (a) (add-to-list 'flycheck-erlang-library-path a))
                    (ebm-get-deps-code-path-dirs))
              (flycheck-select-checker 'erlang)
              (fixmee-mode t)
              (setq indent-tabs-mode    nil
                    tab-stop-list       ()
                    tab-width           4
					erlang-indent-level 4
					comment-start "%%")
              ;; (mapc (lambda (a) (add-to-list 'flycheck-erlang-include-path a))
              ;;       (ebm-get-deps-include-dirs)))
            ))
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

(use-package kerl
  :ensure t
  :config
  (kerl-use "18.3-dev"))

(message "loaded erlang support from erlang.el")
