module Tests exposing (all)

import Test exposing (Test, describe)

import Tests.Common
import Tests.Models.Action
import Tests.Models.Player
import Tests.Routing.Routes

all : Test
all =
  describe "Slack Wolf"
    [ Tests.Common.all
    , Tests.Models.Action.all
    , Tests.Models.Player.all
    , Tests.Routing.Routes.all
    ]
