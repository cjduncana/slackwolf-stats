module Routing.Routes exposing (Route(..), decode, encode)

import Navigation
import UrlParser exposing (Parser, (</>), s, string, map, oneOf, parseHash)

type Route
  = HomeRoute
  | GameRoute String
  | NoRoute

encode : Route -> String
encode route =
  case route of
    HomeRoute ->
      baseHash

    GameRoute gameId ->
      baseHash ++ "games/" ++ gameId

    NoRoute ->
      baseHash

baseHash : String
baseHash =
    "/#/"

decode : Navigation.Location -> Route
decode location =
  Maybe.withDefault NoRoute <| parseHash routeParser location

routeParser : Parser (Route -> a) a
routeParser =
  oneOf
    [ map HomeRoute homeParser
    , map GameRoute gameParser
    ]

homeParser : Parser a a
homeParser =
  (s "")

gameParser : Parser (String -> a) a
gameParser =
  (s "games" </> string)
