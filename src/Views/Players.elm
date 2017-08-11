module Views.Players exposing (view)

import Html exposing (Html, div, h4, text)
import Material.Card as Card
import Material.Elevation as Elevation
import Material.Grid exposing (Cell, Device(All), cell, grid, size)

import Models.Player exposing (PlayerModel, toRoleString)

view : List PlayerModel -> Html msg
view players =
  div []
    [ titleView
    , grid [] <| List.map playerCell players
    ]

titleView : Html msg
titleView =
  div []
    [ h4 []
      [ text "Players" ]
    ]

playerCell : PlayerModel -> Cell msg
playerCell player =
  cell [ size All 4 ] [ playerCard player ]

playerCard : PlayerModel -> Html msg
playerCard player =
  Card.view [ Elevation.e2 ]
    [ Card.title []
      [ Card.head [] [ text player.username ]
      , Card.subhead [] [ text <| toRoleString player.role ]
      ]
    ]
