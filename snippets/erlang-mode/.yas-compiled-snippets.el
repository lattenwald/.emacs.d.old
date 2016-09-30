;;; Compiled snippets and support files for `erlang-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'erlang-mode
                     '(("%%" "%%====================================================================\n%% $1\n%%====================================================================\n" "structural comment" nil nil nil "/Users/aleksandrkusev/.emacs.d/snippets/erlang-mode/structural_comment" nil nil)
                       ("app" "{application, $1,\n [{description, \"$2\"},\n  {vsn, \"0.1.0\"},\n  {registered, []},\n  {applications, [kernel, stdlib]},\n  {mod, {$3, []}},\n  {env, []}\n ]}\n" "rebar3 app.src" nil nil nil "/Users/aleksandrkusev/.emacs.d/snippets/erlang-mode/rebar3_app" nil nil)))


;;; Do not edit! File generated at Tue Sep 20 17:06:00 2016
