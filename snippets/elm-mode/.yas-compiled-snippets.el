;;; Compiled snippets and support files for `elm-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'elm-mode
                     '(("module" "module $1 exposing ($2)\n\n$0" "module" nil nil nil "/Users/aleksandrkusev/.emacs.d/snippets/elm-mode/module" nil nil)
                       ("elm" "import Html exposing ($1)\n\n\n-- MODEL\n\ntype alias Model = { $2 }\n\n\n-- UPDATE\n\ntype Msg = Reset | $3\n\nupdate : Msg -> Model -> Model\nupdate msg model =\n  case msg of\n    Reset -> $4\n\n\n-- VIEW\n\nview : Model -> Html Msg\nview model =\n  $5" "elm architecture template" nil nil nil "/Users/aleksandrkusev/.emacs.d/snippets/elm-mode/elm-architecture-module" nil nil)))


;;; Do not edit! File generated at Tue Sep 20 17:06:00 2016
