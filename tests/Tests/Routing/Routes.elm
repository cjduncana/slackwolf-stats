module Tests.Routing.Routes exposing (all)

import ElmTestBDDStyle exposing (expect, it, to)
import Expect exposing (equal)
import Navigation
import Test exposing (Test, describe)

import Routing.Routes exposing (Route(..), decode, encode)

all : Test
all =
  describe "Routes"
    [ describe "decode"
      [ it "should return No Route if there was no matching path" <|
          expect (decode wrongLocation) to equal (NoRoute)
      , it "should return the Home Route if an empty path is provided" <|
          expect (decode emptyLocation) to equal (HomeRoute)
      , it "should return the Game Route if '/games/a-uuid' in path is provided" <|
          expect (decode gameLocation) to equal (GameRoute "5eba0d06-a83c-44f0-925c-6ef9671385a2")
      ]
    , describe "encode"
      [ it "should return the Home URL if the the Home Route is provided" <|
          expect (encode HomeRoute) to equal ("/#/")
      , it "should return the Game URL with the Game UUID if the Game Route is provided with that Game UUID" <|
          expect (encode <| GameRoute "48caf33c-7413-4681-a017-eabefb969a75") to equal ("/#/games/48caf33c-7413-4681-a017-eabefb969a75")
      , it "should return the Home URL if No Route is provided" <|
          expect (encode NoRoute) to equal ("/#/")
      ]
    ]

emptyLocation : Navigation.Location
emptyLocation =
  Navigation.Location "" "" "" "" "" "" "" "" "#/" "" ""

-- TODO: Replace this with a fuzz test
wrongLocation : Navigation.Location
wrongLocation =
  { emptyLocation | hash = "#/wrong-path" }

gameLocation : Navigation.Location
gameLocation =
  { emptyLocation | hash = "#/games/5eba0d06-a83c-44f0-925c-6ef9671385a2" }
