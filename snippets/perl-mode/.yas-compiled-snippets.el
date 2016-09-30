;;; Compiled snippets and support files for `perl-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'perl-mode
                     '(("new" "#!/usr/bin/env perl\nuse strict;\nuse warnings;" "new Perl script" nil nil nil "/Users/aleksandrkusev/.emacs.d/snippets/perl-mode/new.pl" nil nil)
                       ("dd" "use Data::Dumper;\n$Data::Dumper::Useqq = 1;\n{\n	no warnings 'redefine';\n	sub Data::Dumper::qquote { return qq(\"$_[0]\"); };\n}" "Data::Dumper qq" nil nil nil "/Users/aleksandrkusev/.emacs.d/snippets/perl-mode/ddqq.pl" nil nil)))


;;; Do not edit! File generated at Tue Sep 20 17:06:00 2016
