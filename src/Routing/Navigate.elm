module Routing.Navigate exposing (goToGame, goToHome)

import Navigation

import Routing.Routes exposing (Route(..), encode)

goToGame : String -> Cmd msg
goToGame gameId =
  Navigation.newUrl (encode <| GameRoute gameId)

goToHome : Cmd msg
goToHome =
  Navigation.newUrl (encode HomeRoute)
