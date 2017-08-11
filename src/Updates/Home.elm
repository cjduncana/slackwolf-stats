module Updates.Home exposing (update)

import Material

import Messages.Home exposing (HomeMsg(..))
import Models exposing (Model, View(Home))
import Models.Home exposing (HomeModel)
import Routing.Navigate exposing (goToGame)

update : HomeMsg -> Model -> (Model, Cmd HomeMsg)
update message model =
  case message of
    GameCardClicked gameId ->
      (model, goToGame gameId)

    Raise gameCardIndex ->
      let
        newCurrent = Home <| HomeModel gameCardIndex
      in
        { model | current = newCurrent } ! []

    Mdl message ->
      Material.update message model
