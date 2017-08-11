module Requests exposing (requestGame, requestGames)

import Http
import RemoteData

import Decoders.Games exposing (gameDecoder, gamesDecoder)
import Messages exposing (Msg(..))

requestGame : String -> Cmd Msg
requestGame gameId =
  Http.get (gameUrl gameId) gameDecoder
    |> RemoteData.sendRequest
    |> Cmd.map GameResponse

requestGames : Cmd Msg
requestGames =
  Http.get gamesUrl gamesDecoder
    |> RemoteData.sendRequest
    |> Cmd.map GamesResponse

baseUrl : String
baseUrl =
  "http://localhost:3000/api"

gameUrl : String -> String
gameUrl gameId =
  gamesUrl ++ "/" ++ gameId

gamesUrl : String
gamesUrl =
  baseUrl ++ "/games"
