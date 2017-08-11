module Messages exposing (Msg(..))

import Material
import RemoteData exposing (WebData)

import Messages.Game.Detail exposing (GameDetailMsg)
import Messages.Home exposing (HomeMsg)
import Models.Game exposing (GameModel)

type Msg
  = GameResponse (WebData GameModel)
  | GamesResponse (WebData (List GameModel))
  | ShowGame String
  | ShowHome
  | ChangeGameDetail GameDetailMsg
  | ChangeHome HomeMsg
  | HeaderClicked
  | Mdl (Material.Msg Msg)
