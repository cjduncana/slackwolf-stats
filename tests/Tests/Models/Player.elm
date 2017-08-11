module Tests.Models.Player exposing (all)

import Dict exposing (singleton)
import ElmTestBDDStyle exposing (expect, it, to)
import Expect exposing (equal)
import Test exposing (Test, describe)

import Models.Player exposing (..)

all : Test
all =
  describe "Player Model"
    [ describe "countPlayers"
      [ it "should return a Dict with one item in it" <|
          expect (countPlayers [samplePlayer, samplePlayer]) to equal <|
            singleton "b1f50648-f759-4e31-a061-ce9dd947de3c" 2
      ]
    , describe "toRoleString"
      [ it "should return Seer when a Seer is provided" <|
          expect (toRoleString Seer) to equal "Seer"
      , it "should return Witch when a Witch is provided" <|
          expect (toRoleString Witch) to equal "Witch"
      , it "should return Hunter when a Hunter is provided" <|
          expect (toRoleString Hunter) to equal "Hunter"
      , it "should return Werewolf when a Werewolf is provided" <|
          expect (toRoleString Werewolf) to equal "Werewolf"
      , it "should return Villager when a Villager is provided" <|
          expect (toRoleString Villager) to equal "Villager"
      , it "should return Beholder when a Beholder is provided" <|
          expect (toRoleString Beholder) to equal "Beholder"
      , it "should return Bodyguard when a Bodyguard is provided" <|
          expect (toRoleString Bodyguard) to equal "Bodyguard"
      , it "should return Lycan when a Lycan is provided" <|
          expect (toRoleString Lycan) to equal "Lycan"
      , it "should return Wolfman when a Wolfman is provided" <|
          expect (toRoleString Wolfman) to equal "Wolfman"
      , it "should return Sorceress when a Sorceress is provided" <|
          expect (toRoleString Sorceress) to equal "Sorceress"
      , it "should return Tanner when a Tanner is provided" <|
          expect (toRoleString Tanner) to equal "Tanner"
      ]
    ]

samplePlayer : PlayerModel
samplePlayer =
  { id = "b1f50648-f759-4e31-a061-ce9dd947de3c"
  , username = "@john.doe"
  , role = Seer
  , death = Nothing
  }
