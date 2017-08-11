module Views.Game.Detail exposing (gameDetailView)

import Date exposing (Date)
import Html exposing (Html, div, h3, text)

import Common exposing (toDateTimeString)
import Messages.Game.Detail exposing (GameDetailMsg)
import Models.GameDetail exposing (GameDetailModel)
import Views.Players as PlayersView
import Views.Rounds as RoundsView

gameDetailView : GameDetailModel -> Html GameDetailMsg
gameDetailView { game } =
  div []
    [ titleView game.startTime
    , PlayersView.view game.players
    , RoundsView.view game
    ]

titleView : Date -> Html GameDetailMsg
titleView startTime =
  h3 [] [ text <| toDateTimeString startTime ]
