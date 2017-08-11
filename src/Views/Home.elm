module Views.Home exposing (homeView)

import Html exposing (Html, div)

import Messages.Home exposing (HomeMsg)
import Models.Game exposing (GameModel)
import Models.Home exposing (HomeModel)
import Views.Home.PastGames as PastGames
import Views.Home.Stats as StatsView

homeView : List GameModel -> HomeModel -> Html HomeMsg
homeView games homeModel =
  div []
    [ StatsView.view games
    , PastGames.view games homeModel
    ]
