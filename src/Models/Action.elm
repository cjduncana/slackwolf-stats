module Models.Action exposing (ActionModel, Verb(..), lynchedUsername, mostFrequentObjects, toActionString, withVotes)

import Common exposing (hasMost, isSomething)
import Models.Player exposing (PlayerModel, countPlayers)

type alias ActionModel =
  { id : String
  , subject : PlayerModel
  , verb : Verb
  , object : Maybe PlayerModel
  }

type Verb
  = Unknown
  -- Seer
  | See
  -- Witch
  | Heal
  | Poison
  -- Team Werewolf
  | Kill
  -- Everyone
  | Vote

lynchedUsername : List ActionModel -> String
lynchedUsername actions =
  let
    possiblyLynched : List PlayerModel
    possiblyLynched =
      withVotes actions
        |> mostFrequentObjects

  in
    if List.length possiblyLynched == 1 then
      List.head possiblyLynched
        |> Maybe.map .username
        |> Maybe.withDefault "No one was lynched"
    else
      "No one was lynched"

withVotes : List ActionModel -> List ActionModel
withVotes =
  List.filter votedForSomeOne

votedForSomeOne : ActionModel -> Bool
votedForSomeOne action =
  (voted action) && (hasObject action)

voted : ActionModel -> Bool
voted { verb } =
  verb == Vote

hasObject : ActionModel -> Bool
hasObject { object } =
  isSomething object

mostFrequentObjects : List ActionModel -> List PlayerModel
mostFrequentObjects actions =
  let
    getObjects : ActionModel -> List PlayerModel -> List PlayerModel
    getObjects { object } previousObjects =
      case object of
        Nothing ->
          previousObjects

        Just object_ ->
          previousObjects ++ [ object_ ]

    objects : List PlayerModel
    objects =
      List.foldl getObjects [] actions

    idToObjects : String -> List PlayerModel
    idToObjects id =
      List.filter (\object -> object.id == id) objects

    idToObject : String -> List PlayerModel -> List PlayerModel
    idToObject id previousObjects =
      previousObjects ++ idToObjects id

  in
    countPlayers objects
      |> hasMost
      |> List.foldl idToObject []

toActionString : ActionModel -> String
toActionString { subject, verb, object } =
  String.join " "
    [ subject.username
    , toVerbString verb
    , toObjectString object
    ]

toVerbString : Verb -> String
toVerbString verb =
  case verb of
    See ->
      "sees"
    Heal ->
      "heals"
    Poison ->
      "poisons"
    Kill ->
      "kills"
    Vote ->
      "votes for"
    Unknown ->
      "???"

toObjectString : Maybe PlayerModel -> String
toObjectString maybeObject =
  case maybeObject of
    Just object ->
      object.username

    Nothing ->
      "noone"
