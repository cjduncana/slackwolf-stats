module Views.Home.PastGames exposing (view)

import Html exposing (Html, div, h3, h4, text)
import Html.Events exposing (onClick, onMouseEnter, onMouseLeave)
import Material.Card as Card
import Material.Elevation as Elevation
import Material.Grid exposing (Cell, Device(All), cell, grid, size)
import Material.Options as Options

import Common exposing (countingIndex, toDateTimeString)
import Messages.Home exposing (HomeMsg(..))
import Models.Game exposing (GameModel)
import Models.Home exposing (HomeModel)

view : List GameModel -> HomeModel -> Html HomeMsg
view games homeModel =
  let
    info : List (GameModel, HomeModel)
    info =
      List.map (\game -> (game, homeModel)) games

  in
    div []
      [ titleView
      , grid [] <| List.indexedMap gameCell info
      ]

titleView : Html HomeMsg
titleView =
  div []
    [ h3 []
      [ text "Past Games" ]
    ]

gameCell : Int -> (GameModel, HomeModel) -> Cell HomeMsg
gameCell index info =
  cell [ size All 4 ] [ gameCard index info ]

gameCard : Int -> (GameModel, HomeModel) -> Html HomeMsg
gameCard index (game, homeModel) =
  Card.view
    [ if (homeModel.raised == index) then Elevation.e8 else Elevation.e2
    , Elevation.transition 250
    , Options.attribute <| onMouseEnter (Raise index)
    , Options.attribute <| onMouseLeave (Raise -1)
    , Options.attribute <| onClick (GameCardClicked game.id)
    ]
    [ Card.title []
      [ Card.head [] [ text <| "Game #" ++ countingIndex index ]
      ]
    , Card.text []
      [ div [] [ text <| "Start Time: " ++ toDateTimeString game.startTime ]
      , div [] [ text <| "End Time: " ++ toDateTimeString game.endTime ]
      ]
    ]
