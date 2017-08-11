module Routing.Parsers exposing (urlParser)

import Navigation

import Routing.Routes exposing (Route(..), decode)
import Messages exposing (Msg(..))

urlParser : Navigation.Location -> Msg
urlParser location =
  let
    route : Route
    route = decode location

  in case route of
    HomeRoute ->
      ShowHome

    GameRoute gameId ->
      ShowGame gameId

    NoRoute ->
      ShowHome
