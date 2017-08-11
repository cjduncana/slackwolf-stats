module Tests.Models.Action exposing (all)

import ElmTestBDDStyle exposing (expect, it, to)
import Expect exposing (equal)
import Test exposing (Test, describe)

import Models.Action exposing (..)
import Models.Player exposing (PlayerModel, Role(..))

all : Test
all =
  describe "Action Model"
    [ describe "lynchedUsername"
      [ it "should say noone was lynched if all of the votes were for noone" <|
          expect (lynchedUsername [sampleAction]) to equal <|
            "No one was lynched"
      , it "should say that @jane.doe was lynched if she's recieved the most votes" <|
          expect (lynchedUsername [sampleActionWithObject]) to equal <|
            "@jane.doe"
      , it "should say that @alvaro was lynched" <|
          expect (lynchedUsername firstDay) to equal "@alvaro"
      ]
    , describe "withVotes"
      [ it "should return all players who voted for a player" <|
          expect (withVotes firstDay) to equal <|
            [ firstDayFirstAction
            , firstDaySecondAction
            , firstDayFourthAction
            ]
      ]
    , describe "mostFrequentObjects"
      [ it "should return the player that was the object the most" <|
          expect (mostFrequentObjects [firstDayFirstAction, firstDaySecondAction , firstDayFourthAction]) to equal [alvaro]
      ]
    , describe "toActionString"
      [ it "should return the action performed as a String" <|
          expect (toActionString sampleAction) to equal <|
            "@john.doe votes for noone"
      ]
    ]

sampleAction : ActionModel
sampleAction =
  { id = "5170ca11-f5b7-4b92-b29c-e9b0b81f2dce"
  , subject =
    { id = "5af0ddd3-c656-4920-bd29-d7e0dba3fb8c"
    , username = "@john.doe"
    , role = Seer
    , death = Nothing
    }
  , verb = Vote
  , object = Nothing
  }

sampleActionWithObject : ActionModel
sampleActionWithObject =
  let
    object_ : PlayerModel
    object_ =
      { id = "e68c151c-85a1-4d12-af33-2587eae4f865"
      , username = "@jane.doe"
      , role = Werewolf
      , death = Nothing
      }

  in
    { sampleAction | object = Just object_ }

alvaro : PlayerModel
alvaro =
  { id = "207aca14-04c3-4e03-8091-9a4f8f65c337"
  , username = "@alvaro"
  , role = Villager
  , death = Just "f15c38b2-5adc-464c-94cc-521821284d5e"
  }

firstDayFirstAction : ActionModel
firstDayFirstAction =
  { id = "60790525-2d63-4c98-b922-49efe8197d42"
  , subject =
    { id = "bc6b193e-a0e7-428e-940b-ba3b23420c5b"
    , username = "@cristiano.amici"
    , role = Hunter
    , death = Nothing
    }
  , verb = Vote
  , object = Just alvaro
  }

firstDaySecondAction : ActionModel
firstDaySecondAction =
  { id = "4001ae3a-a24b-4c93-b34c-f90cb31cb5e8"
  , subject = alvaro
  , verb = Vote
  , object = Just
    { id = "96f1ddcf-e56f-4055-9755-e6466f49f667"
    , username = "@figueroa"
    , role = Witch
    , death = Nothing
    }
  }

firstDayThirdAction : ActionModel
firstDayThirdAction =
  { id = "bc907887-8d5c-4323-b95f-fd8b6e307ce8"
  , subject =
    { id = "96f1ddcf-e56f-4055-9755-e6466f49f667"
    , username = "@figueroa"
    , role = Witch
    , death = Nothing
    }
  , verb = Vote
  , object = Nothing
  }

firstDayFourthAction : ActionModel
firstDayFourthAction =
  { id = "b4812e49-7c88-4f1d-ad43-380ca9bc365b"
  , subject =
    { id = "c4e97513-992c-437a-95be-61b37b1562d3"
    , username = "@avargas"
    , role = Seer
    , death = Nothing
    }
  , verb = Vote
  , object = Just alvaro
  }

firstDay : List ActionModel
firstDay =
  [ firstDayFirstAction
  , firstDaySecondAction
  , firstDayThirdAction
  , firstDayFourthAction
  -- , { id = "2042c6d4-48cb-4066-8b96-54f3a0bbd34d"
  --   , subject =
  --     { id = "6dad5a4c-59c3-447e-8778-6693805aa722"
  --     , username = "@cjduncana"
  --     , role = Werewolf
  --     , death = Just "d356747f-8a1e-41f9-991b-095198c8f425"
  --     }
  --   , verb = Vote
  --   , object = Just
  --     { id = "207aca14-04c3-4e03-8091-9a4f8f65c337"
  --     , username = "@alvaro"
  --     , role = Villager
  --     , death = Just "f15c38b2-5adc-464c-94cc-521821284d5e"
  --     }
  --   }
  -- , { id = "51db0b0c-d1ec-40d1-a912-66cfed258571"
  --   , subject =
  --     { id = "aed340be-03d4-4da8-add7-a88e2bc72b14"
  --     , username = "@rdeeb"
  --     , role = Villager
  --     , death = Nothing
  --     }
  --   , verb = Vote
  --   , object = Just
  --     { id = "207aca14-04c3-4e03-8091-9a4f8f65c337"
  --     , username = "@alvaro"
  --     , role = Villager
  --     , death = Just "f15c38b2-5adc-464c-94cc-521821284d5e"
  --     }
  --   }
  -- , { id = "9717037f-b357-4884-9a85-ecc3aff2a091"
  --   , subject =
  --     { id = "58067546-a787-4fbd-9bd2-92bf3f7839ed"
  --     , username = "@aristides.melendez"
  --     , role = Werewolf
  --     , death = Just "39bd8fd2-83e1-42cf-a915-b81fe93bb828"
  --     }
  --   , verb = Vote
  --   , object = Just
  --     { id = "207aca14-04c3-4e03-8091-9a4f8f65c337"
  --     , username = "@alvaro"
  --     , role = Villager
  --     , death = Just "f15c38b2-5adc-464c-94cc-521821284d5e"
  --     }
  --   }
  ]
