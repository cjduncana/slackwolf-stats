module Decoders.Games exposing (gameDecoder, gamesDecoder)

import Json.Decode exposing (Decoder, list, string)
import Json.Decode.Extra exposing (date)
import Json.Decode.Pipeline exposing (decode, required)

import Decoders.Players exposing (playersDecoder)
import Decoders.Rounds exposing (roundsDecoder)
import Models.Game exposing (GameModel)

gameDecoder : Decoder GameModel
gameDecoder =
  decode GameModel
    |> required "id" string
    |> required "startTime" date
    |> required "endTime" date
    |> required "players" playersDecoder
    |> required "rounds" roundsDecoder

gamesDecoder : Decoder (List GameModel)
gamesDecoder =
  list gameDecoder
