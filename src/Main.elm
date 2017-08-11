module Main exposing (main)

import Navigation

import Messages exposing (Msg)
import Models exposing (Model, model, View(..))
import Models.Home exposing (initialHomeModel)
import Routing.Parsers exposing (urlParser)
import Routing.Routes exposing (Route(..), decode)
import Requests exposing (requestGame, requestGames)
import Update exposing (update)
import Views exposing (view)

main : Program Never Model Msg
main =
  Navigation.program urlParser
    { init = init
    , update = update
    , view = view
    , subscriptions = always Sub.none
    }

init : Navigation.Location -> (Model, Cmd Msg)
init location =
  let
    route : Route
    route = decode location

  in case route of
    HomeRoute ->
      ( model <| Home initialHomeModel, requestGames )

    GameRoute gameId ->
      ( model <| Empty "", requestGame gameId )

    NoRoute ->
      ( model <| Home initialHomeModel, requestGames )
