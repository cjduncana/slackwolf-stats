module Views.Rounds exposing (view)

import Html exposing (Html, b, div, h3, p, text)
import Material.Card as Card
import Material.Elevation as Elevation
import Material.Grid exposing (Cell, Device(All), cell, grid, size)

import Common exposing (countingIndex)
import Models.Action exposing (ActionModel, lynchedUsername, toActionString)
import Models.Game exposing (GameModel)
import Models.Round exposing (RoundModel)

view : GameModel -> Html msg
view { rounds } =
  div []
    [ titleView
    , roundsGrid rounds
    ]

titleView : Html msg
titleView =
  div []
    [ h3 []
      [ text "Game Rounds" ]
    ]

roundsGrid : List RoundModel -> Html msg
roundsGrid rounds =
  grid [] <| List.indexedMap roundCell rounds

roundCell : Int -> RoundModel -> Cell msg
roundCell index round =
  cell [ size All 12 ] [ roundCard index round ]

roundCard : Int -> RoundModel -> Html msg
roundCard index { actions } =
  let
    log = Debug.log "Actions" actions
  in
    Card.view
      [ Elevation.e2
      , size All 12
      ]
      [ Card.title []
        [ Card.head [] [ text <| "Round #" ++ countingIndex index ]
        , Card.subhead [] [ text <| dayOrNight index ]
        ]
      , Card.text []
          [ actionsView actions
          , resultsView index actions
          ]
      ]

dayOrNight : Int -> String
dayOrNight round =
  if isDay round then
    "Day"
  else
    "Night"

isDay : Int -> Bool
isDay round =
  round % 2 == 1

actionsView : List ActionModel -> Html msg
actionsView actions =
  div []
    [ b [] [ text "Actions:" ]
    , actionsGrid actions
    ]

actionsGrid : List ActionModel -> Html msg
actionsGrid actions =
  grid [] <| List.map actionCell actions

actionCell : ActionModel -> Cell msg
actionCell action =
  cell [ size All 4 ] [ actionView action ]

actionView : ActionModel -> Html msg
actionView action =
  p [] [ text <| toActionString action ]

resultsView : Int -> List ActionModel -> Html msg
resultsView round actions =
  if isDay round then
    div []
      [ b [] [ text "Results:" ]
      , p [] [ text <| "Lynched: " ++ lynchedUsername actions ]
      ]
  else
    div [] []
