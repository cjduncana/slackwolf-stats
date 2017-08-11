module Models.Player exposing (PlayerModel, Role(..), countPlayers, toRoleString)

import Dict exposing (Dict)

import Common exposing (increaseCount)

type alias PlayerModel =
  { id : String
  , username : String
  , role : Role
  , death : Maybe String
  }

type Role
  = Seer
  | Witch
  | Hunter
  | Werewolf
  | Villager
  | Beholder
  | Bodyguard
  | Lycan
  | Wolfman
  | Sorceress
  | Tanner
  | Unknown

toRoleString : Role -> String
toRoleString role =
  case role of
    Seer ->
      "Seer"
    Witch ->
      "Witch"
    Hunter ->
      "Hunter"
    Werewolf ->
      "Werewolf"
    Villager ->
      "Villager"
    Beholder ->
      "Beholder"
    Bodyguard ->
      "Bodyguard"
    Lycan ->
      "Lycan"
    Wolfman ->
      "Wolfman"
    Sorceress ->
      "Sorceress"
    Tanner ->
      "Tanner"
    Unknown ->
      "???"

countPlayers : List PlayerModel -> Dict String Int
countPlayers players =
  List.foldl countPlayer Dict.empty players

countPlayer : PlayerModel -> Dict String Int -> Dict String Int
countPlayer { id } count =
  if Dict.member id count then
    Dict.update id increaseCount count
  else
    Dict.insert id 1 count
