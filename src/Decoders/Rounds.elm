module Decoders.Rounds exposing (..)

import Json.Decode.Pipeline exposing (decode, required)
import Json.Decode exposing (Decoder, andThen, list, string)

import Decoders.Actions exposing (actionsDecoder)
import Models.Round exposing (RoundModel)

roundDecoder : Decoder RoundModel
roundDecoder =
  decode RoundModel
    |> required "id" string
    |> required "actions" actionsDecoder

roundsDecoder : Decoder (List RoundModel)
roundsDecoder =
  list roundDecoder
