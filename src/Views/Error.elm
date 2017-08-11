module Views.Error exposing (view)

import Html exposing (Html, div, text)

import Messages exposing (Msg)

view : String -> Html Msg
view message =
  div [] [ text message ]
