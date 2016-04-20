(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-ignore-list (quote ("bower_components" "output")))
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/.emacs-backups"))))
 '(company-dabbrev-downcase nil)
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
 '(delete-old-versions t)
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
 '(flycheck-perl-include-path (quote ("." "lib" "../../lib")))
 '(flycheck-psc-executable "psc-ide-client")
 '(git-commit-fill-column 150)
 '(global-company-mode t)
 '(global-fixmee-mode t)
 '(global-linum-mode t)
 '(global-whitespace-mode t)
 '(haskell-ask-also-kill-buffers nil)
 '(haskell-process-type (quote stack-ghci))
 '(haskell-tags-on-save t)
 '(ido-buffer-disable-smart-matches nil)
 '(ido-enable-flex-matching t)
 '(ido-use-faces nil)
 '(indent-tabs-mode nil)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(js2-basic-offset 2)
 '(js2-strict-missing-semi-warning nil)
 '(kept-new-versions 6)
 '(ledger-init-file-name nil)
 '(ledger-mode-should-check-version nil)
 '(ledger-post-use-completion-engine :ido)
 '(linum-format (quote dynamic))
 '(lua-indent-level 2)
 '(ns-use-srgb-colorspace nil)
 '(org-support-shift-select t)
 '(powerline-height 20)
 '(projectile-global-mode t)
 '(projectile-ignored-project-function (quote file-remote-p))
 '(psc-ide-executable "psc-ide-client")
 '(psc-ide-server-executable "psc-ide-server")
 '(purescript-mode-hook (quote (turn-on-purescript-indentation)))
 '(repl-toggle-mode t)
 '(sr-listing-switches "--group-directories-first -alDhgG")
 '(sr-show-hidden-files t)
 '(sr-speedbar-default-width 20 t)
 '(sr-speedbar-right-side nil t)
 '(tramp-default-method "ssh")
 '(tramp-ssh-controlmaster-options
   "-o ControlMaster=auto -o ControlPath='~/.ssh/master-%%r@%%h:%%p' -o ControlPersist=yes")
 '(tramp-use-ssh-controlmaster-options nil)
 '(version-control t)
 '(whitespace-style (quote (face trailing space-before-tab empty))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Hack"))))
 '(cperl-array-face ((t (:inherit font-lock-variable-name-face))))
 '(cperl-hash-face ((t (:inherit font-lock-variable-name-face))))
 '(fixmee-notice-face ((t (:background "yellow1" :foreground "black")))))
