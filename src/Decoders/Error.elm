module Decoders.Error exposing (errorDecoder)

import Json.Decode.Pipeline exposing (decode, required)
import Json.Decode exposing (Decoder, int, string)

import Models.Error exposing (ErrorModel)

errorDecoder: Decoder ErrorModel
errorDecoder =
  decode ErrorModel
    |> required "statusCode" int
    |> required "error" string
    |> required "message" string
