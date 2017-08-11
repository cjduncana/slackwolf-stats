module Models.Round exposing (RoundModel)

import Models.Action exposing (ActionModel)

type alias RoundModel =
  { id : String
  , actions : List ActionModel
  }
