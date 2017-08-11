module Updates.Game.Detail exposing (update)

import Messages.Game.Detail exposing (GameDetailMsg)
import Models.GameDetail exposing (GameDetailModel)

update : GameDetailMsg -> GameDetailModel -> (GameDetailModel, Cmd GameDetailMsg)
update message model =
  (model, Cmd.none)
