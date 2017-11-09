(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-arguments nil)
 '(ag-context-lines 0)
 '(ag-highlight-search t)
 '(ag-ignore-list
   (quote
	("bower_components" "output" "abbrev_defs" "bookmarks" "edts" "smex-items" "ido.last")))
 '(ag-reuse-buffers t)
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/.emacs-backups"))))
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(bookmark-version-control (quote nospecial))
 '(browse-url-browser-function (quote browse-url-chrome))
 '(company-dabbrev-downcase nil)
 '(company-global-modes (quote (not ledger-mode iESS-mode)))
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
	("5eb4b22e97ddb2db9ecce7d983fa45eb8367447f151c7e1b033af27820f43760" "6254372d3ffe543979f21c4a4179cd819b808e5dd0f1787e2a2a647f5759c1d1" "57d7e8b7b7e0a22dc07357f0c30d18b33ffcbb7bcd9013ab2c9f70748cfa4838" "595099e6f4a036d71de7e1512656e9375dd72cf60ff69a5f6d14f0171f1de9c1" "9a3c51c59edfefd53e5de64c9da248c24b628d4e78cc808611abd15b3e58858f" "b4fd44f653c69fb95d3f34f071b223ae705bb691fb9abaf2ffca3351e92aa374" "f831c1716ebc909abe3c851569a402782b01074e665a4c140e3e52214f7504a0" "2ae4b0c50dd49a5f74edeae3e49965bf8853954b63c5712a7967ea0a008ecd5b" "5f4dfda04fbf7fd55228266c8aab73953d3087cea7fd06dd7f8ff1e4a497c739" "b0ab5c9172ea02fba36b974bbd93bc26e9d26f379c9a29b84903c666a5fde837" "e56ee322c8907feab796a1fb808ceadaab5caba5494a50ee83a13091d5b1a10c" default)))
 '(delete-old-versions t)
 '(edts-api-async-node-init t)
 '(edts-man-root "/Users/aleksandrkusev/.emacs.d/edts/doc/19.0")
 '(elm-compile-arguments (quote ("--yes" "--warn" "--output=elm.js")))
 '(erlang-indent-level 2)
 '(ess-ask-for-ess-directory nil)
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
 '(flycheck-ledger-pedantic t)
 '(flycheck-perl-docker-include-path (quote ("/home/sites/newapi/perl/api")))
 '(flycheck-perl-executable "/Users/aleksandrkusev/git/otvet.mail.ru/_perl.sh")
 '(flycheck-perl-include-path nil)
 '(flycheck-perl-perlcritic-executable nil)
 '(flycheck-perlcritic-severity 3)
 '(flycheck-psc-executable "psc")
 '(gh-api-v3-authenticator (quote gh-oauth-authenticator))
 '(git-commit-fill-column 150)
 '(global-company-mode t)
 '(global-emojify-mode nil)
 '(global-fixmee-mode t)
 '(global-flycheck-mode t)
 '(global-linum-mode t)
 '(global-nlinum-mode nil)
 '(global-whitespace-mode t)
 '(haskell-align-imports-pad-after-name t)
 '(haskell-ask-also-kill-buffers nil)
 '(haskell-interactive-types-for-show-ambiguous nil)
 '(haskell-mode-hook (quote (haskell-decl-scan-mode haskell-indentation-mode)))
 '(haskell-process-type (quote stack-ghci))
 '(haskell-tags-on-save t)
 '(ido-buffer-disable-smart-matches nil)
 '(ido-enable-flex-matching t)
 '(ido-use-faces nil)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-strict-missing-semi-warning nil)
 '(kept-new-versions 6)
 '(ledger-init-file-name "~/.ledgerrc")
 '(ledger-mode-should-check-version nil)
 '(ledger-post-amount-alignment-at :decimal)
 '(ledger-post-amount-alignment-column 52)
 '(ledger-post-use-completion-engine :ido)
 '(linum-delay t)
 '(linum-format (quote dynamic))
 '(lua-indent-level 2)
 '(magit-delete-by-moving-to-trash nil)
 '(magit-diff-refine-hunk (quote all))
 '(neo-theme (quote ascii))
 '(ns-use-srgb-colorspace nil)
 '(org-jira-coding-system (quote utf8))
 '(org-jira-serv-alist nil)
 '(org-support-shift-select t)
 '(osx-browse-mode t)
 '(osx-browse-prefer-browser "com.google.Chrome")
 '(package-selected-packages
   (quote
	(macro-math cmake-mode kerl sunrise-x-checkpoints ht sunrise-commander company projectile-ripgrep ripgrep-projectile ripgrep dumb-jump haskell-mode flycheck-rust racer cargo rust-mode osx-browse ag sqlup-mode sql-indent linum-off neotree racket-mode elm-yasnippets inf-ruby erlang yasnippet flycheck-dialyxir yagist web-mode magit flycheck-mix emojify atom-one-dark-theme org-jira hledger-mode flycheck-ledger pcre2el bookmark+ buttercup evil-mode color-theme-modern yaml-mode vimrc-mode undo-tree spaceline smart-tabs-mode projectile perlbrew nginx-mode markdown-mode lua-mode ledger-mode js2-mode idomenu go-mode gitignore-mode flycheck-elm flycheck-dialyzer flx-ido fixmee exec-path-from-shell elm-mode dockerfile-mode diminish apache-mode alchemist)))
 '(pcre-mode nil)
 '(powerline-height 20)
 '(projectile-global-mode t)
 '(projectile-globally-ignored-file-suffixes (quote ("beam")))
 '(projectile-ignored-project-function (quote file-remote-p))
 '(projectile-use-git-grep t)
 '(psc-ide-executable "psc-ide-client")
 '(psc-ide-server-executable "psc-ide-server")
 '(repl-toggle-mode t)
 '(require-final-newline nil)
 '(safe-local-variable-values (quote ((flycheck-checker . perl-docker))))
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(show-paren-when-point-in-periphery t)
 '(show-paren-when-point-inside-paren nil)
 '(sql-indent-offset 1)
 '(sr-listing-switches "--group-directories-first -alDhgG")
 '(sr-show-hidden-files t)
 '(sr-speedbar-default-width 20 t)
 '(sr-speedbar-right-side nil t)
 '(tags-revert-without-query t)
 '(tramp-default-method "sshx")
 '(tramp-ssh-controlmaster-options
   "-o ControlMaster=auto -o ControlPath='~/.ssh/master-%%r@%%h:%%p' -o ControlPersist=yes" t)
 '(tramp-use-ssh-controlmaster-options nil)
 '(tramp-verbose 3)
 '(version-control t)
 '(whitespace-style (quote (face trailing space-before-tab empty))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cperl-array-face ((t (:inherit font-lock-variable-name-face))))
 '(cperl-hash-face ((t (:inherit font-lock-variable-name-face))))
 '(fixmee-notice-face ((t (:background "yellow1" :foreground "black"))))
 '(flycheck-error ((t (:underline "Red1"))))
 '(flycheck-warning ((t (:underline "DarkOrange"))))
 '(whitespace-trailing ((t nil))))
