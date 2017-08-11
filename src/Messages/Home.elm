module Messages.Home exposing (HomeMsg(..))

import Material

type HomeMsg
  = Mdl (Material.Msg HomeMsg)
  | GameCardClicked String
  | Raise Int
