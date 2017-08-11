module Models.Game exposing (GameModel)

import Date exposing (Date)

import Models.Player exposing (PlayerModel)
import Models.Round exposing (RoundModel)

type alias GameModel =
  { id : String
  , startTime : Date
  , endTime : Date
  , players : List PlayerModel
  , rounds : List RoundModel
  }
