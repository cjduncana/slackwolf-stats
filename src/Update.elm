module Update exposing (update)

import Http
import Json.Decode exposing (decodeString)
import Material
import RemoteData exposing (RemoteData(..))

import Decoders.Error exposing (errorDecoder)
import Messages exposing (Msg(..))
import Models exposing (Model, View(..))
import Models.Error exposing (ErrorModel, basicError)
import Models.GameDetail exposing (GameDetailModel)
import Models.Home exposing (initialHomeModel)
import Requests exposing (requestGame, requestGames)
import Routing.Navigate exposing (goToHome)
import Updates.Game.Detail
import Updates.Home as Home

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    GameResponse response ->
      case response of
        NotAsked ->
          (model, Cmd.none)

        Loading ->
          (model, Cmd.none)

        Failure err ->
          addErrorToModel model err

        Success game ->
          let
            newGameDetailModel : GameDetailModel
            newGameDetailModel = GameDetailModel game

            newModel : Model
            newModel = { model | current = GameDetail newGameDetailModel }
          in
            (newModel, Cmd.none)

    GamesResponse response ->
      case response of
        NotAsked ->
          let
            newModel = { model | current = Home initialHomeModel }
          in
            (newModel, Cmd.none)

        Loading ->
          let
            newModel = { model | current = Home initialHomeModel }
          in
            (newModel, Cmd.none)

        Failure err ->
          addErrorToModel model err

        Success games ->
          let
            newModel : Model
            newModel =
              { model
              | games = games
              , current = Home initialHomeModel
              }

          in
            (newModel, Cmd.none)

    ShowHome ->
      (model, requestGames)

    ShowGame gameId ->
      (model, requestGame gameId)

    Mdl message ->
      Material.update message model

    ChangeGameDetail message ->
      case model.current of
        GameDetail currentModel ->
          let
            (updatedGameDetailModel, cmd) = Updates.Game.Detail.update message currentModel
            updatedModel = { model | current = GameDetail updatedGameDetailModel }
          in
            (updatedModel, Cmd.map ChangeGameDetail cmd)

        _ ->
          (model, Cmd.none)

    ChangeHome message ->
      let
        (updatedModel, cmd) = Home.update message model
      in
        (updatedModel, Cmd.map ChangeHome cmd)

    HeaderClicked ->
      (model, goToHome)

addErrorToModel : Model -> Http.Error -> (Model, Cmd Msg)
addErrorToModel model error =
  let
    log1 = Debug.log "Model" model
    log2 = Debug.log "Error" error

    newModel : Model
    newModel =
      case error of
        Http.BadPayload message response ->
          { model | current = Empty message }

        Http.BadStatus { body } ->
          let
            result : Result String ErrorModel
            result = decodeString errorDecoder body

            error : ErrorModel
            error = Result.withDefault basicError result

          in
            { model | current = Empty error.message }

        _ ->
          { model | current = Empty <| toString error }

  in
    (newModel, Cmd.none)
