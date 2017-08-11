module Views.Header exposing (view)

import Html exposing (Attribute, Html, div, h1, h2, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)

import Messages exposing (Msg(HeaderClicked))

view : Html Msg
view =
  div
    [ alignCenter
    , onClick HeaderClicked
    ]
    [ titleView
    , subtitleView
    ]

titleView : Html Msg
titleView =
  div []
    [ h1 []
      [ text "Slackwolf Stats" ]
    ]

subtitleView : Html Msg
subtitleView =
  div []
    [ h2 []
      [ text "Display all the information needed for optimal Werewolf strategy" ]
    ]

alignCenter : Attribute Msg
alignCenter =
  style [ ("text-align", "center") ]
