(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-ignore-list (quote ("bower_components" "output")))
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/.emacs-backups"))))
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(company-dabbrev-downcase nil)
 '(company-global-modes (quote (not ledger-mode)))
 '(company-idle-delay 0.15)
 '(cperl-auto-newline-after-colon t)
 '(cperl-close-paren-offset 0)
 '(cperl-continued-statement-offset 4)
 '(cperl-electric-keywords t)
 '(cperl-electric-parens nil)
 '(cperl-electric-parens-mark nil)
 '(cperl-electric-parens-string "\"\"")
 '(cperl-hairy t)
 '(cperl-highlight-variables-indiscriminately t)
 '(cperl-indent-parens-as-block t)
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   (quote
    ("b0ab5c9172ea02fba36b974bbd93bc26e9d26f379c9a29b84903c666a5fde837" "e56ee322c8907feab796a1fb808ceadaab5caba5494a50ee83a13091d5b1a10c" default)))
 '(delete-old-versions t)
 '(edts-api-async-node-init t)
 '(edts-man-root "/Users/aleksandrkusev/.emacs.d/edts/doc/19.0")
 '(exec-path-from-shell-arguments (quote ("-l")))
 '(fixmee--listview-local-only t t)
 '(fixmee-notice-regexp
   "\\(\\_<\\(?:[Tt][Oo][Dd][Oo]+\\|[Bb][Uu][Gg]\\|[Ff][Ii][Xx][Mm][Ee]+\\|XXX+\\)\\)\\(?:[/:?!.    
]+\\|-+\\(?:\\s-\\|[
]\\)\\|\\_>\\)")
 '(flx-ido-mode t)
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(flycheck-completion-system (quote ido))
 '(flycheck-ghc-args (quote ("-fno-warn-unused-do-bind")))
 '(flycheck-perl-include-path (quote ("." "lib" "../../lib" "../api")))
 '(flycheck-perlcritic-severity 3)
 '(flycheck-psc-executable "psc")
 '(git-commit-fill-column 150)
 '(global-company-mode t)
 '(global-fixmee-mode t)
 '(global-flycheck-mode t)
 '(global-linum-mode t)
 '(global-nlinum-mode nil)
 '(global-whitespace-mode t)
 '(haskell-ask-also-kill-buffers nil)
 '(haskell-process-type (quote stack-ghci))
 '(haskell-tags-on-save t)
 '(ido-buffer-disable-smart-matches nil)
 '(ido-enable-flex-matching t)
 '(ido-use-faces nil)
 '(indent-tabs-mode nil)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-strict-missing-semi-warning nil)
 '(kept-new-versions 6)
 '(ledger-init-file-name "~/.hledger.journal")
 '(ledger-mode-should-check-version nil)
 '(ledger-post-use-completion-engine :ido)
 '(linum-delay t)
 '(linum-format (quote dynamic))
 '(lua-indent-level 2)
 '(magit-diff-refine-hunk (quote all))
 '(ns-use-srgb-colorspace nil)
 '(org-support-shift-select t)
 '(package-selected-packages
   (quote
    (pcre2el bookmark+ buttercup helm-projectile evil-mode neotree color-theme-modern yaml-mode web-mode web-beautify vimrc-mode undo-tree sunrise-x-checkpoints spaceline smex smart-tabs-mode repl-toggle racket-mode psci psc-ide projectile perlbrew nginx-mode markdown-mode magit lua-mode ledger-mode js2-mode inf-ruby idomenu hindent helm-ag go-mode gitignore-mode gist flycheck-elm flycheck-dialyzer flx-ido fixmee exec-path-from-shell ess elm-yasnippets elm-mode edts dockerfile-mode diminish company-ghc apache-mode alchemist ag ack)))
 '(pcre-mode nil)
 '(powerline-height 20)
 '(projectile-global-mode t)
 '(projectile-globally-ignored-file-suffixes (quote ("beam")))
 '(projectile-ignored-project-function (quote file-remote-p))
 '(psc-ide-executable "psc-ide-client")
 '(psc-ide-server-executable "psc-ide-server")
 '(repl-toggle-mode t)
 '(show-paren-mode t)
 '(show-paren-style (quote expression))
 '(show-paren-when-point-in-periphery t)
 '(show-paren-when-point-inside-paren nil)
 '(sr-listing-switches "--group-directories-first -alDhgG")
 '(sr-show-hidden-files t)
 '(sr-speedbar-default-width 20 t)
 '(sr-speedbar-right-side nil t)
 '(tramp-default-method "ssh")
 '(tramp-ssh-controlmaster-options
   "-o ControlMaster=auto -o ControlPath='~/.ssh/master-%%r@%%h:%%p' -o ControlPersist=yes" t)
 '(tramp-use-ssh-controlmaster-options nil)
 '(version-control t)
 '(whitespace-style (quote (face trailing space-before-tab empty))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack"))))
 '(cperl-array-face ((t (:inherit font-lock-variable-name-face))))
 '(cperl-hash-face ((t (:inherit font-lock-variable-name-face))))
 '(fixmee-notice-face ((t (:background "yellow1" :foreground "black"))))
 '(whitespace-trailing ((t (:background "gray37" :foreground "yellow" :weight bold)))))
