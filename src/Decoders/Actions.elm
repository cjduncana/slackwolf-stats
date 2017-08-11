module Decoders.Actions exposing (..)

import Json.Decode exposing (Decoder, andThen, list, map, maybe, string)
import Json.Decode.Pipeline exposing (decode, optional, required)

import Decoders.Players exposing (playerDecoder)
import Models.Action exposing (ActionModel, Verb(..))

actionDecoder : Decoder ActionModel
actionDecoder =
  decode ActionModel
    |> required "id" string
    |> required "subject" playerDecoder
    |> required "verb" (andThen verbDecoder string)
    |> optional "object" (maybe playerDecoder) Nothing

actionsDecoder : Decoder (List ActionModel)
actionsDecoder =
  list actionDecoder

verbDecoder : String -> Decoder Verb
verbDecoder string =
  let
    verb : Verb
    verb =
      case string of
        "see" -> See
        "heal" -> Heal
        "poison" -> Poison
        "kill" -> Kill
        "vote" -> Vote
        _ -> Unknown

  in
    decode verb
