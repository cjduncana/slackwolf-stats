module Decoders.Players exposing (..)

import Json.Decode exposing (Decoder, andThen, list, maybe, string)
import Json.Decode.Pipeline exposing (decode, required)

import Models.Player exposing (PlayerModel, Role(..))

playerDecoder : Decoder PlayerModel
playerDecoder =
  decode PlayerModel
    |> required "id" string
    |> required "username" string
    |> required "role" (andThen roleDecoder string)
    |> required "death" (maybe string)

playersDecoder : Decoder (List PlayerModel)
playersDecoder =
  list playerDecoder

roleDecoder : String -> Decoder Role
roleDecoder string =
  let
    role : Role
    role =
      case string of
        "seer" -> Seer
        "witch" -> Witch
        "hunter" -> Hunter
        "werewolf" -> Werewolf
        "villager" -> Villager
        "beholder" -> Beholder
        "bodyguard" -> Bodyguard
        "lycan" -> Lycan
        "wolfman" -> Wolfman
        "sorceress" -> Sorceress
        "tanner" -> Tanner
        _ -> Unknown

  in
    decode role
