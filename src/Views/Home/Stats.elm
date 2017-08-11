module Views.Home.Stats exposing (view)

import Html exposing (Attribute, Html, div, h3, text)

import Models.Game exposing (GameModel)
import Messages.Home exposing (HomeMsg)

view : List GameModel -> Html HomeMsg
view games =
  div []
    [ titleView
    , gamesPlayedView games
    ]

titleView : Html HomeMsg
titleView =
  div []
    [ h3 []
      [ text "Current Stats" ]
    ]

gamesPlayedView : List GameModel -> Html HomeMsg
gamesPlayedView games =
  div []
    [ List.length games
      |> toString
      |> (++) "Games Played: "
      |> text
    ]
